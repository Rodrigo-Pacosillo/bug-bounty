# PLAN DE RECONOCIMIENTO BÁSICO - CLEAR BUG BOUNTY

**Usuario**: pastoseco
**Fecha**: 6 de septiembre de 2026
**Método**: Reconocimiento básico sin cuenta (sin exploits reales)

---

## PASO 1: Configurar Header (1 minuto) ⏱️

**IMPORTANTE**: Tu header está vacío actualmente. Necesitas configurarlo:

```bash
# 1. Exportar tu username (lo que está en HackerOne)
export X_BUG_BOUNTY="HackerOne-pastoseco"

# 2. Cargar las configuraciones
source .clear-bounty-aliases.sh

# 3. Verificar que está configurado
echo $X_BUG_BOUNTY
# Debe mostrar: HackerOne-pastoseco
```

**¿Por qué?**
- Sin el header, los scripts no pueden escanear correctamente
- El header es obligatorio para todo el bug bounty testing

---

## PASO 2: Reconocimiento de Subdominios (10-15 minutos) 🔍

**Script**: `recon-subfinder`
**Archivo**: `bug-bounty/01-reconnaissance/data/recon-results/subdomains.txt`

```bash
recon-subfinder
```

**Lo que hará:**
- Enumerará subdominios de `clearme.com`
- Guardará resultados en: `bug-bounty/01-reconnaissance/data/recon-results/subdomains.txt`
- **Output esperado**: 10-50 dominios activos

**Archivos que se crearán:**
- `subdomains.txt` - Lista de dominios
- Si usa amass: `amass-passive.txt` - Subdominios adicionales
- Si usa amass: `amass-active.txt` - Subdominios activos

---

## PASO 3: Escaneo Web Server (10-15 minutos) 🌐

**Script**: `recon-nikto`
**Archivo**: `bug-bounty/01-reconnaissance/data/recon-results/nikto-results.txt`

```bash
recon-nikto
```

**Lo que hará:**
- Escaneará `https://www.clearme.com`
- Detectará vulnerabilidades web (XSS, SQLi, headers malconfigurados)
- Guardará resultados en: `nikto-results.txt`

**Qué buscar:**
- XSS vulnerabilidades
- SQL injection points
- Missing security headers
- Directorios expuestos
- Tecnologías no deseadas

---

## PASO 4: Buscar Vulnerabilidades (10-15 minutos) 🔎

**Script**: `recon-nuclei`
**Archivo**: `bug-bounty/01-reconnaissance/data/recon-results/nuclei-results.txt`

```bash
recon-nuclei
```

**Lo que hará:**
- Usará plantillas de Nuclei para buscar vulnerabilidades conocidas
- Buscará en todos los subdominios que encontraste en Paso 2
- Guardará resultados en: `nuclei-results.txt`

**Tipos de vulnerabilidades:**
- HTTP headers expuestas
- Credenciales en texto plano
- Configuraciones peligrosas
- SSL/TLS issues
- Technologies detectadas

---

## PASO 5: Análisis de Resultados (15-20 minutos) 📊

**Archivos a revisar:**

### 5.1. Subdominios
```bash
cat bug-bounty/01-reconnaissance/data/recon-results/subdomains.txt
```

### 5.2. Nikto Results
```bash
cat bug-bounty/01-reconnaissance/data/recon-results/nikto-results.txt
```

### 5.3. Nuclei Results
```bash
cat bug-bounty/01-reconnaissance/data/recon-results/nuclei-results.txt
```

**Qué buscar en cada archivo:**

**Subdominios:**
- Dominios nuevos no documentados
- Subdominios potencialmente inseguros
- Dominios en diferentes tier

**Nikto:**
- Issues de seguridad (XSS, SQLi)
- Missing headers
- Rutas sensibles expuestas
- Configuraciones peligrosas

**Nuclei:**
- Vulnerabilidades conocidas
- HTTP headers problems
- Credenciales expuestas
- Technologies issues

---

## PASO 6: Pruebas de Explotación Básica (15-20 minutos) 🚀

### 6.1. XSS Testing
```bash
node /workspaces/bug-bounty/bug-bounty/02-exploitation/scripts/xss-finder.js https://www.clearme.com
```

**Lo que hará:**
- Buscará XSS en URLs y forms
- Probará payloads de inyección
- Generará reporte de vulnerabilidades

**Output:**
- `xss-findings-[timestamp].json` - Reporte de XSS encontrados

### 6.2. SQL Injection Testing
```bash
python3 /workspaces/bug-bounty/bug-bounty/02-exploitation/scripts/sql-injector.py --target https://www.clearme.com
```

**Lo que hará:**
- Buscará SQL injection en endpoints con query parameters
- Probará payloads de inyección
- Generará reporte de vulnerabilidades

**Output:**
- `sql-injection-[timestamp].json` - Reporte de SQLi encontrados

### 6.3. SSRF Testing
```bash
./bug-bounty/02-exploitation/scripts/ssrf-scanner https://www.clearme.com
```

**Lo que hará:**
- Buscará Server-Side Request Forgery
- Probará URL manipulation
- Generará reporte de vulnerabilidades

**Output:**
- `ssrf-findings-[timestamp].json` - Reporte de SSRF encontrados

---

## PASO 7: Documentar Findings (15-20 minutos) 📝

**Crear un reporte inicial:**

```bash
# Abrir plantilla de reporte
cd bug-bounty/03-reporting/templates
code vulnerability-report-template.md
```

**Documentar:**
1. **Vulnerabilidades encontradas** (XSS, SQLi, headers problems)
2. **Subdominios nuevos** (si los hay)
3. **Endpoints expuestos** (directorios o rutas sensibles)
4. ** Tecnologías detectadas** (qué frameworks/tech se usan)

---

## 📊 RESULTADOS ESPERADOS

### Basico:
- **Subdominios**: 10-50 dominios activos
- **Nikto issues**: 5-20 issues (XSS, headers, etc.)
- **Nuclei findings**: 3-10 vulnerabilidades
- **XSS found**: 0-5 casos (depende del target)
- **SQLi found**: 0-5 casos (depende del target)
- **SSRF found**: 0-5 casos (depende del target)

### Prioridad para primer reporte:
1. **Missing security headers** - Fácil, claramente documentable
2. **Directory disclosure** - Rutas expuestas
3. **Basic XSS** - Si hay inputs públicos
4. **SQL injection clues** - Error messages reveladores

---

## ⚠️ IMPORTANTE

### NO hacer en esta fase:
❌ No testear IDOR (requiere cuenta de prueba)
❌ No hacer exploits avanzados
❌ No hacer brute force
❌ No hacer XSS sin impacto a otros usuarios

### SÍ hacer:
✅ Reconocimiento básico de dominios
✅ Escaneo web (Nikto + Nuclei)
✅ XSS testing básico
✅ SQL injection clues
✅ SSRF testing básico

---

## 🎯 PRÓXIMOS PASOS

### Si encontraste vulnerabilidades:
1. Documentar cada vulnerabilidad
2. Crear proof of concept (POC)
3. Escribir reporte
4. Enviar a HackerOne

### Si NO encontraste vulnerabilidades:
1. Repetir con otro dominio
2. Probar scripts en otros subdominios
3. Intentar XSS en forms específicos
4. Buscar nuevos subdominios

---

## 📁 ARCHIVOS GENERADOS

```
bug-bounty/
├── 01-reconnaissance/data/recon-results/
│   ├── subdomains.txt          ✅ Dominios activos
│   ├── nikto-results.txt       ✅ Escaneo web
│   ├── nuclei-results.txt      ✅ Vulnerabilidades conocidas
│   ├── amass-passive.txt       ⭕ Subdominios adicionales
│   └── amass-active.txt        ⭕ Subdominios activos
├── 02-exploitation/findings/
│   ├── xss-findings-*.json     ✅ XSS encontrados
│   ├── sql-injection-*.json    ✅ SQLi encontrados
│   └── ssrf-findings-*.json    ✅ SSRF encontrados
└── 03-reporting/templates/
    └── vulnerability-report-template.md  ✅ Template para reportes
```

---

**Total de tiempo estimado**: 60-90 minutos

**Comando de inicio rápido**:
```bash
cd /workspaces/bug-bounty
export X_BUG_BOUNTY="HackerOne-pastoseco"
source .clear-bounty-aliases.sh
recon-subfinder && recon-nikto && recon-nuclei
```

**¿Estás listo para comenzar?**
