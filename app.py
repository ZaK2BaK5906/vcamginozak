from flask import Flask, render_template, Response, jsonify, request
import cv2
import threading
import json
import os
from datetime import datetime

app = Flask(__name__)

# Dictionnaire pour stocker les flux vidéo
camera_streams = {}
camera_locks = {}

class VideoCamera:
    def __init__(self, rtsp_url, camera_id):
        self.rtsp_url = rtsp_url
        self.camera_id = camera_id
        self.video = None
        self.running = False
        self.frame = None
        self.lock = threading.Lock()

    def start(self):
        """Démarre le flux vidéo"""
        if not self.running:
            self.running = True
            self.video = cv2.VideoCapture(self.rtsp_url)
            # Configuration pour RTSP
            self.video.set(cv2.CAP_PROP_BUFFERSIZE, 1)
            threading.Thread(target=self._update_frame, daemon=True).start()

    def _update_frame(self):
        """Met à jour les frames en arrière-plan"""
        while self.running:
            if self.video and self.video.isOpened():
                success, frame = self.video.read()
                if success:
                    with self.lock:
                        self.frame = frame
            else:
                # Tentative de reconnexion
                self.video = cv2.VideoCapture(self.rtsp_url)
                self.video.set(cv2.CAP_PROP_BUFFERSIZE, 1)

    def get_frame(self):
        """Récupère la frame actuelle"""
        with self.lock:
            if self.frame is not None:
                ret, jpeg = cv2.imencode('.jpg', self.frame)
                return jpeg.tobytes()
        return None

    def stop(self):
        """Arrête le flux vidéo"""
        self.running = False
        if self.video:
            self.video.release()

def load_cameras():
    """Charge la configuration des caméras depuis le fichier JSON"""
    config_file = 'cameras_config.json'
    if os.path.exists(config_file):
        with open(config_file, 'r', encoding='utf-8') as f:
            return json.load(f)
    return {"cameras": []}

def save_cameras(cameras_data):
    """Sauvegarde la configuration des caméras"""
    with open('cameras_config.json', 'w', encoding='utf-8') as f:
        json.dump(cameras_data, f, indent=4, ensure_ascii=False)

def gen_frames(camera_id):
    """Génère les frames pour le streaming"""
    camera = camera_streams.get(camera_id)
    if not camera:
        return

    while True:
        frame = camera.get_frame()
        if frame:
            yield (b'--frame\r\n'
                   b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')

@app.route('/')
def index():
    """Page principale"""
    cameras_data = load_cameras()
    return render_template('index.html', cameras=cameras_data['cameras'])

@app.route('/video_feed/<camera_id>')
def video_feed(camera_id):
    """Route pour le flux vidéo d'une caméra"""
    return Response(gen_frames(camera_id),
                    mimetype='multipart/x-mixed-replace; boundary=frame')

@app.route('/api/cameras', methods=['GET'])
def get_cameras():
    """Récupère la liste des caméras"""
    cameras_data = load_cameras()
    return jsonify(cameras_data)

@app.route('/api/cameras', methods=['POST'])
def add_camera():
    """Ajoute une nouvelle caméra"""
    data = request.json
    cameras_data = load_cameras()

    new_camera = {
        "id": f"cam_{len(cameras_data['cameras']) + 1}",
        "name": data.get('name', 'Nouvelle Caméra'),
        "rtsp_url": data.get('rtsp_url', ''),
        "enabled": True
    }

    cameras_data['cameras'].append(new_camera)
    save_cameras(cameras_data)

    # Démarre le flux pour la nouvelle caméra
    start_camera_stream(new_camera['id'], new_camera['rtsp_url'])

    return jsonify({"success": True, "camera": new_camera})

@app.route('/api/cameras/<camera_id>', methods=['DELETE'])
def delete_camera(camera_id):
    """Supprime une caméra"""
    cameras_data = load_cameras()
    cameras_data['cameras'] = [c for c in cameras_data['cameras'] if c['id'] != camera_id]
    save_cameras(cameras_data)

    # Arrête le flux de la caméra
    stop_camera_stream(camera_id)

    return jsonify({"success": True})

@app.route('/api/cameras/<camera_id>/toggle', methods=['POST'])
def toggle_camera(camera_id):
    """Active/désactive une caméra"""
    cameras_data = load_cameras()

    for camera in cameras_data['cameras']:
        if camera['id'] == camera_id:
            camera['enabled'] = not camera['enabled']
            save_cameras(cameras_data)

            if camera['enabled']:
                start_camera_stream(camera_id, camera['rtsp_url'])
            else:
                stop_camera_stream(camera_id)

            return jsonify({"success": True, "enabled": camera['enabled']})

    return jsonify({"success": False, "error": "Camera not found"}), 404

def start_camera_stream(camera_id, rtsp_url):
    """Démarre le flux d'une caméra"""
    if camera_id not in camera_streams:
        camera = VideoCamera(rtsp_url, camera_id)
        camera.start()
        camera_streams[camera_id] = camera

def stop_camera_stream(camera_id):
    """Arrête le flux d'une caméra"""
    if camera_id in camera_streams:
        camera_streams[camera_id].stop()
        del camera_streams[camera_id]

def initialize_cameras():
    """Initialise tous les flux de caméras au démarrage"""
    cameras_data = load_cameras()
    for camera in cameras_data['cameras']:
        if camera.get('enabled', True):
            start_camera_stream(camera['id'], camera['rtsp_url'])

if __name__ == '__main__':
    print("=" * 60)
    print("📹 Application Multi-Caméras RTSP")
    print("=" * 60)
    print(f"🌐 Serveur démarré sur: http://localhost:5000")
    print(f"🕒 Heure de démarrage: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("=" * 60)
    print("💡 Ouvrez votre navigateur et accédez à http://localhost:5000")
    print("=" * 60)

    # Initialise les caméras configurées
    initialize_cameras()

    # Démarre l'application Flask
    app.run(host='0.0.0.0', port=5000, debug=False, threaded=True)
