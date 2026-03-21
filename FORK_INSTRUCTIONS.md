# 🍴 Instrucciones: Fork y Push a GitHub

## Paso 1: Crear Fork en GitHub ✅

**Ve a este link:**
```
https://github.com/AndresDMO/ea1-api_rest_node/fork
```

**Click en "Create fork"** y espera a que se cree.

Se creará en: `https://github.com/naberz95/ea1-api_rest_node`

---

## Paso 2: Conectar tu Copia Local con el Fork 

**Ejecuta estos comandos en la terminal:**

```bash
cd "C:\Users\Nolberto Gomez\Downloads\ea1-api_rest_node-main (1)\ea1-api_rest_node-main"

# Conectar con tu fork
git remote add origin https://github.com/naberz95/ea1-api_rest_node.git

# Cambiar rama a main (como GitHub lo requiere)
git branch -M main

# Subir archivos al fork
git push -u origin main
```

---

## Paso 3: Verificar que Funcionó ✅

```bash
git remote -v
```

Debería mostrar:
```
origin  https://github.com/naberz95/ea1-api_rest_node.git (fetch)
origin  https://github.com/naberz95/ea1-api_rest_node.git (push)
```

---

## 📍 Resultado Final

Tu código estará en:
```
https://github.com/naberz95/ea1-api_rest_node
```

**Los archivos en rojo en VS Code desaparecerán automáticamente después del push** ✅

---

## ⚠️ Notas

- El fork es una **copia independiente** de Andrés
- Los cambios que hagas NO afectan al original
- Perfecto para trabajo académico/personal
- Puedes hacer Pull Request al original si quieres contribuir

---

¿Ejecuto estos comandos automáticamente? (Necesito que hayas hecho el fork primero en GitHub)
