# Guion de Video: Frontend React - 5 Minutos

## INTRODUCCION (0:00 - 0:30)

"En este video te voy a mostrar cómo instalamos y configuramos el frontend React en nuestro proyecto. Te explicaré la estructura de carpetas, dónde están los archivos CSS y HTML de cada módulo, y cómo React se comunica con la API del backend."

**Mostrar en pantalla:** Pantalla de escritorio con VS Code abierto mostrando la estructura del proyecto.

---

## SECCION 1: INSTALACION DEL FRONTEND (0:30 - 1:15)

"Para instalar el frontend, necesitamos dos pasos simples."

**Paso 1: Navegar a la carpeta frontend**
```bash
cd frontend
```

"Primero entramos a la carpeta llamada 'frontend'. Esta carpeta contiene toda la aplicación React separada del backend."

**Mostrar en pantalla:** Terminal ejecutando el comando `cd frontend`. Mostrar la estructura en VS Code con la carpeta frontend expandida.

**Paso 2: Instalar las dependencias**
```bash
npm install
```

"Ejecutamos npm install. Esto descarga todas las librerías que React necesita para funcionar: React Router para navegación, Bootstrap para estilos, Axios para comunicarse con la API, y SweetAlert2 para las notificaciones bonitas."

**Mostrar en pantalla:** Terminal mostrando npm install en progreso. Después, mostrar el archivo package.json en VS Code con todas las dependencias listadas.

**Paso 3: Iniciar el servidor**
```bash
npm start
```

"Luego ejecutamos npm start. Esto inicia un servidor de desarrollo que abre automáticamente el navegador con nuestra aplicación."

**Mostrar en pantalla:** Terminal ejecutando npm start. Mostrar después el navegador abriendo en http://localhost:3000 con el dashboard visible.

---

## SECCION 2: ESTRUCTURA DE CARPETAS (1:15 - 2:30)

"Ahora veamos cómo está organizado el código React. La estructura es muy simple y lógica."

**Mostrar la carpeta frontend en VS Code:**

### Carpeta src

"En la carpeta 'src' están todos los archivos de la aplicación. Vamos a ir por partes."

**Archivo: src/index.js**

"El archivo más importante es 'index.js'. Este es el punto de entrada. Aquí está todo: importa Bootstrap para los estilos CSS globales, importa React, importa el componente App, y renderiza todo en el HTML."

**Mostrar en pantalla:** Abrir src/index.js y mostrar:
```javascript
import React from 'react';
import ReactDOM from 'react-dom/client';
import 'bootstrap/dist/css/bootstrap.min.css';
import App from './App';
import './index.css';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);
```

Explicar: "Bootstrap se importa aquí, eso significa que todos los estilos de Bootstrap están disponibles en toda la aplicación. También importamos index.css que son estilos globales adicionales."

**Archivo: src/App.js**

"El archivo App.js es el corazón de la aplicación. Aquí está el Router que define todas las rutas del dashboard."

**Mostrar en pantalla:** Abrir src/App.js y mostrar:
```javascript
<BrowserRouter>
  <Routes>
    <Route path="/" element={<Home />} />
    <Route path="/genres" element={<Genres />} />
    <Route path="/directors" element={<Directors />} />
    <Route path="/producers" element={<Producers />} />
    <Route path="/types" element={<Types />} />
    <Route path="/media" element={<Media />} />
  </Routes>
</BrowserRouter>
```

Explicar: "Tenemos 6 rutas principales. Cada ruta corresponde a un módulo diferente. Cuando el usuario hace clic en el menú Géneros, React Router cambia la ruta a /genres y muestra el componente Genres."

### Carpeta: src/components

"En la carpeta 'components' tenemos todos los módulos CRUD. Cada módulo tiene su propia carpeta."

**Mostrar en pantalla:** Expandir la carpeta components en VS Code mostrando:
```
components/
├── home/
├── genres/
├── directors/
├── producers/
├── types/
├── media/
├── navbar/
└── sidebar/
```

Explicar: "Cada módulo como Géneros, Directores, etc., tiene su propia carpeta. Dentro hay dos archivos: uno JavaScript y uno CSS."

### Ejemplo: Módulo Géneros

"Vamos a ver el módulo Géneros como ejemplo. Los otros módulos funcionan exactamente igual."

**Archivo: src/components/genres/Genres.js**

**Mostrar en pantalla:** Abrir Genres.js y mostrar la estructura:

Explicar: "Este archivo contiene el componente Géneros. Usa React Hooks. useState maneja el estado local: la lista de géneros, si el formulario está visible, el género que se está editando. useEffect se dispara cuando el componente se carga en el navegador, y hace una llamada HTTP para obtener todos los géneros."

Mostrar específicamente:
```javascript
const [genres, setGenres] = useState([]);
const [loading, setLoading] = useState(false);
const [showForm, setShowForm] = useState(false);
const [editingId, setEditingId] = useState(null);
const [formData, setFormData] = useState({ name: '', status: 'Active' });

useEffect(() => {
  loadGenres();
}, []);
```

Explicar: "useState es un Hook que permite guardar datos en la memoria del componente. Tenemos estado para la lista de géneros, si está cargando, si el formulario está visible, el ID del género que se edita, y los datos del formulario. Cuando estos datos cambian, React automáticamente re-renderiza el componente en el navegador."

Continuar mostrando:
```javascript
const loadGenres = async () => {
  try {
    setLoading(true);
    const response = await getGeneros();
    setGenres(response.data);
  } catch (error) {
    Swal.fire('Error', 'No se pudieron cargar los géneros', 'error');
  } finally {
    setLoading(false);
  }
};
```

Explicar: "loadGenres es una función que hace el trabajo. Primero marca setLoading(true) para mostrar un indicador de carga. Luego llama a getGeneros() que viene del archivo services/api.js. Cuando recibe los datos, los guarda en state con setGenres(response.data). Si hay error, usa SweetAlert2 para mostrar un mensaje de error rojo. Al final, marca setLoading(false) para terminar la carga."

**Archivo: src/components/genres/Genres.css**

**Mostrar en pantalla:** Abrir Genres.css

Explicar: "El archivo CSS contiene los estilos específicos del módulo Géneros. Aquí definimos clases para dar forma a la tabla, los botones, los inputs del formulario, etc."

Mostrar ejemplos:
```css
.genres-container {
  padding: 20px;
  background-color: #f5f5f5;
}

.genres-table {
  background-color: white;
  border-radius: 8px;
}

.btn-create {
  background-color: #007bff;
  color: white;
  padding: 10px 20px;
}
```

Explicar: "Bootstrap proporciona clases predefinidas como btn, form-control, etc. Aquí escribimos CSS adicional para personalizar la apariencia según el diseño del proyecto."

### Carpeta: src/public

**Mostrar en pantalla:** Expandir la carpeta public

Explicar: "La carpeta 'public' contiene el archivo index.html. Este es el HTML base de toda la aplicación."

**Archivo: public/index.html**

**Mostrar en pantalla:** Abrir public/index.html

Mostrar:
```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Catálogo Multimedia</title>
  </head>
  <body>
    <div id="root"></div>
  </body>
</html>
```

Explicar: "Este es el único HTML en toda la aplicación. El div con id 'root' es donde React inyecta todos los componentes. Todo lo demás, todo el HTML que ves en el navegador, es generado dinámicamente por React desde JavaScript."

**Mostrar en pantalla:** Mientras explicas, abre el navegador con la aplicación corriendo. Abre las Developer Tools con F12 e inspecciona el elemento. Muestra cómo dentro del div root está todo el HTML generado por React.

---

## SECCION 3: COMUNICACION CON LA API (2:30 - 3:45)

"Ahora veamos cómo React se comunica con el backend. Todos los datos vienen de la API."

**Archivo: src/services/api.js**

**Mostrar en pantalla:** Abrir services/api.js

Explicar: "Este archivo es muy importante. Aquí centralizamos toda la comunicación HTTP. En lugar de que cada componente haga sus propias peticiones, todos usan funciones definidas aquí."

Mostrar:
```javascript
import axios from 'axios';

const API_BASE_URL = 'http://localhost:3000/api';

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: { 'Content-Type': 'application/json' },
});

// Géneros
export const getGeneros = () => api.get('/genres');
export const getGeneroById = (id) => api.get(`/genres/${id}`);
export const getGenerosActivos = () => api.get('/genres/active');
export const createGenero = (data) => api.post('/genres', data);
export const updateGenero = (id, data) => api.put(`/genres/${id}`, data);
export const deleteGenero = (id) => api.delete(`/genres/${id}`);

// Directores
export const getDirectores = () => api.get('/directors');
export const createDirector = (data) => api.post('/directors', data);
export const updateDirector = (id, data) => api.put(`/directors/${id}`, data);
export const deleteDirector = (id) => api.delete(`/directors/${id}`);

// ... y lo mismo para Productoras, Tipos, Media
```

Explicar: "Se crea una instancia de Axios llamada 'api' con baseURL apuntando al backend: http://localhost:3000/api. Luego exportamos funciones nombradas para cada operación. Por ejemplo, getGeneros() hace GET /genres. createGenero(data) hace POST /genres con los datos nuevos. updateGenero(id, data) hace PUT /genres/id. deleteGenero(id) hace DELETE /genres/id. Cada módulo (Directores, Productoras, Tipos, Media) tiene el mismo patrón."

**Volver a Genres.js:** 

Mostrar cómo se importa y se usa:
```javascript
import { getGeneros, createGenero, updateGenero, deleteGenero } from '../../services/api';

useEffect(() => {
  loadGenres();
}, []);

const loadGenres = async () => {
  const response = await getGeneros();
  setGenres(response.data);
};
```

Explicar: "En el componente Géneros, importamos las funciones getGeneros, createGenero, updateGenero, deleteGenero desde services/api.js. Luego en useEffect, llamamos loadGenres(). Eso internamente llama getGeneros() que hace una petición GET al backend. Cuando la respuesta llega, guardamos los datos en el estado con setGenres(response.data)."

Mostrar cómo se crea un género:
```javascript
const handleSubmit = async (e) => {
  e.preventDefault();
  
  if (!formData.name.trim()) {
    Swal.fire('Validación', 'El nombre del género es requerido', 'warning');
    return;
  }

  try {
    if (editingId) {
      await updateGenero(editingId, formData);
      Swal.fire('Éxito', 'Género actualizado correctamente', 'success');
    } else {
      await createGenero(formData);
      Swal.fire('Éxito', 'Género creado correctamente', 'success');
    }
    resetForm();
    loadGenres(); // Recarga la lista
  } catch (error) {
    Swal.fire('Error', error.response?.data?.message || 'Error al guardar', 'error');
  }
};
```

Explicar: "Cuando el usuario llena el formulario y hace clic en Guardar, se dispara handleSubmit. Primero valida que el nombre no esté vacío usando SweetAlert2 para mostrar un aviso. Si está editando (editingId existe), llama updateGenero(). Si es nuevo, llama createGenero(). Después de successful, muestra una alerta verde de éxito, resetea el formulario con resetForm(), y vuelve a cargar la lista con loadGenres(). Si hay error, muestra una alerta roja."

---

## SECCION 4: FLUJO DE LA APLICACION (3:45 - 4:45)

"Déjame resumir cómo funciona todo junto."

**Mostrar en pantalla:** Una tabla o diagrama visual (puede ser texto en la terminal o en un documento):

```
FLUJO DE LA APLICACION:

1. Usuario abre http://localhost:3000 en el navegador
   ↓
2. Se carga public/index.html
   ↓
3. Se ejecuta src/index.js (punto de entrada)
   ↓
4. Se renderiza <App /> en el div root
   ↓
5. App.js muestra el Router con las 6 rutas
   ↓
6. Usuario hace clic en "Géneros"
   ↓
7. React Router cambia la ruta a /genres
   ↓
8. Se renderiza el componente <Genres />
   ↓
9. useEffect se dispara cuando el componente se monta
   ↓
10. useEffect llama a api.getGenres()
    ↓
11. Axios envía GET http://localhost:3000/api/genres
    ↓
12. Backend responde con la lista de géneros
    ↓
13. React guarda los datos en state con setGenres()
    ↓
14. El componente se re-renderiza con los datos
    ↓
15. El navegador muestra la tabla de géneros con Genres.js (HTML) y Genres.css (estilos)
```

Explicar: "Cada línea representa un paso. Cuando el usuario hace algo en el navegador, React lo detecta, ejecuta el código appropriate, habla con la API si es necesario, recibe respuestas, actualiza el estado, y re-renderiza el componente en el navegador. Todo es muy rápido."

### Mostrar en vivo el flujo:

**Mostrar en pantalla:** 
1. Abrir Developer Tools del navegador (F12)
2. Ir a la pestaña Network
3. Hacer clic en "Géneros" en el dashboard
4. Mostrar la request GET que aparece en Network hacia /api/genres
5. Mostrar la respuesta JSON con los datos
6. Explicar cómo esos datos aparecen inmediatamente en la tabla

---

## SECCION 5: ESTRUCTURA DE CARPETAS RESUMIDA (4:45 - 5:00)

"En resumen, la estructura es así:"

**Mostrar en pantalla:** El árbol de carpetas:

```
frontend/
├── src/
│   ├── index.js              ← Punto de entrada, impone Bootstrap globalmente
│   ├── index.css             ← Estilos globales
│   ├── App.js                ← Router principal con 6 rutas
│   ├── App.css               ← Estilos de App
│   ├── components/           ← Carpeta de todos los módulos
│   │   ├── home/             ← Módulo Home (página principal)
│   │   │   ├── Home.js       ← HTML + lógica del componente
│   │   │   └── Home.css      ← Estilos del módulo Home
│   │   ├── genres/           ← Módulo Géneros
│   │   │   ├── Genres.js     ← HTML + lógica (useState, useEffect, API calls)
│   │   │   └── Genres.css    ← Estilos para tabla, botones, inputs
│   │   ├── directors/        ← Módulo Directores (mismo patrón)
│   │   ├── producers/        ← Módulo Productoras (mismo patrón)
│   │   ├── types/            ← Módulo Tipos (mismo patrón)
│   │   ├── media/            ← Módulo Media (mismo patrón, más complejo)
│   │   ├── navbar/           ← Componente de navegación superior
│   │   └── sidebar/          ← Componente de menú lateral
│   └── services/
│       └── api.js            ← Centraliza TODAS las llamadas HTTP (50+ funciones)
├── public/
│   └── index.html            ← El único HTML. React inyecta el resto aquí
└── package.json              ← Dependencias: React, Bootstrap, Axios, SweetAlert2
```

Explicar: "Cada módulo CRUD tiene su propia carpeta con un .js y un .css. El .js contiene la lógica y el HTML (generado por JSX en React). El .css contiene los estilos específicos de ese módulo. Bootstrap maneja los estilos base, y nuestro CSS personaliza."

---

## CONCLUSION (5:00 - fin)

"En conclusión, el frontend React está bien organizado. Cada módulo es independiente, el código se reutiliza, y todo se comunica con el backend a través del archivo api.js. Los estilos vienen de Bootstrap más el CSS personalizado. Y el punto de entrada es index.js que carga todo y lo inyecta en el HTML."

**Mostrar en pantalla:** El dashboard completo funcionando en tiempo real. Navega entre módulos para mostrar cómo funciona el router.

"Eso es todo. El frontend está listo para producción."

---

## NOTAS GENERALES PARA GRABAR

- Toma 1: Estructura y instalación (secciones 1-2)
- Toma 2: API y comunicación (sección 3)
- Toma 3: Flujo y conclusión (secciones 4-5)
- Usa zoom en VS Code (Ctrl++) para que el código sea legible
- Muestra el navegador con Dev Tools abierto en Network tab
- Habla lentamente y claramente
- Pausa entre secciones para que el viewer asimile la información
- Mientras hablas, señala en pantalla los archivos de los que hablas

---

## PUNTOS CLAVE A ENFATIZAR

1. "El HTML de React no está en archivos .html separados. Todo el HTML se genera desde JavaScript usando JSX."

2. "El CSS se divide en tres niveles: Estilos globales en index.css, componentes de Bootstrap, y CSS personalizado en cada carpeta de módulo."

3. "Cada módulo Géneros, Directores, etc. tiene exactamente la misma estructura: un archivo .js con la lógica y un archivo .css con los estilos."

4. "Axios es fundamental. Sin él, React no podría hablar con la API del backend."

5. "React Router hace que la aplicación sea una Single Page Application (SPA). No cambia de página real, solo cambia lo que se muestra."

6. "useState y useEffect son los Hooks más importantes. useState guarda datos, useEffect ejecuta código cuando el componente se carga."

---

## TIMESTAMPS APROXIMADOS

- 0:00-0:30: Introducción
- 0:30-1:15: Instalación (cd frontend, npm install, npm start)
- 1:15-1:45: Estructura básica (index.js, App.js, public/index.html)
- 1:45-2:30: Módulos CRUD (componentes/genres con .js y .css)
- 2:30-3:45: API y comunicación (services/api.js y cómo se usa)
- 3:45-4:45: Flujo general de la aplicación
- 4:45-5:00: Resumen y estructura final
