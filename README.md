# 🎬 EA1 - Sistema de Gestión de Catálogo Multimedia

Sistema **full-stack** completo: **API REST (Node.js) + Frontend React** para gestionar películas, series y contenido audiovisual.  
Arquitectura limpia, código fácil de leer y sin módulo de autenticación.

---

## 📁 Estructura del Proyecto

```
📦 ea1-api_rest_node-main/   (Carpeta Principal)
│
├── 📂 backend/              (Backend Node.js + Express) ← Carpeta raíz = backend
│   ├── src/
│   ├── package.json
│   ├── .env
│   └── ...
│
├── 📂 frontend/             (Frontend React)
│   ├── src/
│   ├── public/
│   ├── package.json
│   └── ...
│
├── README.md                (Este archivo)
└── .gitignore
```

---

## 🚀 Instalación Rápida

### Opción 1: Instalar y Correr TODO Automáticamente

```bash
# Desde la raíz del proyecto
npm install

# Luego corre tanto backend como frontend:
npm start
```

### Opción 2: Instalar Manual (Paso a paso)

#### Terminal 1️⃣ - Backend

```bash
cd .                    # Ya estás en la raíz (que es el backend)
npm install             # Instala dependencias backend
npm run seed            # Carga datos iniciales (primera vez)
npm start               # Inicia servidor en puerto 3000
```

#### Terminal 2️⃣ - Frontend

```bash
cd frontend              # Entra a la carpeta frontend
npm install              # Instala dependencias React
npm start                # Inicia en puerto 3000 (auto-abre navegador)
```

---

## 🎬 Componentes del Proyecto

### ⚙️ Backend (API REST)
- **Framework**: Node.js 18+ + Express 5
- **Base de Datos**: MongoDB 4.4+
- **URL Base**: `http://localhost:3000/api`
- **Logging**: Morgan
- **Variables de Entorno**: dotenv

**Características:**
- Arquitectura por capas con SOLID principles
- CRUD completo para 5 módulos
- Validaciones de datos y relaciones
- Manejo robusto de errores
- Seeds de datos iniciales

### 🎨 Frontend (React Dashboard)
- **Framework**: React 19
- **UI**: Bootstrap 5
- **HTTP Client**: Axios
- **Routing**: React Router v5
- **Notificaciones**: SweetAlert2

**Características:**
- Dashboard con 6 módulos CRUD
- Interfaz responsiva y moderna
- Comunicación HTTP con API
- Validaciones en formularios
- Confirmaciones antes de eliminar

---

## 🔧 Tecnologías (Stack Completo)

### Backend

| Tecnología | Versión | Propósito |
|-----------|---------|----------|
| Node.js | 18+ | Runtime JavaScript |
| Express | 5.2.1 | Framework web |
| Mongoose | 9.2.4 | ODM MongoDB |
| MongoDB | 4.4+ | Base de datos |
| CORS | 2.8.6 | Control de solicitudes |
| Morgan | 1.10.1 | Logging HTTP |
| dotenv | 17.3.1 | Variables de entorno |

### Frontend

| Tecnología | Versión | Propósito |
|-----------|---------|----------|
| React | 19.2.4 | Librería UI |
| React DOM | 19.2.4 | Renderizado |
| React Router  | 5.3.4 | Enrutamiento |
| Bootstrap | 5.3.8 | Estilos CSS |
| Axios | 1.13.6 | HTTP Client |
| SweetAlert2 | 11.26.24 | Alertas bonitas |

---

## 🏗️ Arquitectura Backend (enfoque SOLID)

El código usa una estructura por capas simple:

- **`routes`**: endpoints HTTP
- **`controllers`**: manejo de request/response
- **`services`**: reglas de negocio
- **`repositories`**: acceso a datos
- **`models`**: esquemas de MongoDB

### Cómo se aplica SOLID:

- **Single Responsibility**: cada capa tiene una responsabilidad clara
- **Open/Closed**: las clases base (`BaseRepository`, `BaseCrudService`) se extienden sin modificar su núcleo
- **Liskov Substitution**: servicios especializados (`ActivableService`, `MediaService`) funcionan como los servicios base
- **Interface Segregation**: cada módulo depende solo de métodos que necesita
- **Dependency Inversion**: controladores dependen de servicios y servicios dependen de abstracciones de repositorio

---

## 📊 Módulos de la Aplicación

### Géneros
- Crear, listar, actualizar, eliminar
- Estado: Active/Inactive
- Endpoints: `GET/POST/PUT/DELETE /api/genres`

### Directores
- Crear, listar, actualizar, eliminar
- Estado: Active/Inactive
- Endpoints: `GET/POST/PUT/DELETE /api/directors`

### Productoras
- Crear, listar, actualizar, eliminar
- Estado: Active/Inactive
- Endpoints: `GET/POST/PUT/DELETE /api/producers`

### Tipos
- Crear, listar, actualizar, eliminar
- Endpoints: `GET/POST/PUT/DELETE /api/types`

### Media (Películas y Series)
- Crear, listar, actualizar, eliminar
- Validaciones de relaciones
- Endpoints: `GET/POST/PUT/DELETE /api/media`

**Reglas importantes del módulo Media:**

Al crear o actualizar media:
- `genre` debe existir y estar en `Active`
- `director` debe existir y estar en `Active`
- `producer` debe existir y estar en `Active`
- `type` debe existir
- `serial` debe ser único
- `url` debe ser única

---

## 📝 Ejemplos de Payloads

### Crear Género

```json
{
  "name": "Thriller",
  "status": "Active"
}
```

### Crear Director

```json
{
  "name": "Christopher Nolan",
  "status": "Active"
}
```

### Crear Productora

```json
{
  "name": "Warner Bros",
  "status": "Active",
  "slogan": "The Stuff That Dreams Are Made Of",
  "description": "Estudio principal de cine"
}
```

### Crear Tipo

```json
{
  "name": "Documental",
  "description": "Contenido audiovisual no ficción"
}
```

### Crear Media

```json
{
  "serial": "MOV-0001",
  "title": "Interstellar",
  "synopsis": "Un grupo de exploradores viaja por un agujero de gusano",
  "url": "https://example.com/interstellar",
  "coverImage": "https://example.com/interstellar.jpg",
  "releaseYear": 2014,
  "genre": "PUT_GENRE_ID_HERE",
  "director": "PUT_DIRECTOR_ID_HERE",
  "producer": "PUT_PRODUCER_ID_HERE",
  "type": "PUT_TYPE_ID_HERE"
}
```

---

## 🧪 Pruebas Sugeridas

### Con Postman

1. Crea un Environment con estas variables:
   ```
   baseUrl=http://localhost:3000/api
   genreId=
   directorId=
   producerId=
   typeId=
   mediaId=
   ```

2. Crea recursos en este orden:
   - `POST {{baseUrl}}/genres`
   - `POST {{baseUrl}}/directors`
   - `POST {{baseUrl}}/producers`
   - `POST {{baseUrl}}/types`
   - `POST {{baseUrl}}/media`

3. Prueba operaciones CRUD:
   - `GET {{baseUrl}}/media`
   - `GET {{baseUrl}}/media/{{mediaId}}`
   - `PUT {{baseUrl}}/media/{{mediaId}}`
   - `DELETE {{baseUrl}}/media/{{mediaId}}`

### Casos de Error Para Validar

1. Crear media con `genre` inexistente → Status 400
2. Crear dos medias con el mismo `serial` → Status 409
3. Consultar `GET /media/:id` con id mal formado → Status 400
4. Consultar `GET /media/:id` con id válido pero no existe → Status 404
5. Probar `GET /genres/active`, `GET /directors/active` → Status 200

---

## 📂 Estructura Detallada

### Backend Structure

```
backend/
├── src/
│   ├── app.js                      # Configuración Express
│   ├── server.js                   # Punto de entrada
│   ├── config/
│   │   └── database.js             # Conexión MongoDB
│   ├── models/                     # Schemas de Mongoose
│   │   ├── director.model.js
│   │   ├── genre.model.js
│   │   ├── media.model.js
│   │   ├── producer.model.js
│   │   └── type.model.js
│   ├── repositories/               # Acceso a datos
│   │   ├── BaseRepository.js
│   │   └── MediaRepository.js
│   ├── services/                   # Lógica de negocio
│   │   ├── BaseCrudService.js
│   │   ├── ActivableService.js
│   │   ├── director.service.js
│   │   ├── genre.service.js
│   │   ├── media.service.js
│   │   ├── producer.service.js
│   │   └── type.service.js
│   ├── controllers/                # Manejo de requests
│   │   ├── createCrudController.js
│   │   ├── director.controller.js
│   │   ├── genre.controller.js
│   │   ├── media.controller.js
│   │   ├── producer.controller.js
│   │   └── type.controller.js
│   ├── routes/                     # Endpoints
│   │   ├── index.js
│   │   ├── buildCrudRouter.js
│   │   ├── director.routes.js
│   │   ├── genre.routes.js
│   │   ├── media.routes.js
│   │   ├── producer.routes.js
│   │   └── type.routes.js
│   ├── middlewares/                # Middlewares
│   │   ├── errorHandlers.js
│   │   └── validateObjectId.js
│   ├── constants/
│   │   └── status.js
│   ├── utils/
│   │   ├── ApiError.js
│   │   └── asyncHandler.js
│   └── seed/
│       └── seed.js
├── package.json
├── .env
├── .gitignore
└── README.md
```

### Frontend Structure

```
frontend/
├── src/
│   ├── index.js                    # Punto de entrada
│   ├── App.js                      # Componente raíz
│   ├── App.css
│   ├── components/
│   │   ├── sidebar/
│   │   │   └── Sidebar.js
│   │   ├── home/
│   │   │   ├── Home.js
│   │   │   └── Home.css
│   │   ├── genres/
│   │   │   ├── Genres.js
│   │   │   └── Genres.css
│   │   ├── directors/
│   │   ├── producers/
│   │   ├── types/
│   │   └── media/
│   ├── services/
│   │   └── api.js                  # Cliente Axios
│   └── index.css
├── public/
│   ├── index.html
│   └── favicon.ico
├── package.json
├── .gitignore
└── README.md
```

---

## 🔐 Variables de Entorno

### Backend (.env)

```env
PORT=3000
MONGODB_URI=mongodb://127.0.0.1:27017/catalogo_multimedia
```

### Frontend (src/services/api.js)

```javascript
const API_BASE_URL = 'http://localhost:3000/api';
```

---

## ✅ Checklist de Funcionalidades

- ✅ Backend API REST funcional
- ✅ Frontend React responsivo
- ✅ Base de datos MongoDB conectada
- ✅ Arquitectura SOLID implementada
- ✅ CRUD completo (5 módulos)
- ✅ Validaciones de datos
- ✅ Seeds de datos iniciales
- ✅ SweetAlert2 para notificaciones
- ✅ Bootstrap 5 para UI
- ✅ React Router para navegación
- ✅ Axios para HTTP requests
- ✅ Manejo de errores
- ✅ Código limpio y modular

---

## 🎯 Mejoras Futuras (Opcionales)

1. **Tests Unitarios** - Jest para Backend y Frontend
2. **Autenticación** - JWT tokens y login
3. **Paginación** - Soporte para grandes datasets
4. **Validación Mejorada** - express-validator
5. **Seguridad** - helmet, rate-limiting, HTTPS
6. **Documentación API** - Swagger/OpenAPI
7. **Logging Estructurado** - Winston
8. **Búsqueda Avanzada** - Filtros y sorting
9. **Testing E2E** - Cypress o Playwright
10. **CI/CD** - GitHub Actions

---

## 💡 Notas para Desarrollo

- **Node.js v18** o superior requerido
- **MongoDB** debe estar corriendo localmente o configurado en `.env`
- Backend espera en `http://localhost:3000/api`
- Frontend (React) abre automáticamente en navegador
- Ambos pueden correr simultáneamente sin conflictos
- Git está configurado para ignorar `node_modules` en ambas partes

---

## 📄 Licencia

ISC

---

## 👨‍💻 Información del Proyecto

- **Tipo**: Full-Stack Web Application (Backend API + Frontend Dashboard)
- **Estado**: ✅ Listo para GitHub y entrega académica
- **Último update**: Marzo 2026
- **Autor**: Nolberto Gomez

---

**Proyecto listo para producción** ✅
5. Probar `GET /genres/active`, `GET /directors/active` y `GET /producers/active`.

## 🖥️ Frontend React - Dashboard Multimedia

### Características

- **Dashboard**: Panel de inicio con estadísticas
- **CRUD Modulos**: 
  - Géneros (con estado Active/Inactive)
  - Directores (con estado Active/Inactive)
  - Productoras (con estado Active/Inactive)
  - Tipos de contenido
  - Media (películas y series con validaciones de relaciones)
- **UI Responsivo**: Bootstrap 5 para diseño moderno
- **Notificaciones**: SweetAlert2 para confirmaciones y alertas
- **Navegación**: Navbar y Sidebar para acceso rápido

### Estructura del Frontend

```
src/
├── components/
│   ├── home/
│   │   ├── Home.js          # Dashboard principal
│   │   └── Home.css
│   ├── genres/
│   │   ├── GenreList.js     # Listar géneros
│   │   ├── GenreForm.js     # Crear/editar género
│   │   └── genres.css
│   ├── directors/
│   │   ├── DirectorList.js
│   │   ├── DirectorForm.js
│   │   └── directors.css
│   ├── producers/
│   ├── types/
│   ├── media/               # Módulo complejo con validaciones
│   │   ├── MediaList.js
│   │   ├── MediaForm.js
│   │   └── media.css
│   ├── Navbar.js
│   └── Sidebar.js
├── services/
│   └── api.js               # Cliente Axios centralizado
├── App.js
└── index.js
```

### Ejecutar el Frontend

```bash
cd ea1-frontend-react
npm install
npm start
```

El frontend estará disponible en: `http://localhost:3000`

---

## 🚀 Ejecutar el Proyecto Completo

### Terminal 1 - Backend (API)

```bash
cd ea1-api_rest_node-main
npm install
npm run seed    # Cargar datos iniciales (opcional en primera vez)
npm start       # Servidor en puerto 3000
```

### Terminal 2 - Frontend (React)

```bash
cd ea1-frontend-react
npm install
npm start       # Abre navegador en http://localhost:3000
```

### Requisitos Previos

- ✅ Node.js v18+
- ✅ MongoDB 4.4+ (local o remoto)
- ✅ Archivo `.env` configurado en el backend

---

## 📋 Checklist del Proyecto

- ✅ **Backend**: API REST funcional con CRUD completo
- ✅ **Base de Datos**: MongoDB con datos iniciales (seed)
- ✅ **Frontend**: Dashboard React con interfaz intuitiva
- ✅ **Arquitectura**: SOLID principles, sin duplicación de código
- ✅ **Dependencias**: Solo las necesarias, ninguna innecesaria
- ✅ **Validaciones**: Reglas de negocio en Media, relaciones foráneas
- ✅ **Testing**: Seeds de datos preparados para pruebas manuales

---

## 🔧 Stack Tecnológico Resumido

| Aspecto | Tecnología |
|--------|-----------|
| Backend | Node.js 18+ , Express 5 |
| Base de Datos | MongoDB 4.4+ |
| Frontend | React 19 |
| UI Framework | Bootstrap 5 |
| HTTP Client | Axios |
| Notificaciones | SweetAlert2 |
| Logging HTTP | Morgan |
| Variables de Entorno | dotenv |
| Router Frontend | React Router v5 |
