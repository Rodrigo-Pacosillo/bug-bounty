# Clear command: clear
alias clearall='clear && echo "=== CLEAR Bug Bounty Project ===" && echo "Current Header: $X_BUG_BOUNTY" && echo ""'

# Quick recon shortcuts
alias recon-subfinder='subfinder -d clearme.com -o bug-bounty/01-reconnaissance/data/recon-results/subdomains.txt'
alias recon-amass='amass enum -passive -d clearme.com -o bug-bounty/01-reconnaissance/data/recon-results/amass-passive.txt'
alias recon-nuclei='nuclei -l bug-bounty/01-reconnaissance/data/recon-results/subdomains.txt -t http-exposed-headers -o bug-bounty/01-reconnaissance/data/recon-results/nuclei-headers.txt'
alias recon-nikto='nikto -h https://www.clearme.com -o bug-bounty/01-reconnaissance/data/recon-results/nikto-results.txt'

# Quick exploit shortcuts
alias exploit-xss='node bug-bounty/02-exploitation/scripts/xss-finder.js'
alias exploit-sqli='python3 bug-bounty/02-exploitation/scripts/sql-injector.py'
alias exploit-idor='python3 bug-bounty/02-exploitation/scripts/idor-scanner.py'

# Quick report shortcuts
alias report-new='cd bug-bounty/03-reporting && code templates/vulnerability-report-template.md'

echo "CLEAR Bug Bounty aliases loaded!"
