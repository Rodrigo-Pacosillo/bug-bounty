# CHECKLIST DE INICIO - CHECKLIST DE INICIO

## ✅ Este Semana: Configuración y Reconocimiento

### **Día 1: Instalación de Herramientas**
- [ ] Instalar Burp Suite Pro (Latest)
- [ ] Instalar Nuclei (vulnerability scanner)
- [ ] Instalar Subfinder (subdomain enumeration)
- [ ] Instalar Amass (advanced reconnaissance)
- [ ] Instalar Nmap (network scanning)
- [ ] Instalar Nikto (web server scanner)
- [ ] Instalar FFUF (fuzzing)
- [ ] Instalar SQLMap (SQL injection)
- [ ] Instalar extensiones de Burp Suite (Project Burp, Param Miner, etc.)
- [ ] Verificar versiones con `--version`

### **Día 2: Configuración del Entorno**
- [ ] Configurar header X-Bug-Bounty
- [ ] Visitar URL de prueba: https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=<TU_USERNAME>
- [ ] Verificar header en DevTools
- [ ] Guardar header en `bug-bounty/01-reconnaissance/data/headers/current-header.txt`
- [ ] Activar alias en terminal: `source .clear-bounty-aliases.sh`
- [ ] Probar con curl: `curl -H "X-Bug-Bounty: HackerOne-<TU_USERNAME>" https://www.clearme.com`

### **Día 3-5: Reconocimiento Inicial**
- [ ] Enumerar subdominios: `subfinder -d clearme.com`
- [ ] Ejecutar escáner web: `nikto -h https://www.clearme.com`
- [ ] Escanear vulnerabilidades: `nuclei -u https://www.clearme.com`
- [ ] Descubrir directorios: `ffuf -u https://www.clearme.com/FUZZ -w wordlist.txt`
- [ ] Ejecutar Amass (passive): `amass enum -passive -d clearme.com`
- [ ] Revisar resultados en `bug-bounty/01-reconnaissance/data/recon-results/`

### **Día 6-7: Pruebas Dirigidas (Tier 1 Targets)**
- [ ] Abrir www.clearme.com en Burp Suite
- [ ] Probar XSS en formularios (login, signup)
- [ ] Probar SQL injection en parámetros
- [ ] Probar IDOR en páginas de perfil
- [ ] Probar SSRF en endpoints
- [ ] Documentar hallazgos en `bug-bounty/02-exploitation/findings/`

---

## ✅ Próxima Semana: Exploración Profunda

### **Objetivos Prioritarios**
1. **XSS** (reflected, stored, DOM-based)
   - [ ] Probar XSS en www.clearme.com
   - [ ] Probar XSS en my.clearme.com
   - [ ] Probar XSS en concierge.clearme.com

2. **SQL Injection**
   - [ ] Probar SQLi en verified.clearme.com API
   - [ ] Probar SQLi en web-edge.clearme.com
   - [ ] Probar SQLi en authentication.clearme.com

3. **IDOR**
   - [ ] Probar IDOR en páginas de perfil
   - [ ] Probar IDOR en endpoints de API
   - [ ] Probar IDOR en datos de miembros

4. **Authentication Bypass**
   - [ ] Probar manipulación de session ID
   - [ ] Probar manipulation de tokens JWT
   - [ ] Probar session fixation
   - [ ] Probar MFA bypass

5. **SSRF**
   - [ ] Probar SSRF en parámetros de validación
   - [ ] Probar SSRF en redirección de URLs
   - [ ] Prober external entity injection

---

## ✅ Documentación y Envío

### **Antes de Enviar**
- [ ] Verificar que el hallazgo está en alcance (no en exclusion-rules.txt)
- [ ] Probar que la reproducción es sólida
- [ ] Proveer capturas de pantalla de alta calidad
- [ ] Documentar impacto en usuarios
- [ ] Proveer URL de prueba reproducible
- [ ] Proporcionar remediation recomendada

### **Al Enviar**
- [ ] Usar plantilla de reporte correcto
- [ ] Establecer header X-Bug-Bounty en todas las solicitudes
- [ ] Enviar 1 vulnerabilidad por reporte (a menos que se encadenen)
- [ ] Proveer POC funcional
- [ ] Usar el reportero primero (si es duplicado)

---

## 🔍 Checklist Técnico de Pruebas

### **XSS Testing**
- [ ] Buscar inputs reflejos (formularios, URL, POST)
- [ ] Probar payloads: `<script>alert(1)</script>`, `<img src=x onerror=alert(1)>`
- [ ] Probar stored XSS en bases de datos
- [ ] Probar DOM-based XSS
- [ ] Verificar que afecta a otros usuarios

### **SQL Injection Testing**
- [ ] Buscar parámetros GET y POST sin validación
- [ ] Probar con sqlmap
- [ ] Probar payloads básicos: `' OR '1'='1`, `1' AND '1'='1`
- [ ] Probar error-based SQLi
- [ ] Probar UNION-based SQLi

### **IDOR Testing**
- [ ] Identificar IDs en URLs
- [ ] Cambiar IDs manualmente
- [ ] Cambiar IDs entre usuarios
- [ ] Probar con Burp Suite repeater
- [ ] Verificar si el endpoint no valida ownership

### **Authentication Testing**
- [ ] Probar session fixation
- [ ] Probar session hijacking
- [ ] Probar JWT manipulation
- [ ] Probar token bypass
- [ ] Probar missing MFA

### **CSRF Testing**
- [ ] Probar formularios sin tokens CSRF
- [ ] Probar cambios de contraseña
- [ ] Probar actualizaciones de perfil
- [ ] Probar deletion de cuentas
- [ ] Verificar token en cookies y headers

### **SSRF Testing**
- [ ] Probar parámetros de URL
- [ ] Probar parámetros de archivo local
- [ ] Probar parámetros de redirección
- [ ] Probar endpoints que hacen requests externos
- [ ] Verificar si bloquean URLs internas

---

## 📊 Métricas de Progreso

### **Reconocimiento**
- [ ] Subdominios descubiertos: __ / 100+
- [ ] Directorios descubiertos: __ / 200+
- [ ] Endpoints de API identificados: __ / 50+

### **Vulnerabilidades Encontradas**
- [ ] Critical: __ / 3
- [ ] High: __ / 5
- [ ] Medium: __ / 10
- [ ] Low: __ / 15

### **Reportes Enviados**
- [ ] Reportes enviados: __ / 1-2 por semana
- [ ] Triage completado: __ / %
- [ ] Bounties ganados: $____

---

## ⚠️ Reglas de Seguridad

### **Nunca Hacer**
- ❌ **No** usar reportes generados solo por escáneres
- ❌ **No** testear self-XSS sin impacto en otros
- ❌ **No** hacer fuerza bruta contra rate limits
- ❌ **No** crear cuentas masivamente (máximo ~12)
- ❌ **No** causar daño o disruptión a sistemas
- ❌ **No** acceder/modificar datos de usuarios sin permiso
- ❌ **No** hacer ataques de ingeniería social
- ❌ **No** publicar divulgaciones antes del triaje

### **Siempre Hacer**
- ✅ **Sí** establecer header X-Bug-Bounty en todas las solicitudes
- ✅ **Sí** usar solo cuentas propias o con permiso explícito
- ✅ **Sí** provar que el hallazgo es reproducible
- ✅ **Sí** seguir la política de divulgación
- ✅ **Sí** documentar todo con screenshots claros
- ✅ **Sí** proporcionar remediation recomendado

---

## 📚 Recursos Rápidos

### **Enlaces Importantes**
- HackerOne CLEAR: https://hackerone.com/clear
- Alcance: https://hackerone.com/clear/scope
- Exclusiones: bug-bounty/01-reconnaissance/targets/exclusion-rules.txt
- Plantillas: bug-bounty/03-reporting/templates/
- Guía de Herramientas: bug-bounty/04-documentation/tools-list.md

### **Comandos Rápidos**
```bash
# Header configuration
source .clear-bounty-aliases.sh

# Reconnaissance
recon-subfinder
recon-nikto
recon-nuclei

# Report new
report-new

# Clear terminal
clearall
```

---

## 🎯 Objetivos Semanales

### **Objetivos Semanales**
- **Semana 1**: Configuración completa y reconocimiento inicial
- **Semana 2**: Pruebas profundas en objetivos prioritarios
- **Semana 3**: Documentar 1-2 hallazgos y enviar reportes

### **Objetivos a Largo Plazo**
- **Mes 1**: Encontrar 2-3 vulnerabilidades de alta calidad
- **Mes 2**: Encontrar 4-6 vulnerabilidades
- **Mes 3**: Encontrar 6-10 vulnerabilidades
- **Año 1**: Dominar el programa y encontrar 20+ vulnerabilidades

---

## 🚀 Próximos Pasos Inmediatos

1. **Instalar herramientas** (Día 1)
2. **Configurar header** (Día 2)
3. **Correr reconocimiento inicial** (Día 3-5)
4. **Empezar pruebas en Tier 1 targets** (Día 6-7)
5. **Documentar hallazgos** (Día 7)
6. **Planificar próxima semana** (Día 7)

---

**¡Todo está listo para empezar! 🎉**

Empieza con el Día 1 y sigue el checklist sistemáticamente. Buena suerte en tu búsqueda de vulnerabilidades en CLEAR! 🍀
