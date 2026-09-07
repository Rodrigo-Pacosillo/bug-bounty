# CLEAR Bug Bounty Project - Complete Structure

## 📁 Project Overview

This project provides a comprehensive, structured approach to the CLEAR HackerOne bug bounty program. It includes:

- ✅ Complete directory structure
- ✅ Pre-configured scripts and templates
- ✅ Tool installation guide
- ✅ Priority target lists
- ✅ Exclusion rules documentation
- ✅ Reporting templates
- ✅ Quick start guide

## 🎯 Project Structure

```
bug-bounty/
├── README.md                           # Main documentation (English)
├── clear-hackerone-bounty.md          # Complete scope and rules
├── QUICK_START.md                      # Quick start guide (Spanish: "Punto de Partida")
├── .clear-bounty-aliases.sh           # Shell aliases for convenience
│
├── 01-reconnaissance/                 # 🔍 Reconnaissance Phase
│   ├── scripts/
│   │   └── set-header.sh              # Set X-Bug-Bounty header
│   ├── targets/
│   │   ├── tier1-domains.txt          # Priority targets
│   │   └── exclusion-rules.txt        # What's out of scope
│   ├── data/
│   │   ├── headers/
│   │   │   └── current-header.txt     # Store valid header
│   │   └── recon-results/             # Scan results
│   └── reports/
│       └── initial-scan-report.md     # Initial reconnaissance report
│
├── 02-exploitation/                   # 💣 Exploitation Phase
│   ├── scripts/
│   │   ├── sql-injector.py            # SQL injection scanner
│   │   ├── xss-finder.js              # XSS detection
│   │   ├── ssrf-scanner.go            # SSRF scanner
│   │   ├── auth-tester.py             # Authentication testing
│   │   ├── idor-scanner.py            # IDOR detection
│   │   └── burp-extensions/           # Custom Burp Suite extensions
│   ├── payloads/                      # Custom payloads
│   │   ├── xss/
│   │   ├── sqli/
│   │   ├── ssrf/
│   │   └── auth/
│   └── findings/                      # Exploitation results
│       └── drafted-vulnerabilities.md
│
├── 03-reporting/                      # 📝 Reporting Phase
│   ├── templates/
│   │   └── vulnerability-report-template.md
│   ├── examples/
│   │   └── example-1.md               # XSS example
│   └── final-reports/                 # Final submissions
│
├── 04-documentation/                  # 📚 Documentation
│   ├── tools-list.md                  # Tool installation guide
│   ├── scope-analysis.md              # Detailed scope
│   ├── exclusion-rules.md             # All exclusions
│   ├── testing-methodology.md         # Testing approach
│   └── cheat-sheet.md                 # Quick reference
│
└── 05-tools/                          # 🛠️ Tool Installations
    ├── burp-suite/
    ├── nmap/
    ├── nikto/
    ├── ffuf/
    ├── nuclei/
    ├── subfinder/
    └── amass/
```

## 🎓 Key Features

### Priority Targeting
- **Tier 1**: www.clearme.com, my.clearme.com, verified.clearme.com (highest reward potential)
- **Tier 2**: Mobile backend, identity platform
- **Tier 3**: Investor relations, lower traffic

### Comprehensive Exclusions
- Self-XSS that cannot affect other users
- Scanner-generated reports
- Social engineering attacks
- EOL browser vulnerabilities
- Google Maps API key exposure
- HackerOne Core Ineligible Findings

### Program-Specific Rules
- **X-Bug-Bounty header** required for all web traffic
- **Header validity**: 1 week (revisit weekly)
- **App installation**: Specific links required
- **First reporter wins** on duplicates
- **No mass account creation**

## 🚀 Quick Start

```bash
# 1. Set up environment
source .clear-bounty-aliases.sh

# 2. Configure your header
./bug-bounty/01-reconnaissance/scripts/set-header.sh

# 3. Start reconnaissance
recon-subfinder  # Subdomain enumeration
recon-nikto      # Web server scan
recon-nuclei     # Vulnerability scanning

# 4. Report findings
report-new      # Open template
```

## 📊 Current Status

### In-Scope Assets (21 total)
- **11 with reports**: www.clearme.com (11%), clearme.com (27%), my.clearme.com (9%), clearme.atlassian.net (3%)
- **10 with 0 reports**: Most backend and API domains

### Priority Focus Areas
1. **XSS on www.clearme.com** (reflected and stored)
2. **SQL injection on verified.clearme.com API**
3. **Authentication bypass on my.clearme.com**
4. **IDOR on member profile pages**
5. **SSRF in web-edge.clearme.com**

### Expected Rewards (per HackerOne stats)
- Critical: $3,500-$15,000
- High: $1,000-$3,500
- Medium: $500-$1,000
- Low: $1-$500

## 📋 Next Steps

### Immediate (Today)
1. ✅ Install Burp Suite and other tools
2. ✅ Set up X-Bug-Bounty header
3. ✅ Run initial reconnaissance (subfinder, nikto, nuclei)
4. ✅ Visit test URL to verify header configuration

### This Week
1. Start manual testing on Tier 1 targets
2. Create custom Burp Suite extension for header management
3. Test authentication flows for bypasses
4. Test API endpoints for injection vulnerabilities

### This Month
1. Submit 1-2 high-quality reports per week
2. Analyze response patterns from HackerOne
3. Test mobile app via provided installation link
4. Explore lower-priority targets

## 🎯 Success Strategy

### Quality Over Quantity
- Focus on finding **1-3** high-quality bugs per week
- Prioritize bugs that affect multiple users
- Ensure reproducible, well-documented findings

### Systematic Approach
1. **Reconnaissance**: Map attack surface
2. **Enumeration**: Find entry points
3. **Targeted Testing**: Focus on high-value targets
4. **Document**: Create detailed reports
5. **Submit**: Via HackerOne with proper header

### Common Vulnerability Types
- **XSS** (reflected, stored, DOM-based)
- **SQL injection** (SQLi)
- **IDOR** (Insecure Direct Object References)
- **Authentication bypass** (session ID manipulation, token tampering)
- **SSRF** (Server-Side Request Forgery)
- **CSRF** (Cross-Site Request Forgery)
- **Open redirect** vulnerabilities

## ⚠️ Critical Rules

### DO
- ✅ Set X-Bug-Bounty header for all requests
- ✅ Use first reporter privilege wisely
- ✅ Provide working proof of concept
- ✅ Test only with valid accounts
- ✅ Follow disclosure policy

### DON'T
- ❌ Submit scanner-generated reports
- ❌ Test self-XSS that can't affect others
- ❌ Brute force rate limits
- ❌ Mass-create accounts
- ❌ Publicly disclose before triage
- ❌ Test with outdated browsers

## 📚 Resources

### Official Resources
- HackerOne CLEAR Program: https://hackerone.com/clear
- HackerOne Scope: https://hackerone.com/clear/scope
- Core Ineligible Findings: https://docs.hackerone.com/en/articles/8494488-core-ineligible-findings

### Tools
- Burp Suite: https://portswigger.net/burp
- Nuclei: https://nuclei.projectdiscovery.io/
- Subfinder: https://github.com/projectdiscovery/subfinder
- OWASP: https://owasp.org/

### Documentation
- Vulnerability Report Template: bug-bounty/03-reporting/templates/
- Tool Installation Guide: bug-bounty/04-documentation/tools-list.md
- Exclusion Rules: bug-bounty/01-reconnaissance/targets/exclusion-rules.txt

## 🎉 You're Ready!

The project structure is complete. Start with the Quick Start guide and begin systematic reconnaissance on the priority targets.

**Good luck! 🍀**

---

**Last Updated**: September 5, 2026
**Project Status**: Ready for exploitation
**Language**: Spanish project files, English documentation
