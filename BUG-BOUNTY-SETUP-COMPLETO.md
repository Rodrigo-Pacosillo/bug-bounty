# CLEAR Bug Bounty - SETUP COMPLETADO

**Fecha**: 6 de septiembre de 2026
**Estado**: ✅ Configuración completa
**Próximo paso**: Configurar el usuario de HackerOne y ejecutar la primera acción

---

## ✅ SETUP COMPLETADO

### Herramientas Instaladas
- ✅ Nikto (Web security scanner) v2.1.5
- ✅ Nuclei (Vulnerability scanner) v3.1.1
- ✅ Python 3.12 con módulo requests
- ✅ Node.js 18.19.1
- ✅ Go (para compilar scripts)

### Scripts de Explotación Creados
- ✅ `idor-scanner.py` - Scanner para detectar IDOR
- ✅ `xss-finder.js` - Scanner para XSS
- ✅ `sql-injector.py` - Scanner para inyección SQL
- ✅ `ssrf-scanner` (Go) - Scanner para SSRF

### Plantillas y Documentos
- ✅ Template de reporte de vulnerabilidad completo
- ✅ Plantilla HackerOne simplificada
- ✅ Script de configuración de header

### Estructura de Directorios
- ✅ `bug-bounty/01-reconnaissance/` - Reconocimiento
- ✅ `bug-bounty/02-exploitation/` - Explotación con scripts y payloads
- ✅ `bug-bounty/03-reporting/` - Plantillas y reportes
- ✅ `bug-bounty/04-documentation/` - Documentación
- ✅ `bug-bounty/05-tools/` - Herramientas

---

## 📋 PASOS SIGUIENTES

### 1. CONFIGURAR EL HEADER X-Bug-Bounty

**Pasos:**

```bash
# 1. Visitar la URL con tu username de HackerOne
# Reemplaza TU_USERNAME con tu usuario real
open https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=TU_USERNAME

# 2. El header se configurará automáticamente

# 3. Verificar que el header está funcionando
curl -I https://www.clearme.com
```

**Verificación:**

```bash
# Verificar que el header está presente en las respuestas
curl -H "X-Bug-Bounty: HackerOne-TU_USERNAME" https://www.clearme.com

# Debes ver: X-Bug-Bounty: HackerOne-TU_USERNAME en la respuesta
```

### 2. EJECUTAR LA PRIMERA ACCIÓN

```bash
# 1. Ir al directorio del proyecto
cd /workspaces/bug-bounty

# 2. Configurar tu username (reemplaza TU_USERNAME)
export X_BUG_BOUNTY="HackerOne-TU_USERNAME"

# 3. Cargar las configuraciones
source .clear-bounty-aliases.sh

# 4. Ejecutar reconocimiento básico
recon-subfinder  # Enumerar subdominios
recon-nikto      # Escanear web server
recon-nuclei     # Buscar vulnerabilidades conocidas
```

### 3. PROBAR LOS SCRIPTS

```bash
# Test XSS en www.clearme.com
node /workspaces/bug-bounty/bug-bounty/02-exploitation/scripts/xss-finder.js https://www.clearme.com

# Test SQL Injection
python3 /workspaces/bug-bounty/bug-bounty/02-exploitation/scripts/sql-injector.py --target https://www.clearme.com

# Test IDOR (necesitas session_id real)
python3 /workspaces/bug-bounty/bug-bounty/02-exploitation/scripts/idor-scanner.py --username TU_USERNAME --session-id TU_SESSION_ID

# Test SSRF
./bug-bounty/02-exploitation/scripts/ssrf-scanner https://www.clearme.com
```

---

## 🎯 TARGETS PRIORITARIOS

### Tier 1 - Alta Prioridad

| Target | URL | Testing Potential |
|--------|-----|-------------------|
| www.clearme.com | https://www.clearme.com | XSS, Headers, Inputs |
| verified.clearme.com/v1/verification_sessions | https://verified.clearme.com/v1/verification_sessions | IDOR, Authentication |
| web-edge.clearme.com | https://web-edge.clearme.com | SSRF, XSS |
| authentication.clearme.com | https://authentication.clearme.com | Auth flaws |
| enroll.clearme.com | https://enroll.clearme.com | Account creation |

### Tier 2 - Media Prioridad

- mobile.clearme.com - Mobile testing
- identity.clearme.com - MFA issues
- scan.clearme.com - Location scanning

---

## 🚫 EXCLUSIONES (Nunca reportar)

❌ Google Maps API keys (ya lo saben)
❌ Prismic tokens (read-only)
❌ Scanner-generated reports
❌ Self-XSS sin impacto a otros usuarios
❌ Ingeniería social / phishing
❌ Brute force de rate limiting
❌ Acceso físico
❌ Missing autocomplete attributes

---

## 📊 METODOLOGÍA DE TESTING

### Reconocimiento (1-3 horas)
1. **Header Setup**: Configurar X-Bug-Bounty
2. **Subdomain enumeration**: Enumerar todos los dominios
3. **Web scanning**: Nikto y Nuclei
4. **API discovery**: Explorar endpoints

### Explotación (3-6 horas)
1. **XSS testing**: Probar inyecciones en inputs
2. **SQL injection**: Buscar endpoints con query parameters
3. **IDOR testing**: Probar acceso a datos de otros usuarios
4. **SSRF testing**: Probar URL manipulation

### Reporte (1-2 horas)
1. Documentar vulnerabilidades
2. Crear proof of concept
3. Escribir reporte usando el template
4. Enviar a HackerOne

---

## 🛠️ COMANDOS DE AYUDA

```bash
# Verificar setup completo
python3 /workspaces/bug-bounty/bug-bounty/01-reconnaissance/scripts/set-header.sh check

# Verificar herramientas instaladas
python3 /workspaces/bug-bounty/bug-bounty/01-reconnaissance/scripts/set-header.sh setup

# Verificar configuración actual
python3 /workspaces/bug-bounty/bug-bounty/01-reconnaissance/scripts/set-header.sh status

# Obtener ayuda
python3 /workspaces/bug-bounty/bug-bounty/01-reconnaissance/scripts/set-header.sh help
```

---

## 📝 HERRAMIENTAS DISPONIBLES

### Reconocimiento
```bash
recon-subfinder    # Enumerar subdominios
recon-nikto        # Escanear web server
recon-nuclei       # Buscar vulnerabilidades
```

### Explotación
```bash
exploit-xss        # Escanear XSS
exploit-sqli       # Escanear SQL Injection
exploit-idor       # Escanear IDOR
```

### Reportes
```bash
report-new         # Abrir plantilla de reporte
```

---

## ⚠️ IMPORTANTE

1. **Header Configuration**: SIN el header X-Bug-Bounty no puedes hacer testing
2. **First Reporter Wins**: Si otros encontraron la misma vulnerabilidad, pierdes
3. **POC is Essential**: Sin POC, el reporte será rechazado
4. **Scope is Strict**: Muchos findings comunes están fuera de scope

---

## 🎯 PRÓXIMA SESIÓN

**Recomendación**: Comenzar con **www.clearme.com** testing XSS básico

1. Ejecutar `recon-nikto` para encontrar XSS iniciales
2. Usar `exploit-xss` para buscar inyecciones
3. Documentar y reportar

**Opcional**: Ir directo a **verified.clearme.com/v1/verification_sessions** para test IDOR

1. Crear una cuenta de prueba
2. Obtener un `verification_session_id`
3. Probar `exploit-idor` con diferentes IDs

---

**Setup completado con éxito!** 🎉

Ahora configura tu HackerOne username y ejecuta la primera acción.

**Fecha**: 6 de septiembre de 2026
**Hora**: 21:12
**Estado**: ✅ Listo para testing
