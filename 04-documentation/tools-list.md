# Tools Installation Guide for CLEAR Bug Bounty

## Core Tools Installation

### 1. Burp Suite Pro
```bash
# Download from: https://portswigger.net/burp/pro
# License: Free for personal bug bounty research

# Install instructions:
# - macOS: brew install --cask burpsuite
# - Windows: Download installer and run
# - Linux: Download .sh installer from PortSwigger website
```

### 2. Nuclei (Vulnerability Scanner)
```bash
# Install nuclei via Go
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

# Verify installation
nuclei -version

# Run basic scan
nuclei -u https://www.clearme.com -t http -t vuln
```

### 3. Subfinder (Subdomain Enumeration)
```bash
# Install via Go
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Verify
subfinder -version

# Run scan
subfinder -d clearme.com
```

### 4. Amass (Advanced Reconnaissance)
```bash
# Install via Go
go install -v github.com/owasp-amass/amass/v4/...@master

# Verify
amass version

# Run passive enumeration
amass enum -passive -d clearme.com

# Run active enumeration
amass enum -active -d clearme.com
```

### 5. Nmap (Network Scanning)
```bash
# macOS (Homebrew)
brew install nmap

# Ubuntu/Debian
sudo apt-get install nmap

# Fedora
sudo dnf install nmap

# Run scan
nmap -sV -sC -p- www.clearme.com
```

### 6. Nikto (Web Server Scanner)
```bash
# macOS
brew install nikto

# Ubuntu/Debian
sudo apt-get install nikto

# Run scan
nikto -h https://www.clearme.com
```

### 7. FFUF (Fuzzing)
```bash
# macOS
brew install ffuf

# Ubuntu/Debian
sudo apt-get install ffuf

# Run fuzz
ffuf -u https://www.clearme.com/FUZZ -w wordlist.txt
```

### 8. SQLMap (SQL Injection)
```bash
# Download from: https://sqlmap.org/
# Or use pip
pip install sqlmap

# Run test
sqlmap -u "https://www.clearme.com/api/users?id=1" --batch
```

## Burp Suite Extensions

### Recommended Extensions
1. **Project Burp** - Custom extension for header management
2. **Param Miner** - Better parameter discovery
3. **Cookie Editor** - Cookie management
4. **Easy Chest** - Credential management
5. **CORSscanner** - CORS vulnerability detection

### Install Extensions
1. Open Burp Suite
2. Go to Extensions tab
3. Click "Add"
4. Add your extensions
5. Configure headers (X-Bug-Bounty)

## Python Tools (Optional)

```bash
# Create virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install required packages
pip install requests
pip install selenium
pip install beautifulsoup4
pip install httpx
```

## Test Your Installation

```bash
# Test header configuration
source .clear-bounty-aliases.sh
echo $X_BUG_BOUNTY

# Test subfinder
recon-subfinder

# Test nuclei
recon-nuclei

# Test nikto
recon-nikto
```

## Tools Version Check

```bash
# Check installed versions
echo "Burp Suite: $(which burpsuite)"
echo "Nuclei: $(nuclei -version 2>/dev/null | head -n1)"
echo "Subfinder: $(subfinder -version 2>/dev/null)"
echo "Nmap: $(nmap --version)"
echo "Nikto: $(nikto -version)"
```

## Maintenance

- Keep tools updated regularly
- Subscribe to tool newsletters for security updates
- Review new vulnerability databases (CVE, MITRE)

## Documentation Resources

- Nuclei Templates: https://github.com/projectdiscovery/nuclei-templates
- Burp Suite Extensions: https://portswigger.net/bappstore
- Bug Bounty Cheat Sheet: https://portswigger.net/web-security
