# QUICK START GUIDE - CLEAR Bug Bounty Project

## 🚀 First 24 Hours

### Hour 1: Setup & Configuration
```bash
# 1. Navigate to project directory
cd /workspaces/bug-bounty

# 2. Install tools (see tools-list.md for details)
# - Burp Suite
# - Nuclei
# - Subfinder
# - Amass
# - Nmap
# - Nikto

# 3. Set up your HackerOne username header
source .clear-bounty-aliases.sh
# When prompted, enter your HackerOne username
```

### Hour 2-3: Header Verification
```bash
# 1. Visit this URL in your browser with your HackerOne username:
https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=<YOUR_USERNAME>

# 2. Open DevTools (F12) → Network tab
# 3. Look for the X-Bug-Bounty header in requests
# 4. It should show: X-Bug-Bounty: HackerOne-<YOUR_USERNAME>

# 5. Store the header value
echo "HackerOne-<YOUR_USERNAME>" > bug-bounty/01-reconnaissance/data/headers/current-header.txt
```

### Hours 4-6: Initial Reconnaissance
```bash
# 1. Start with subdomain enumeration
subfinder -d clearme.com -o bug-bounty/01-reconnaissance/data/recon-results/subdomains.txt

# 2. Check for common directories
nikto -h https://www.clearme.com -o bug-bounty/01-reconnaissance/data/recon-results/nikto-results.txt

# 3. Run vulnerability scanner
nuclei -l bug-bounty/01-reconnaissance/data/recon-results/subdomains.txt -t http-exposed-headers -o bug-bounty/01-reconnaissance/data/recon-results/nuclei-headers.txt

# 4. Review results
cat bug-bounty/01-reconnaissance/data/recon-results/subdomains.txt
cat bug-bounty/01-reconnaissance/data/recon-results/nikto-results.txt
```

### Hours 7-12: Targeted Testing (Priority Targets)
```bash
# 1. Test primary targets
# Use Burp Suite for manual testing
# - www.clearme.com
# - my.clearme.com
# - clearme.com

# 2. Look for:
#   - Login pages (check for XSS, SQLi, IDOR)
#   - Profile pages (check for IDOR)
#   - API endpoints (check for injection, auth issues)

# 3. Test parameters with ffuf
ffuf -u https://www.clearme.com/FUZZ -w /usr/share/wordlists/dirb/common.txt -H "X-Bug-Bounty: HackerOne-<YOUR_USERNAME>"
```

### Hours 13-16: API Testing
```bash
# 1. Collect API documentation
curl https://verified.clearme.com/v1/openapi.json

# 2. Test endpoints with sqlmap
sqlmap -u "https://verified.clearme.com/v1/api/users?id=1" --batch

# 3. Check for authentication bypass
# Look for JWT manipulation, session fixation, etc.
```

### Hours 17-20: Document Findings
```bash
# 1. Use reporting template
cd bug-bounty/03-reporting
cp templates/vulnerability-report-template.md vulnerability-report.md

# 2. Fill in details for any findings
# 3. Save to final-reports/

# 4. Submit via HackerOne
```

### Hours 21-24: Review & Refine
```bash
# 1. Review all findings
# 2. Verify they are in scope (check exclusion-rules.txt)
# 3. Test reproductions are solid
# 4. Prepare screenshots
```

---

## 🎯 This Week's Focus

### Monday-Friday: Reconnaissance
- Subdomain enumeration
- Directory/path discovery
- Header analysis
- API documentation
- Initial vulnerability scanning

### Saturday-Sunday: Testing
- XSS testing on priority targets
- SQL injection testing on APIs
- Authentication flow analysis
- IDOR testing on member data
- Session management review

---

## 🔥 High Priority Testing Checklist

- [ ] XSS on www.clearme.com (reflected and stored)
- [ ] SQL injection on API endpoints
- [ ] Authentication bypass (session ID manipulation)
- [ ] IDOR on member data
- [ ] CSRF tokens validation
- [ ] SSRF in parameter validation
- [ ] API rate limiting bypass
- [ ] Open redirect vulnerabilities
- [ ] Insecure direct object references
- [ ] Information disclosure

---

## ⚠️ Common Pitfalls to Avoid

1. **❌ Don't use scanner-only reports** - They're automatically rejected
2. **❌ Don't submit self-XSS without impact** - Only if it affects others
3. **❌ Don't skip header verification** - Will get reports rejected
4. **❌ Don't brute force rate limits** - Can get you banned
5. **❌ Don't skip proof of concept** - Report will be ignored
6. **❌ Don't test with mass accounts** - Max ~12 accounts recommended
7. **❌ Don't forget the header** - All requests MUST have X-Bug-Bounty

---

## 📊 Success Metrics

- **Subdomains discovered**: >100 (current count: 21)
- **Vulnerabilities found**: 0-3 initially (quality > quantity)
- **Reports submitted**: 1-2 per week
- **Response time**: <48 hours for triage

---

## 📚 Next Steps

1. **Install tools** (see tools-list.md)
2. **Configure headers** (see set-header.sh)
3. **Start reconnaissance** (subfinder, nikto, nuclei)
4. **Manual testing** (Burp Suite, ffuf)
5. **Document findings** (using template)
6. **Submit reports** (via HackerOne)

---

**Need Help?**
- Review exclusion-rules.txt for scope clarity
- Check vulnerability-report-template.md for report format
- Consult HackerOne documentation for program specifics

**Time to Start**: NOW! 🚀
