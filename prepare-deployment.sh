#!/bin/bash

# Script para preparar el deployment

echo "🚀 Iniciando preparación para deployment..."

# 1. Verificar Git
if ! command -v git &> /dev/null; then
    echo "❌ Git no está instalado. Por favor, instala Git."
    exit 1
fi

echo "✅ Git está instalado"

# 2. Inicializar Git si no está inicializado
if [ ! -d ".git" ]; then
    echo "📝 Inicializando repositorio Git..."
    git init
    git add .
    git commit -m "Initial commit - Multimedia App"
else
    echo "✅ Repositorio Git ya existe"
fi

# 3. Verificar que .env no esté en Git
if git ls-files --cached | grep -q "\.env"; then
    echo "⚠️  .env está en Git. Removiendo..."
    git rm --cached .env
    git commit -m "Remove .env from Git"
fi

echo "✅ Preparación completada!"
echo ""
echo "📋 Próximos pasos:"
echo "1. Crear repositorio en GitHub: https://github.com/new"
echo "2. Agregar remote: git remote add origin https://github.com/tu-usuario/tu-repo.git"
echo "3. Push: git branch -M main && git push -u origin main"
echo "4. Ir a https://railway.app para desplegar el backend"
echo "5. Ir a https://netlify.com para desplegar el frontend"
echo ""
echo "📖 Consulta DEPLOYMENT.md para instrucciones detalladas"
