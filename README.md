# Projet Outil simplifié d'analyse des paniers d'achat 🛒

## Structure du Projet 🗂️

Le projet est divisé en deux parties principales :
- `frontend/` : Application Vue 3 avec TypeScript
- `backend/` : Serveur Node.js avec Express et MongoDB

## Prérequis 📋

Avant de commencer, assurez-vous d'avoir installé :
- Node.js (version 18.x ou supérieure recommandée)
- npm (version 9.x ou supérieure recommandée)
- MongoDB (version 6.x ou supérieure recommandée)

## Installation 📥

### Étape 1 : Cloner le Projet

```bash
git clone https://github.com/abdo-6/eco-dashboard.git
cd eco-dashboard
```

### Étape 2 : Installation des Dépendances

#### Frontend
```bash
cd frontend
npm install
```

#### Backend
```bash
cd ../backend
npm install
```

## Configuration 🔧

### Configuration Backend

1. Créez un fichier `.env` dans le dossier `backend/` en utisant la commande suivante: 

```bash
cp .env.example .env
```

avec les variables suivantes :

```env
# MONGODB URI
MONGO_DB_URI= #'mongodb+srv://<votre_nom_utilisateur>:<votre_mot_de_passe>@<url_cluster>/<nom_de_votre_base_de_donnees>?retryWrites=true&w=majority'

# PORT DU SERVEUR
PORT=5000

# URL DU SERVEUR POUR LA PRODUCTION
HOST_URL= # https://domaine.com (Optionnel pour la production)
```

Après la configuration de .env lancer cette commande depuis le dossier `backend/` pour  charger automatiquement les données dans les collections products et sales.

```bash
npx ts-node src/script/loadData.ts
```
## Scripts de Développement ⌨

### Frontend (Vue 3)
```bash
# Dans le dossier frontend/
npm run dev         # Lance le serveur de développement
npm run build       # Compile pour la production
npm run preview     # Prévisualise la version de production
```

### Backend (Node.js)
```bash
# Dans le dossier backend/
npm run dev         # Lance le serveur de développement avec rechargement automatique
npm run build       # Compile TypeScript en JavaScript
npm start           # Lance le serveur compilé
```

## Exécution du Projet en Développement 🚀

### Étape 1 : Démarrer MongoDB
Assurez-vous que MongoDB est en cours d'exécution :
```bash
mongod
```

### Étape 2 : Démarrer le Backend
```bash
# Dans le dossier backend/
# serveur local : http://localhost:5000
npm run dev
```

### Étape 3 : Démarrer le Frontend
```bash
# Dans le dossier frontend/
# serveur local : http://localhost:5173
npm run dev
```

## Déploiement en Production 🚀

### Compilation du Frontend
```bash
# Dans le dossier frontend/
# La commande suivante utilise l'option --emptyOutDir :
# Cela permet de s'assurer que le répertoire de sortie ('../backend/src/public') est vidé
# avant la génération des nouveaux fichiers. Cela évite les conflits ou
# la présence de fichiers inutiles laissés par des builds précédents.
npm run build -- --emptyOutDir  
```

### Compilation du Backend
```bash
# Dans le dossier backend/ 
npm run build     
```

### Lancement en Production
```bash
# Dans le dossier backend/
npm start
```

## Dépendances Principales 🔑

### Frontend
- Vue 3
- TypeScript
- Vite
- Chart.js

### Backend
- Express.js
- Mongoose
- TypeScript
- helmet           (Sécurise les en-têtes HTTP)
- cors

## Résolution des Problèmes Courants ❌

1. **Erreurs de compilation TypeScript** 
   - Vérifiez que toutes les dépendances `@types` sont correctement installées
   - Assurez-vous d'utiliser une version compatible de TypeScript

2. **Problèmes de connexion MongoDB**
   - Vérifiez que MongoDB est en cours d'exécution
   - Confirmez l'URI de connexion dans votre fichier `.env`

3. **Problèmes de Dépendances**
   - Exécutez `npm install` avec l'option `--legacy-peer-deps` si nécessaire
   - Supprimez le dossier `node_modules` et réinstallez les dépendances

## Contribution 🤝

1. Forkez le projet
2. Créez votre branche de fonctionnalité (`git checkout -b feature/NomDeLaFonctionnalite`)
3. Commitez vos modifications (`git commit -m "Ajout : Nouvelle fonctionnalité NomDeLaFonctionnalite"'`)
4. Poussez vers la branche (`git push origin feature/NomDeLaFonctionnalite`)
5. Ouvrez une Pull Request
    - Rendez-vous sur le dépôt d'origine : [https://github.com/abdo-6/eco-dashboard](https://github.com/abdo-6/eco-dashboard).  
    - Cliquez sur "Compare & Pull Request".  
    - Décrivez brièvement vos changements et soumettez la PR pour examen.  
6. Suivez les retours : Répondez aux commentaires ou aux suggestions des mainteneurs du projet pour ajuster votre contribution si nécessaire.  

# Démonstration 🎯

Le déploiement de cette application a été réalisé grâce à la plateforme d'applications cloud [Render](https://render.com/).

Veuillez noter que le serveur peut être lent, car j'utilise un plan gratuit.

Vous pouvez accéder à la version déployée du projet ici : [https://ecommerce-dashboard-i3dx.onrender.com](https://ecommerce-dashboard-i3dx.onrender.com)