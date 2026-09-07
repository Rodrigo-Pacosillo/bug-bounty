# CLEAR Bug Bounty - Vulnerability Report

## Vulnerability Details

- **Type**: [IDOR / XSS / SQL Injection / SSRF / Authentication Bypass]
- **Severity**: [Critical / High / Medium / Low]
- **Affected Asset**: [URL]
- **Discovery Date**: [Date]

## Summary

Brief description of the vulnerability and its impact.

## Technical Details

### Vulnerability Description

Detailed explanation of what the vulnerability allows an attacker to do.

### Root Cause

Why the vulnerability exists (e.g., missing authorization checks, insufficient input validation, etc.)

### Attack Vector

How to exploit the vulnerability (step-by-step technical details)

## Proof of Concept

### Steps to Reproduce

1. **Step 1**: [Action]
   ```
   [Command/URL]
   ```

2. **Step 2**: [Action]
   ```
   [Command/URL]
   ```

3. **Step 3**: [Action]
   ```
   [Command/URL]
   ```

4. **Result**: [Successful or failed exploitation]

### Request

**URL**: [Affected URL]

**Headers**:
```
X-Bug-Bounty: HackerOne-<your-username>
```

**Request**:
```bash
curl -H "X-Bug-Bounty: HackerOne-<your-username>" \
     -X GET \
     [Affected URL]
```

**Response**:
```json
[Extracted response data]
```

### Screenshots

- [Screenshot showing the vulnerability]
- [Screenshot showing the impact]

## Impact

- **Data Exposed**: [Types of data that can be accessed]
- **Affected Users**: [Number of users affected]
- **Business Impact**: [Business consequences]

## Recommended Fix

### Immediate Fix

[Code or configuration changes needed to fix the vulnerability]

**Example**:
```[code example]```

### Long-term Fix

[Structural improvements and best practices]

## Additional Information

- **Application Version**: [If known]
- **Server Stack**: [Backend and frontend technologies]
- **Discovery Method**: [How you found the vulnerability]

## Attachments

- [PoC scripts]
- [Screenshots]
- [Response logs]

---

**Report Status**: [Draft / Submitted]

**Confidence Level**: [High / Medium / Low]

**Reproducibility**: [Confirmed / Unconfirmed]

---

*Report generated on: [Date]*

*Language: Spanish*
