# CLEAR HackerOne Bug Bounty Project
**Program**: CLEAR (CLEAR Identity)
**Platform**: HackerOne
**Last Updated**: March 2, 2026
**Language**: Spanish (for project files, per user request)

---

## 📋 Overview

This project provides a structured approach to security testing for CLEAR's bug bounty program on HackerOne. The goal is systematic reconnaissance, testing, and documentation following the program's scope and rules.

---

## 🎯 In-Scope Assets (Priority Ranking)

### **Tier 1 - High Priority** (Most testing potential)
| Asset | Type | Resolved Reports | Notes |
|-------|------|------------------|-------|
| **www.clearme.com** | Primary Marketing Site | 11 (11%) | Main public website - extensive attack surface |
| **my.clearme.com** | Member Portal | 9 (9%) | User authentication and personal data |
| **clearme.com** | Landing Page | 27 (27%) | High traffic - XSS/IDOR opportunities |
| **verified.clearme.com/v1/verification_sessions** | API | 0 (0%) | Public API - RCE/SQLi opportunities |
| **web-edge.clearme.com** | CDN/API Gateway | 1 (1%) | Critical XSS/SSRF opportunities |
| **authentication.clearme.com** | Auth Domain | 1 (1%) | Authentication flows |
| **enroll.clearme.com** | Enrollment Flow | 0 (0%) | Account creation flows |
| **concierge.clearme.com** | Concierge Service | 0 (0%) | Booking/management features |

### **Tier 2 - Medium Priority**
| Asset | Type | Notes |
|-------|------|-------|
| **mobile.clearme.com** | Mobile Backend | Test via app from specific installation link |
| **identity.clearme.com** | Identity Platform | Multi-factor authentication |
| **scan.clearme.com** | Location Scanner | Physical location scanning only (authorized locations) |

### **Tier 3 - Lower Priority**
| Asset | Type | Notes |
|-------|------|-------|
| **ir.clearme.com** | Investor Relations | Research documentation |
| **com.clearme.clearapp** | Android App | Install via: https://clear.app.link/hackerone-mobile |

---

## 🚫 Exclusion Rules (OUT OF SCOPE)

### **Critical Exclusions (Never Report)**
1. **Self-XSS** that cannot affect other users
2. **Scanner-generated reports** (Retire.js, Vega, Nessus, Prowler, etc.)
3. **Social engineering / phishing** (permanently excluded)
4. **Physical access attacks**
5. **EOL browsers/platforms** (Internet Explorer, outdated browsers)
6. **Google Maps API key exposure** (already known by CLEAR)
7. **HackerOne Core Ineligible Findings** (see: https://docs.hackerone.com/en/articles/8494488-core-ineligible-findings)
8. **Known vulnerable libraries** without working POC
9. **Attacks on X-Bug-Bounty header** or FIND_ME cookie
10. **Email/user enumeration**
11. **Missing autocomplete attributes**
12. **Unexploitable vulnerabilities** without working POC
13. **Prismic Access Tokens** (read-only, public, intended)
14. **Wayback Machine findings** (no current exploitation proof)
15. **Physical devices** (at airports, stadiums, etc.)

### **Ineligible Assets (Never Report)**
- **legal.clearme.com** (None severity)
- **hub.clearme.com** (None severity)
- **fieldsupport.clearme.com** (None severity)
- **docs.clearme.com** (None severity)
- **clearme.atlassian.net** (External platform - report to Atlassian instead)

---

## ⚠️ Program Rules (MUST FOLLOW)

### **Testing Requirements**
1. **X-Bug-Bounty Header**: ALL web traffic MUST include:
   ```
   X-Bug-Bounty: HackerOne-<your-username>
   ```
   - Set via: https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=<your-username>
   - Valid for 1 week (revisit weekly)

2. **App Installation**:
   - iOS: Install via https://clear.app.link/hackerone-mobile
   - Android: Install via https://clear.app.link/hackerone-mobile
   - Promo code: **HACKER2020** (free 2 months)

3. **Account Creation**:
   - Use correct lead source during enrollment
   - Do not mass-create accounts

### **Submission Rules**
- One vulnerability per report (unless chaining required)
- First reporter wins (if duplicate reports)
- No damage/disruption to systems
- Detailed reproducible steps required
- Follow disclosure policy (no public disclosure)

### **Response Targets**
- Time to first response: 2 business days
- Time to triage: 2 business days
- Time to bounty: 5 business days after triage

---

## 📁 Project Structure

```
bug-bounty-clear/
├── 01-reconnaissance/           # Reconnaissance phase
│   ├── scripts/
│   │   ├── gather-headers.py    # Header validation
│   │   ├── subdomain-enumeration.sh
│   │   ├── directory-burp.py    # Burp Suite project setup
│   │   ├── openapi-collector.py # API documentation
│   │   └── chrome-headers.js    # Chrome extension
│   ├── targets/
│   │   ├── tier1-domains.txt
│   │   ├── tier2-domains.txt
│   │   └── assets-urls.txt
│   ├── data/
│   │   ├── headers/             # Stored headers
│   │   └── recon-results/       # Nmap, subfinder, etc.
│   └── reports/
│       └── initial-scan-report.md
│
├── 02-exploitation/            # Exploitation phase
│   ├── scripts/
│   │   ├── sql-injector.py     # SQL injection scanner
│   │   ├── xss-finder.js       # XSS detection
│   │   ├── ssrf-scanner.go     # SSRF scanner
│   │   ├── auth-tester.py      # Authentication testing
│   │   ├── idor-scanner.py     # IDOR detection
│   │   ├── burp-extensions/    # Custom Burp Suite extensions
│   │   │   └── CLEAR-Bounty-Enhancer.py
│   │   └── web-tests/          # Automated web tests
│   │       ├── test_login.sh
│   │       ├── test_xss.sh
│   │       └── test_api.sh
│   ├── payloads/               # Custom payloads
│   │   ├── xss/
│   │   ├── sqli/
│   │   ├── ssrf/
│   │   └── auth/
│   └── findings/                # Exploitation results
│       └── drafted-vulnerabilities.md
│
├── 03-reporting/               # Reporting phase
│   ├── templates/
│   │   ├── vulnerability-report-template.md
│   │   ├── reproduction-template.md
│   │   └── impact-assessment.md
│   ├── examples/
│   │   ├── example-1.md
│   │   └── example-2.md
│   └── final-reports/           # Final submissions
│
├── 04-documentation/           # Documentation
│   ├── README.md               # This file
│   ├── scope-analysis.md       # Detailed scope analysis
│   ├── exclusion-rules.md      # All exclusions
│   ├── testing-methodology.md  # Testing approach
│   ├── tools-list.md           # Tools and versions
│   └── cheat-sheet.md          # Quick reference
│
├── 05-tools/                   # Tool installations
│   ├── burp-suite/
│   ├── nmap/
│   ├── nikto/
│   ├── ffuf/
│   ├── nuclei/
│   ├── subfinder/
│   └── ...
│
├── .gitignore
├── requirements.txt
└── clear-hackerone-bounty.md   # Main documentation
```

---

## 🛠️ Essential Tools to Install

### **Core Tools**
```bash
# Web security testing
- Burp Suite Pro (latest)
- OWASP ZAP (for comparison)

# Reconnaissance
- Subfinder (subdomain enumeration)
- Amass (advanced reconnaissance)
- Nmap (network scanning)
- Nikto (web server scanning)
- FFUF (fuzzing)
- Nuclei (vulnerability scanning)

# Exploitation
- sqlmap (SQL injection)
- Burp Suite extensions
- Git (for payloads and tools)

# API Testing
- Postman / Insomnia
- HTTPie
- curl (built-in)

# Certificate Authority
- Mitmproxy (for mobile app testing)
```

### **Burp Suite Extensions (Recommended)**
- **Project Burp** - Custom extension to inject X-Bug-Bounty header automatically
- **Param Miner** - Better parameter discovery
- **Cookie Editor** - Easier cookie management
- **Easy Chest** - Credential management

---

## 🚀 First Steps for Reconnaissance

### **Step 1: Header Configuration (1 hour)**
```bash
# 1. Visit this URL with your HackerOne username
# https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=<your-username>

# 2. Verify header is set in browser DevTools (Network tab)
# Request headers should show: X-Bug-Bounty: HackerOne-<your-username>

# 3. Store this in a text file for reference
echo "X-Bug-Bounty: HackerOne-<your-username>" > bug-bounty/01-reconnaissance/data/headers/valid-header.txt
```

### **Step 2: Asset Discovery (2-3 hours)**
```bash
cd bug-bounty/01-reconnaissance

# 1. Create target lists
cat > targets/tier1-domains.txt << EOF
www.clearme.com
clearme.com
my.clearme.com
verified.clearme.com/v1/verification_sessions
web-edge.clearme.com
authentication.clearme.com
enroll.clearme.com
concierge.clearme.com
EOF

# 2. Run subdomain enumeration
subfinder -d clearme.com -o data/recon-results/subdomains.txt

# 3. Run amass for additional discovery
amass enum -passive -d clearme.com -o data/recon-results/amass-passive.txt
amass enum -active -d clearme.com -o data/recon-results/amass-active.txt

# 4. Scan with nuclei (template: http-exposed-headers, etc.)
nuclei -l data/recon-results/subdomains.txt -t http-exposed-headers -o data/recon-results/nuclei-headers.txt
```

### **Step 3: Initial Web Scanning (2-3 hours)**
```bash
# 1. Use nikto for web server scanning
nikto -h https://www.clearme.com -o data/recon-results/nikto-results.txt

# 2. Use ffuf for parameter fuzzing
ffuf -u https://www.clearme.com/FUZZ -w wordlist.txt -H "X-Bug-Bounty: HackerOne-<username>"

# 3. Create Burp Suite project
python scripts/directory-burp.py > burp-project.xml
```

### **Step 4: API Documentation Collection (1-2 hours)**
```bash
# 1. Collect OpenAPI/Swagger specs
# Use browser extension or curl to find spec endpoints
curl https://verified.clearme.com/v1/openapi.json

# 2. Save API documentation
# Manually visit API endpoints and document:
# - Authentication methods (OAuth, JWT, etc.)
# - Endpoint security (rate limiting, input validation)
# - Parameter types and potential injection points
```

### **Step 5: Directory and Path Enumeration (2-3 hours)**
```bash
# Use ffuf for directory brute force
ffuf -u https://www.clearme.com/FUZZ -w wordlist-large.txt -H "X-Bug-Bounty: HackerOne-<username>"

# Check for common patterns
# - /admin, /dashboard, /panel
# - /api, /v1, /v2 endpoints
# - /login, /signup, /auth
# - /config, /settings, /admin
```

---

## 🔍 Priority Testing Priorities

### **High Value Targets (Start Here)**
1. **www.clearme.com / clearme.com** - XSS opportunities in dynamic content
2. **verified.clearme.com/v1/verification_sessions** - API authentication bypass
3. **my.clearme.com** - Authentication flows and session management
4. **web-edge.clearme.com** - SSRF in API endpoints

### **Medium Value Targets**
1. **authentication.clearme.com** - MFA bypass, token manipulation
2. **enroll.clearme.com** - Account creation vulnerabilities
3. **concierge.clearme.com** - Booking/management exploits

### **Low Value Targets**
1. **mobile.clearme.com** - Mobile-specific issues
2. **identity.clearme.com** - Identity verification flaws
3. **scan.clearme.com** - Location-based security

---

## 📊 Reporting Strategy

### **Severity Priorities**
- **Critical** (CVSS 9.0-10.0) - RCE, SQLi, IDOR on auth flows
- **High** (CVSS 7.0-8.9) - XSS, CSRF, improper access control
- **Medium** (CVSS 4.0-6.9) - Information disclosure, CSRF tokens
- **Low** (CVSS 0.1-3.9) - Cosmetic issues, missing headers

### **Report Quality Requirements**
- **Reproducible steps** (step-by-step, exact URLs, payloads)
- **Impact assessment** (affected users, business impact)
- **Proof of concept** (screenshots, console logs, proof URLs)
- **Remediation suggestions** (not required but appreciated)

### **Chain Vulnerabilities**
- Only chain if one vulnerability leads to another
- Document the causal relationship clearly
- Provide full chain for maximum impact

---

## 📚 Quick Reference

### **Valid Examples (In Scope)**
- ✅ XSS on www.clearme.com (affects users)
- ✅ SQL injection in API endpoint
- ✅ Authentication bypass (session ID manipulation)
- ✅ SSRF in parameter validation
- ✅ IDOR (access data from other users)

### **Invalid Examples (Out of Scope)**
- ❌ Self-XSS that cannot affect other users
- ❌ Scanner report (Retire.js output)
- ❌ Social engineering attempt
- ❌ Enumeration of emails
- ❌ Missing autocomplete attributes
- ❌ Vulnerability without working POC

---

## 📝 Spanish Project Naming Convention

To align with the OBJETIVO file language, this project uses Spanish file names:

- **Reconocimiento** → 01-reconnaissance
- **Explotación** → 02-exploitation
- **Reportes** → 03-reporting
- **Documentación** → 04-documentation
- **Herramientas** → 05-tools

---

## ⏱️ Time Allocation Suggested

| Phase | Duration | Focus |
|-------|----------|-------|
| **Setup & Configuration** | 2-4 hours | Install tools, configure headers, test setup |
| **Initial Reconnaissance** | 12-16 hours | Subdomains, directories, headers, API discovery |
| **Targeted Testing** | 24-32 hours | XSS, SQLi, IDOR, authentication, SSRF |
| **Reporting** | 8-12 hours | Document findings, write reports |
| **Total** | **46-64 hours** | |

---

## 🎓 Key Learnings

1. **Header Management is Critical** - Must set X-Bug-Bounty for all web traffic
2. **First Reporter Wins** - If multiple researchers find same bug, first wins
3. **POC is Essential** - Without working exploit, report likely rejected
4. **Scope is Strict** - Many common findings are out of scope (scanner reports, self-XSS)
5. **Quality Over Quantity** - Well-written report > rushed report

---

## 📞 Contact & Resources

- **HackerOne Program**: https://hackerone.com/clear
- **Disclosure Guidelines**: https://docs.hackerone.com/en/articles/8494488-core-ineligible-findings
- **Burp Suite**: https://portswigger.net/burp
- **Nuclei**: https://nuclei.projectdiscovery.io/

---

**Prepared for**: CLEAR Bug Bounty Program on HackerOne
**Last Updated**: September 5, 2026
