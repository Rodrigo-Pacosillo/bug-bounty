# ESTRUCTURA COMPLETA DEL PROYECTO BUG BOUNTY - CLEAR

**Proyecto**: CLEAR Bug Bounty Program on HackerOne
**Fecha**: Septiembre 6, 2026
**Estado**: ✅ Listo para comenzar

---

## 🎯 Resumen Ejecutivo

Este proyecto proporciona una estructura completa y organizada para la caza de vulnerabilidades en el programa de bug bounty de CLEAR en HackerOne. Todo está listo para empezar desde la configuración inicial hasta la presentación de informes.

---

## 📁 Estructura del Proyecto

### Directorios Principales

1. **01-reconnaissance** (Reconocimiento)
   - Scripts para configurar headers
   - Listas de objetivos prioritarios
   - Reglas de exclusión
   - Resultados de escaneo

2. **02-exploitation** (Explotación)
   - Scripts de explotación (SQLi, XSS, IDOR)
   - Payloads personalizados
   - Extensiones para Burp Suite
   - Resultados de pruebas

3. **03-reporting** (Reportes)
   - Plantillas de informes
   - Ejemplos de reportes
   - Informes finales para enviar

4. **04-documentation** (Documentación)
   - Guía de instalación de herramientas
   - Análisis de alcance
   - Reglas de exclusión
   - Hoja de referencia rápida

5. **05-tools** (Herramientas)
   - Instalaciones de Burp Suite, Nmap, etc.

---

## 🎯 Objetivos Prioritarios (TIER 1)

### Alta Prioridad (Mayor potencial de recompensa)
| Activos | Resuelto | Importancia |
|---------|----------|-------------|
| www.clearme.com | 11 (11%) | ⭐⭐⭐⭐⭐ Principal |
| clearme.com | 27 (27%) | ⭐⭐⭐⭐⭐ Landing page |
| my.clearme.com | 9 (9%) | ⭐⭐⭐⭐⭐ Portal de miembros |
| verified.clearme.com/v1/verification_sessions | 0 (0%) | ⭐⭐⭐⭐⭐ API pública |
| web-edge.clearme.com | 1 (1%) | ⭐⭐⭐⭐ CDN/API Gateway |
| authentication.clearme.com | 1 (1%) | ⭐⭐⭐⭐ Autenticación |
| enroll.clearme.com | 0 (0%) | ⭐⭐⭐⭐ Registro |
| concierge.clearme.com | 0 (0%) | ⭐⭐⭐⭐ Servicio de gestión |

### Mediana Prioridad (TIER 2)
- mobile.clearme.com (Backend para apps)
- identity.clearme.com (Plataforma de identidad)
- scan.clearme.com (Escáner de ubicación)

### Baja Prioridad (TIER 3)
- ir.clearme.com (Información inversora)
- Apps móviles (.apk, .ipa)

---

## 🚫 Reglas de Exclusión (FUERA DE ALCANCE)

### **Exclusiones Críticas (Nunca Reportar)**

1. **Self-XSS** que no pueda afectar a otros usuarios
2. **Reportes generados por escáneres** (Retire.js, Vega, Nessus, OpenVAS, Prowler, Qualys)
3. **Ingeniería social** (phishing, vishing, smishing)
4. **Ataques de acceso físico**
5. **Browsers/EOL** (Internet Explorer, navegadores desactualizados)
6. **Exposición de API key de Google Maps** (ya conocida por CLEAR)
7. **Core Ineligible Findings de HackerOne**
8. **Librerías conocidas vulnerables sin POC**
9. **Ataques al header X-Bug-Bounty o cookie FIND_ME**
10. **Enumeración de emails o usuarios**
11. **Faltan atributos autocomplete en formularios**
12. **Vulnerabilidades sin POC funcional**

### **Activos Inelegibles**
- legal.clearme.com (Ninguna severidad)
- hub.clearme.com (Ninguna severidad)
- fieldsupport.clearme.com (Ninguna severidad)
- docs.clearme.com (Ninguna severidad)
- clearme.atlassian.net (Plataforma externa - reportar a Atlassian)
- **Dispositivos físicos** (aeropuertos, estadios, etc.)

---

## ⚠️ Reglas del Programa (OBLIGATORIO CUMPLIR)

### **Requisitos de Prueba**

1. **Header X-Bug-Bounty**:
   ```
   X-Bug-Bounty: HackerOne-<tu-username>
   ```
   - Establecer vía: https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=<TU_USERNAME>
   - Válido por **1 semana** (revisar semanalmente)

2. **Instalación de Apps**:
   - iOS: https://clear.app.link/hackerone-mobile
   - Android: https://clear.app.link/hackerone-mobile
   - Código promocional: **HACKER2020** (2 meses gratis)

3. **Creación de Cuentas**:
   - Usar lead source correcto
   - No crear cuentas masivamente (máximo ~12 recomendado)

### **Reglas de Envío**

- **Un vulnerabilidad por reporte** (a menos que se encadenen)
- **Primer reportero gana** en caso de duplicados
- **No causar daño/disrupción** a sistemas
- **Pasos reproducibles detallados** requeridos
- **Seguir política de divulgación** (no revelar públicamente)

### **Objetivos de Respuesta**

- Tiempo a primera respuesta: 2 días hábiles
- Tiempo a triaje: 2 días hábiles
- Tiempo a recompensa: 5 días hábiles después del triaje

---

## 🛠️ Herramientas Esenciales

### **Herramientas Core**

1. **Burp Suite Pro** (Latest)
   - Testing web
   - Extensiones personalizadas

2. **Nuclei** (Vulnerability Scanner)
   ```bash
   go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
   ```

3. **Subfinder** (Enumeración de subdominios)
   ```bash
   go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
   ```

4. **Amass** (Reconocimiento avanzado)
   ```bash
   go install -v github.com/owasp-amass/amass/v4/...@master
   ```

5. **Nmap** (Escaneo de red)
   ```bash
   brew install nmap  # macOS
   ```

6. **Nikto** (Escáner de servidor web)
   ```bash
   brew install nikto  # macOS
   ```

7. **FFUF** (Fuzzing)
   ```bash
   brew install ffuf  # macOS
   ```

8. **SQLMap** (Inyección SQL)
   ```bash
   pip install sqlmap
   ```

### **Extensiones de Burp Suite (Recomendadas)**

1. **Project Burp** - Gestión de headers personalizada
2. **Param Miner** - Descubrimiento mejorado de parámetros
3. **Cookie Editor** - Gestión de cookies
4. **Easy Chest** - Gestión de credenciales
5. **CORSscanner** - Detección de vulnerabilidades CORS

---

## 🚀 Primeros Pasos (Guía Rápida)

### **Paso 1: Configuración (1 hora)**

```bash
# 1. Abrir terminal
cd /workspaces/bug-bounty

# 2. Instalar herramientas (ver tools-list.md)

# 3. Configurar tu username
./bug-bounty/01-reconnaissance/scripts/set-header.sh
# Cuando se pregunte, introduce tu username de HackerOne
```

### **Paso 2: Verificación del Header (30 minutos)**

```bash
# 1. Visitar esta URL en tu navegador con tu username:
https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=<TU_USERNAME>

# 2. Abrir DevTools (F12) → Tab Network
# 3. Buscar el header X-Bug-Bounty en las solicitudes
# 4. Debe mostrar: X-Bug-Bounty: HackerOne-<TU_USERNAME>

# 5. Guardar el valor del header
echo "HackerOne-<TU_USERNAME>" > bug-bounty/01-reconnaissance/data/headers/current-header.txt
```

### **Paso 3: Reconocimiento Inicial (2-3 horas)**

```bash
# 1. Enumerar subdominios
subfinder -d clearme.com -o bug-bounty/01-reconnaissance/data/recon-results/subdomains.txt

# 2. Escanear servidor web
nikto -h https://www.clearme.com -o bug-bounty/01-reconnaissance/data/recon-results/nikto-results.txt

# 3. Escanear vulnerabilidades
nuclei -l bug-bounty/01-reconnaissance/data/recon-results/subdomains.txt -t http-exposed-headers -o bug-bounty/01-reconnaissance/data/recon-results/nuclei-headers.txt

# 4. Revisar resultados
cat bug-bounty/01-reconnaissance/data/recon-results/subdomains.txt
cat bug-bounty/01-reconnaissance/data/recon-results/nikto-results.txt
```

### **Paso 4: Pruebas Dirigidas (4-6 horas)**

```bash
# 1. Probar objetivos principales con Burp Suite
# - www.clearme.com
# - my.clearme.com
# - clearme.com

# 2. Buscar:
#   - Páginas de login (comprobar XSS, SQLi, IDOR)
#   - Páginas de perfil (comprobar IDOR)
#   - Endpoints de API (comprobar inyección, autenticación)

# 3. Probar parámetros con ffuf
ffuf -u https://www.clearme.com/FUZZ -w /usr/share/wordlists/dirb/common.txt -H "X-Bug-Bounty: HackerOne-<TU_USERNAME>"
```

---

## 📊 Plan de Trabajo Sugerido

### **Primera Semana: Reconocimiento**
- ✅ Enumeración de subdominios
- ✅ Descubrimiento de directorios
- ✅ Análisis de headers
- ✅ Recolección de documentación de API
- ✅ Escaneo inicial de vulnerabilidades

### **Segunda Semana: Pruebas Dirigidas**
- ✅ XSS en objetivos prioritarios
- ✅ SQLi en endpoints de API
- ✅ Análisis de flujos de autenticación
- ✅ Pruebas de IDOR en datos de miembros
- ✅ Revisión de gestión de sesiones

### **Tercera Semana: Documentación y Envío**
- ✅ Documentar hallazgos
- ✅ Escribir reportes con plantillas
- ✅ Probar reproducciones
- ✅ Preparar capturas de pantalla
- ✅ Enviar reportes via HackerOne

---

## 🔥 Áreas de Enfoque Prioritario

### **XSS** (Cross-Site Scripting)
- Reflected XSS en www.clearme.com
- Stored XSS en formularios
- DOM-based XSS en JavaScript

### **SQLi** (SQL Injection)
- Endpoints de API en verified.clearme.com
- Parámetros en endpoints de consulta
- Bases de datos SQL que no están protegidas

### **IDOR** (Insecure Direct Object References)
- Páginas de perfil de usuarios
- Permisos de datos de miembros
- Endpoints que devuelven datos de otros usuarios

### **Authentication Bypass**
- Manipulación de session ID
- Manipulación de tokens JWT
- Session fixation
- Missing MFA verification

### **SSRF** (Server-Side Request Forgery)
- Parámetros de validación
- Redirección de URLs
- External entity injection

### **CSRF** (Cross-Site Request Forgery)
- Tokens de CSRF
- Parámetros no protegidos
- Formularios que no verifican origin

---

## 📝 Estructura de Informe de Vulnerabilidad

El proyecto incluye una plantilla completa en `bug-bounty/03-reporting/templates/vulnerability-report-template.md` con secciones:

1. **Resumen Ejecutivo**
   - Descripción del problema
   - Por qué es importante
   - Confirmación

2. **Pasos de Reproducción**
   - Pasos exactos con URLs y parámetros
   - Comportamiento esperado vs. real

3. **Evidencia**
   - Capturas de pantalla
   - Logs de consola
   - URLs de prueba

4. **Análisis de Vulnerabilidad**
   - Causa raíz
   - Detalles técnicos
   - Evaluación de explotabilidad

5. **Evaluación de Impacto**
   - Usuarios afectados
   - Exposición de datos
   - Escenarios de ataque

6. **Remediación Recomendada**
   - Solución inmediata
   - Soluciones a corto plazo
   - Mejoras a largo plazo

7. **Notas Adicionales**
   - Entorno de prueba
   - Recursos relacionados

---

## 🎓 Estrategia de Éxito

### **Calidad sobre Cantidad**
- Enfocarse en encontrar **1-3** hallazgos de alta calidad por semana
- Priorizar bugs que afecten a múltiples usuarios
- Asegurar pruebas reproducibles y bien documentadas

### **Enfoque Sistemático**
1. **Reconocimiento**: Mapear superficie de ataque
2. **Enumeración**: Encontrar puntos de entrada
3. **Pruebas Dirigidas**: Enfocarse en objetivos de alto valor
4. **Documentación**: Crear reportes detallados
5. **Envío**: Via HackerOne con header correcto

### **Tipos Comunes de Vulnerabilidades**
- **XSS** (reflejado, almacenado, DOM-based)
- **SQLi** (inyección SQL)
- **IDOR** (Referencias Directas de Objetos Inseguras)
- **Authentication bypass** (manipulación de session ID, tokens)
- **SSRF** (Server-Side Request Forgery)
- **CSRF** (Cross-Site Request Forgery)
- **Open redirect** (redirecciones inseguras)

---

## ⚠️ Errores Comunes a Evitar

### **NO HAGAS**
- ❌ Reportes generados solo por escáneres
- ❌ Self-XSS sin impacto en otros usuarios
- ❌ Saltar verificación de header
- ❌ Fuerza bruta contra rate limits
- ❌ Crear cuentas masivamente
- ❌ Divulgar públicamente antes del triaje
- ❌ Probar con navegadores desactualizados

### **SÍ HAZ**
- ✅ Establecer header X-Bug-Bounty en todas las solicitudes
- ✅ Usar sabiamente el privilegio de primer reportero
- ✅ Proveer POC funcional
- ✅ Probar solo con cuentas válidas
- ✅ Seguir política de divulgación

---

## 📊 Métricas de Éxito

- **Subdominios descubiertos**: >100 (actual: 21)
- **Vulnerabilidades encontradas**: 0-3 inicialmente (calidad > cantidad)
- **Reportes enviados**: 1-2 por semana
- **Tiempo de respuesta**: <48 horas para triaje

---

## 📚 Recursos Adicionales

### **Recursos Oficiales**
- Programa HackerOne CLEAR: https://hackerone.com/clear
- Alcance de HackerOne: https://hackerone.com/clear/scope
- Core Ineligible Findings: https://docs.hackerone.com/en/articles/8494488-core-ineligible-findings

### **Herramientas**
- Burp Suite: https://portswigger.net/burp
- Nuclei: https://nuclei.projectdiscovery.io/
- Subfinder: https://github.com/projectdiscovery/subfinder
- OWASP: https://owasp.org/

### **Documentación**
- Plantilla de Reporte: bug-bounty/03-reporting/templates/
- Guía de Instalación: bug-bounty/04-documentation/tools-list.md
- Reglas de Exclusión: bug-bounty/01-reconnaissance/targets/exclusion-rules.txt

---

## 🎉 ¡Estás Listo!

La estructura del proyecto está completa. Empieza con la guía rápida de inicio y comienza el reconocimiento sistemático en los objetivos prioritarios.

**¡Mucha suerte! 🍀**

---

**Última Actualización**: Septiembre 6, 2026
**Estado del Proyecto**: Listo para explotación
**Idioma**: Archivos de proyecto en español, documentación en inglés
