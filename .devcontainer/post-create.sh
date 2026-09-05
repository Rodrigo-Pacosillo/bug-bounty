#!/usr/bin/env bash
set -euo pipefail

# Go tools — si un path falla, el correcto está en el README del repo
GO_TOOLS=(
  github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
  github.com/projectdiscovery/httpx/cmd/httpx@latest
  github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
  github.com/projectdiscovery/katana/cmd/katana@latest
  github.com/projectdiscovery/dnsx/cmd/dnsx@latest
  github.com/projectdiscovery/naabu/cmd/naabu@latest
  github.com/projectdiscovery/interactsh/v2/cmd/interactsh-client@latest
  github.com/projectdiscovery/notify/cmd/notify@latest
  github.com/ffuf/ffuf/v2@latest
  github.com/tomnomnom/gf@latest
  github.com/tomnomnom/qsreplace@latest
  github.com/tomnomnom/assetfinder@latest
  github.com/hahwull/dalfox/v2@latest
  github.com/lc/gau/v2/cmd/gau@latest
  github.com/BishopFox/jsluice/cmd/jsluice@latest
  github.com/gitleaks/gitleaks/v8@latest
)
go install -v "${GO_TOOLS[@]}"

# Python tools (mitmproxy = tu "Burp" headless dentro del codespace)
pip install --user waymore uro arjun mitmproxy
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

# gf patterns
mkdir -p ~/.gf
git clone --depth 1 https://github.com/1ndianl33t/Gf-Patterns /tmp/gfp
cp /tmp/gfp/*.json ~/.gf/ && rm -rf /tmp/gfp

# Knowledge (clonados, NO commiteados: ~200MB)
for repo in danielmiessler/SecLists swisskyrepo/PayloadsAllTheThings EdOverflow/can-i-take-over-xyz; do
  name=$(basename "$repo")
  [ -d "knowledge/$name" ] || git clone --depth 1 "https://github.com/$repo" "knowledge/$name"
done

# Templates y opencode
nuclei -update-templates
curl -fsSL https://opencode.ai/install | bash
echo "✅ workspace listo — corre 'opencode' para empezar"
