# PRIMERA ACCIÓN - EJECUTA ESTO PRIMERO

## 🔧 SETUP INICIAL (1 minuto)

```bash
# 1. Navega al directorio del proyecto
cd /workspaces/bug-bounty

# 2. Configura tu HackerOne username
source .clear-bounty-aliases.sh
```

*(Te pedirá tu username de HackerOne. Escribelo cuando te pregunte)*

---

## ✅ VERIFICACIÓN (1 minuto)

```bash
# Verifica que el header está configurado correctamente
cat .clear-bounty-aliases.sh | grep X-Bug-Bounty
```

**Esperado**: `X-Bug-Bounty: HackerOne-TU_USERNAME`

Si ves esto = OK. Si no = ERROR.

---

## 🚀 PRIMER RECONOCIMIENTO (25 minutos)

```bash
# 1. Enumerar subdominios
subfinder -d clearme.com -o bug-bounty/01-reconnaissance/data/recon-results/subdomains.txt

# 2. Escanear web server
nikto -h https://www.clearme.com -o bug-bounty/01-reconnaissance/data/recon-results/nikto-results.txt

# 3. Buscar vulnerabilidades
nuclei -u https://www.clearme.com -o bug-bounty/01-reconnaissance/data/recon-results/nuclei-results.txt
```

**Lee los resultados**:
- `subdomains.txt` - Lista de dominios activos
- `nikto-results.txt` - Issues web (XSS, SQLi, headers)
- `nuclei-results.txt` - Vulnerabilidades conocidas

---

## 💣 PRIMER ATAQUE DIRIGIDO (30-60 min)

**TARGET**: https://verified.clearme.com/v1/verification_sessions

### PASO 1: Identificar sesión válida
1. Abre `https://verified.clearme.com/v1/verification_sessions` en tu navegador
2. Si pide login, crea una cuenta de prueba
3. Copia una `verification_session_id` del JSON response

### PASO 2: Probar IDOR (Account Takeover)
```bash
# Reemplaza TU_USERNAME y TU_SESSION_ID con tus valores reales
curl -H "X-Bug-Bounty: HackerOne-TU_USERNAME" \
     -H "Authorization: Bearer TU_TOKEN" \
     https://verified.clearme.com/v1/verification_sessions/TU_SESSION_ID \
     -o bug-bounty/02-exploitation/findings/idor-test-1.json

# Reemplaza TU_SESSION_ID con otra sesión (puede ser falsa o de otro user)
curl -H "X-Bug-Bounty: HackerOne-TU_USERNAME" \
     -H "Authorization: Bearer TU_TOKEN" \
     https://verified.clearme.com/v1/verification_sessions/OTRO_SESSION_ID \
     -o bug-bounty/02-exploitation/findings/idor-test-2.json

# Comparar los dos archivos JSON
diff bug-bounty/02-exploitation/findings/idor-test-1.json bug-bounty/02-exploitation/findings/idor-test-2.json
```

**Resultado esperado**:
- Si las respuestas son DIFERENTES = **¡IDOR DETECTADO!** 
- Si las respuestas son IDENTICAS = Falta crear otra sesión real

### PASO 3: Si encontraste IDOR
1. Documenta los datos que puedes ver del otro user
2. Crea un reporte usando la plantilla: `bug-bounty/03-reporting/templates/vulnerability-report-template.md`
3. Envía el reporte vía HackerOne

---

## 🔄 RUTINA SEMANAL (1 minuto)

```bash
# Cada semana revisa esto:
curl -s "https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=TU_USERNAME" > /dev/null
```

*(Esto refresca el header automáticamente por 1 semana)*

---

## 🚫 EXCLUSIONES (Nunca reportar)

❌ Google Maps API keys (ya lo saben)  
❌ Prismic tokens (son read-only e intencionales)  
❌ Scanner-generated reports  
❌ Self-XSS sin impacto a otros usuarios  
❌ Ingeniería social / phishing  
❌ Brute force de rate limiting  
❌ Acceso físico  

---

## 📊 RESULTADOS ESPERADOS

**Subdominios**: 10-50 dominios activos  
**Nikto**: 5-20 issues (XSS, SQLi, headers)  
**Nuclei**: 3-10 vulnerabilidades encontradas  
**IDOR**: Depende de si la API está vulnerable  

---

## 🎯 SIGUIENTE PASO

Si encontraste IDOR:
1. Documenta los detalles
2. Crea el reporte
3. Envía a HackerOne

Si NO encontraste IDOR:
1. Repite con otro target de Tier 1
2. Prueba XSS en www.clearme.com
3. Prueba SSRF en endpoints

---

**¡EJECUTA EL SETUP INICIAL AHORA!** `source .clear-bounty-aliases.sh`
