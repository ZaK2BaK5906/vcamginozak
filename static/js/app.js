// Variables globales
let currentGrid = 2;

// Modal
const modal = document.getElementById('addCameraModal');
const addCameraBtn = document.getElementById('addCameraBtn');
const closeBtn = document.getElementsByClassName('close')[0];
const addCameraForm = document.getElementById('addCameraForm');

// Ouvrir le modal
addCameraBtn.onclick = function() {
    modal.style.display = 'block';
}

// Fermer le modal
closeBtn.onclick = function() {
    closeModal();
}

window.onclick = function(event) {
    if (event.target == modal) {
        closeModal();
    }
}

function closeModal() {
    modal.style.display = 'none';
    addCameraForm.reset();
}

// Soumettre le formulaire d'ajout de caméra
addCameraForm.onsubmit = async function(e) {
    e.preventDefault();

    const cameraName = document.getElementById('cameraName').value;
    const rtspUrl = document.getElementById('rtspUrl').value;

    try {
        const response = await fetch('/api/cameras', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                name: cameraName,
                rtsp_url: rtspUrl
            })
        });

        const data = await response.json();

        if (data.success) {
            showNotification('Caméra ajoutée avec succès !', 'success');
            closeModal();
            setTimeout(() => {
                location.reload();
            }, 1000);
        } else {
            showNotification('Erreur lors de l\'ajout de la caméra', 'error');
        }
    } catch (error) {
        console.error('Erreur:', error);
        showNotification('Erreur de connexion au serveur', 'error');
    }
}

// Supprimer une caméra
async function deleteCamera(cameraId) {
    if (!confirm('Êtes-vous sûr de vouloir supprimer cette caméra ?')) {
        return;
    }

    try {
        const response = await fetch(`/api/cameras/${cameraId}`, {
            method: 'DELETE'
        });

        const data = await response.json();

        if (data.success) {
            showNotification('Caméra supprimée avec succès !', 'success');
            const cameraElement = document.getElementById(`camera-${cameraId}`);
            if (cameraElement) {
                cameraElement.style.transition = 'all 0.3s';
                cameraElement.style.opacity = '0';
                cameraElement.style.transform = 'scale(0.8)';
                setTimeout(() => {
                    cameraElement.remove();
                    checkNoCameras();
                }, 300);
            }
        } else {
            showNotification('Erreur lors de la suppression', 'error');
        }
    } catch (error) {
        console.error('Erreur:', error);
        showNotification('Erreur de connexion au serveur', 'error');
    }
}

// Activer/Désactiver une caméra
async function toggleCamera(cameraId) {
    try {
        const response = await fetch(`/api/cameras/${cameraId}/toggle`, {
            method: 'POST'
        });

        const data = await response.json();

        if (data.success) {
            const toggleIcon = document.getElementById(`toggle-${cameraId}`);
            toggleIcon.textContent = data.enabled ? '⏸️' : '▶️';
            showNotification(data.enabled ? 'Caméra activée' : 'Caméra désactivée', 'success');

            setTimeout(() => {
                location.reload();
            }, 500);
        } else {
            showNotification('Erreur lors du changement d\'état', 'error');
        }
    } catch (error) {
        console.error('Erreur:', error);
        showNotification('Erreur de connexion au serveur', 'error');
    }
}

// Changer la disposition de la grille
function setGridLayout(columns) {
    currentGrid = columns;
    const grid = document.getElementById('cameraGrid');

    // Retirer toutes les classes de grille
    grid.classList.remove('grid-1', 'grid-2', 'grid-3', 'grid-4');

    // Ajouter la nouvelle classe
    grid.classList.add(`grid-${columns}`);

    // Mettre à jour le style des boutons
    document.querySelectorAll('[id^="gridBtn"]').forEach(btn => {
        btn.classList.remove('active');
    });

    const activeBtn = document.getElementById(`gridBtn${columns}`);
    if (activeBtn) {
        activeBtn.classList.add('active');
    }
}

// Rafraîchir toutes les caméras
function refreshAllCameras() {
    showNotification('Rafraîchissement en cours...', 'info');
    setTimeout(() => {
        location.reload();
    }, 500);
}

// Vérifier s'il n'y a pas de caméras
function checkNoCameras() {
    const cameraGrid = document.getElementById('cameraGrid');
    if (cameraGrid.children.length === 0) {
        const noCamerasDiv = document.createElement('div');
        noCamerasDiv.id = 'noCameras';
        noCamerasDiv.className = 'no-cameras';
        noCamerasDiv.innerHTML = `
            <h2>Aucune caméra configurée</h2>
            <p>Cliquez sur le bouton "Ajouter une Caméra" pour commencer</p>
        `;
        cameraGrid.parentNode.insertBefore(noCamerasDiv, cameraGrid.nextSibling);
    }
}

// Afficher une notification
function showNotification(message, type) {
    // Créer l'élément de notification
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;

    // Ajouter les styles inline
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 25px;
        border-radius: 5px;
        color: white;
        font-weight: 600;
        z-index: 10000;
        animation: slideIn 0.3s;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    `;

    // Couleurs selon le type
    switch(type) {
        case 'success':
            notification.style.background = '#28a745';
            break;
        case 'error':
            notification.style.background = '#dc3545';
            break;
        case 'info':
            notification.style.background = '#17a2b8';
            break;
    }

    document.body.appendChild(notification);

    // Retirer après 3 secondes
    setTimeout(() => {
        notification.style.animation = 'slideOut 0.3s';
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, 3000);
}

// Ajouter les animations CSS
const style = document.createElement('style');
style.textContent = `
    @keyframes slideIn {
        from {
            transform: translateX(400px);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }

    @keyframes slideOut {
        from {
            transform: translateX(0);
            opacity: 1;
        }
        to {
            transform: translateX(400px);
            opacity: 0;
        }
    }

    .btn.active {
        background: #28a745 !important;
    }
`;
document.head.appendChild(style);

// Initialisation
document.addEventListener('DOMContentLoaded', function() {
    console.log('Application Multi-Caméras RTSP chargée');
    setGridLayout(currentGrid);
});
