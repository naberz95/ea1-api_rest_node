# 🚀 GUÍA DE DEPLOYMENT - Aplicación Multimedia

## 📋 Resumen del Deployment

- **Frontend**: Netlify (React)
- **Backend**: Railway o Render (Node.js/Express)
- **Base de Datos**: MongoDB Atlas (gratuito)

---

## ✅ PASO 1: Preparar la Base de Datos (MongoDB Atlas)

### 1.1 Crear cuenta en MongoDB Atlas
1. Ir a https://www.mongodb.com/cloud/atlas
2. Crear una cuenta gratuita
3. Crear un cluster gratuito (M0 - Shared Tier)

### 1.2 Obtener la Connection String
1. En MongoDB Atlas, ir a "Database" → "Connect"
2. Seleccionar "Drivers" y copiar la conexión string
3. Reemplazar `<password>` con tu contraseña
4. La URL será algo como: `mongodb+srv://user:password@cluster.mongodb.net/media_database?retryWrites=true&w=majority`

---

## ✅ PASO 2: Preparar el Repositorio Git

### 2.1 Inicializar Git (si no está iniciado)
```bash
cd c:\Users\Nolberto Gomez\Downloads\ea1-api_rest_node-main (1)\ea1-api_rest_node-main
git init
git add .
git commit -m "Initial commit"
```

### 2.2 Crear repositorio en GitHub
1. Ir a https://github.com/new
2. Crear un nuevo repositorio público
3. Seguir las instrucciones para conectar tu repositorio local
4. Push del código: `git push -u origin main`

---

## ✅ PASO 3: Desplegar Backend en Railway

### 3.1 Crear cuenta en Railway
1. Ir a https://railway.app
2. Registrarse con GitHub
3. Crear un nuevo proyecto

### 3.2 Conectar el Repositorio
1. Clickear en "New" → "GitHub Repo"
2. Seleccionar tu repositorio
3. Railway detectará automáticamente que es un proyecto Node.js

### 3.3 Configurar Variables de Entorno
1. En Railway, ir a "Variables"
2. Agregar las siguientes variables:
   ```
   MONGODB_URI=mongodb+srv://user:password@cluster.mongodb.net/media_database?retryWrites=true&w=majority
   PORT=5000
   NODE_ENV=production
   ```
3. Guardar

### 3.4 Deploy
1. Railroad hará el deploy automáticamente
2. Ver la URL del servidor en "Deployments"
3. **Guardar la URL (ej: https://tu-app.railway.app)**

---

## ✅ PASO 4: Actualizar Frontend con URL del Backend

### 4.1 Modificar el archivo de configuración del Frontend
Editar: `frontend/src/services/api.js`

Cambiar:
```javascript
const API_BASE_URL = 'http://localhost:3000/api';
```

Por (reemplazar con tu URL de Railway):
```javascript
const API_BASE_URL = 'https://tu-app.railway.app/api';
```

### 4.2 Commit y Push
```bash
git add frontend/src/services/api.js
git commit -m "Update API URL for production"
git push
```

---

## ✅ PASO 5: Desplegar Frontend en Netlify

### 5.1 Crear cuenta en Netlify
1. Ir a https://netlify.com
2. Registrarse con GitHub
3. Autorizar a Netlify para acceder a tus repositorios

### 5.2 Crear un nuevo sitio
1. Clickear "New site from Git"
2. Seleccionar tu repositorio
3. Configurar:
   - **Base directory**: `frontend`
   - **Build command**: `npm run build`
   - **Publish directory**: `frontend/build`

### 5.3 Configurar Variables de Entorno
1. En Netlify, ir a "Site settings" → "Build & deploy" → "Environment"
2. Agregar variable:
   ```
   REACT_APP_API_URL=https://tu-app.railway.app/api
   ```
3. Redeploy el sitio

### 5.4 Deploy
1. Netlify hará el deploy automáticamente
2. Tu sitio estará disponible en una URL como: `https://nombre-tu-app.netlify.app`

---

## 📝 CHECKLIST DE DEPLOYMENT

- [ ] Base de datos MongoDB Atlas creada y URL obtenida
- [ ] Repositorio GitHub creado y código pusheado
- [ ] Backend deployado en Railway/Render
- [ ] URL del backend guardada
- [ ] Frontend actualizado con URL del backend
- [ ] Frontend deployado en Netlify
- [ ] URLs finales compartidas

---

## 🔗 URLs FINALES (después del deployment)

**Frontend**: https://tu-app.netlify.app
**Backend**: https://tu-app.railway.app
**Base de Datos**: MongoDB Atlas

---

## 🆘 TROUBLESHOOTING

### El frontend no conecta con el backend
- Verificar que la URL del API en `api.js` sea correcta
- Verificar que el backend tenga CORS habilitado en `app.js`
- Revisar la consola del navegador (F12) para errores

### El backend no conecta con MongoDB Atlas
- Verificar que la MONGODB_URI sea correcta
- Asegurarse que la IP esté whitelisted en MongoDB Atlas
- Revisar los logs en Railway/Render

### El build del frontend falla
- Asegurarse que todas las dependencias estén en `package.json`
- Revisar los logs de build en Netlify
- Ejecutar `npm install` en la carpeta frontend localmente

---

## ✨ Alternativas Recomendadas

### Backend:
- **Railway** ⭐ (CLI simple, interfaz limpia)
- **Render** (Planes gratuitos con cold starts)
- **Heroku** (Anterior opción, ahora requiere tarjeta de crédito)

### Frontend:
- **Netlify** ⭐ (Recomendado, excelente integración con Git)
- **Vercel** (Optimizado para Next.js, funciona bien con React)
- **GitHub Pages** (Gratuito pero limitado)

---

## 📚 Recursos Útiles

- MongoDB Atlas: https://docs.mongodb.com/atlas/
- Railway Docs: https://docs.railway.app/
- Netlify Guide: https://docs.netlify.com/
- CORS en Express: https://expressjs.com/en/resources/middleware/cors.html
