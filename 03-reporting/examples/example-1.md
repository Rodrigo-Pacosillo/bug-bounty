# Vulnerability Report Template - Example 1

# METADATA
## Title: Reflected Cross-Site Scripting (XSS) on Login Page
## Severity: High
## CVSS Score: 7.5
## Affected Asset: www.clearme.com
## Vulnerability Type: Reflected XSS
## Date Discovered: 2026-09-05
## HackerOne Username: your-username
## Additional References: None

---

## 1. EXECUTIVE SUMMARY

### Problem Statement
The login page on www.clearme.com reflects user input without proper sanitization, allowing malicious scripts to execute in the browser of authenticated users.

### Why This Matters
An attacker can steal session cookies, perform actions on behalf of authenticated users, and potentially redirect users to malicious sites.

### Confirmed?
Yes

---

## 2. REPRODUCTION STEPS

### Step 1
Navigate to https://www.clearme.com/login

### Step 2
Enter a payload in the "Email" field: <script>alert(1)</script>

### Step 3
Click "Sign In"

### Step 4
The script executes immediately, demonstrating XSS

### Step 5
Check the URL - the payload is reflected in the query parameter

### Expected Behavior
The email field should sanitize input and display the email as plain text

### Actual Behavior
The script executes and an alert box appears with "1"

---

## 3. EVIDENCE

### Screenshots
[Include screenshot showing alert box]

### Console Logs
```
<script>alert(1)</script>
```

### Proof URL
```
https://www.clearme.com/login?email=%3Cscript%3Ealert%281%29%3C%2Fscript%3E
```

---

## 4. VULNERABILITY ANALYSIS

### Root Cause
The application does not sanitize input before reflecting it in the response. The login endpoint uses a GET request with user input in the query string, which is then reflected in the HTML response without proper encoding.

### Technical Details
- Affected Parameter: email (GET request parameter)
- Attack Vector: Client-side (Reflected XSS)
- Input Validation: None (or insufficient)

### Exploitability Assessment
- Difficulty: Easy
- Prerequisites: None (no authentication required)
- Business Logic Impact: Yes (can manipulate authenticated sessions)

---

## 5. IMPACT ASSESSMENT

### User Impact
- **Affected Users**: Any user visiting the login page with malicious input
- **Data Exposure**: Session cookies can be stolen via document.cookie
- **Privilege Escalation**: Yes - attacker can impersonate authenticated users
- **Business Impact**: Users may be redirected to phishing sites, leading to account compromise

### Potential Attack Chain
1. Attacker sends a link to user: https://www.clearme.com/login?email=<script>stealCookie()</script>
2. User clicks link and logs in
3. Cookie is stolen via malicious script
4. Attacker uses stolen cookie to access user's account

### Scenarios
1. **Phishing**: Attacker steals session and redirects to fake CLEAR login
2. **Account Takeover**: Attacker can execute actions on behalf of user
3. **Cookie Theft**: Session tokens can be stolen and used to authenticate

---

## 6. RECOMMENDED REMEDIATION

### Immediate Fix
Implement proper input validation and output encoding:
```javascript
// Server-side example
email = email.replace(/</g, "&lt;").replace(/>/g, "&gt;")
```

### Short-term Fixes
1. Use Content-Security-Policy header to prevent script execution
2. Sanitize all user input before reflecting
3. Use HTTPOnly flag on session cookies

### Long-term Improvements
1. Implement comprehensive input validation framework
2. Use a security library for output encoding
3. Adopt OWASP dependency check to prevent known vulnerabilities

---

## 7. ADDITIONAL NOTES

### Testing Environment
- Browser: Chrome 120
- Operating System: Linux
- Testing Conditions: Normal browser

---

## 8. SIGN-OFF

**Report Prepared By**: Bug Bounty Researcher
**Report Date**: 2026-09-05
**Report Type**: New Vulnerability

**Submission**:
- Report submitted via HackerOne
- Tested with X-Bug-Bounty header
