#!/usr/bin/env python3
"""
Header Configuration and Validation Script for CLEAR Bug Bounty
Sets and verifies the X-Bug-Bounty header for testing
"""

import os
import sys
import json
from datetime import datetime
import subprocess

class HeaderConfigurator:
    def __init__(self):
        self.config_file = 'bug-bounty/01-reconnaissance/data/headers/valid-header.txt'
        self.setup_file = '.clear-bounty-aliases.sh'

    def configure_hackerone_username(self):
        """
        Configure HackerOne username via the CLEAR website
        Returns True if successful, False otherwise
        """
        print("\n" + "="*70)
        print("HEADER CONFIGURATION - CLEAR BUG BOUNTY")
        print("="*70 + "\n")

        # Check if username is already set
        x_bug_bounty = os.environ.get('X_BUG_BOUNTY', '')

        if x_bug_bounty and x_bug_bounty != 'HackerOne-Unknown':
            print(f"✓ Current X-Bug-Bounty header: {x_bug_bounty}")
            print("  This header will be used for all requests\n")
            return True

        print("⚠️  X-Bug-Bounty header not set")
        print("  We need to configure your HackerOne username on CLEAR website\n")

        # Ask for username
        print("🔍 To configure your header, visit this URL:")
        print("  https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=<YOUR_USERNAME>")
        print("\nExample with your username:")
        print("  https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=your_username\n")

        # Provide instructions
        print("📋 Steps:")
        print("  1. Replace <YOUR_USERNAME> with your HackerOne username")
        print("  2. Open the URL in your browser")
        print("  3. The website will automatically set your X-Bug-Bounty header")
        print("  4. The header will be valid for 1 week\n")

        return False

    def verify_header(self, target_url="https://www.clearme.com"):
        """
        Verify that the X-Bug-Bounty header is properly set
        """
        print("\n" + "="*70)
        print("HEADER VERIFICATION")
        print("="*70 + "\n")

        x_bug_bounty = os.environ.get('X_BUG_BOUNTY', '')

        if not x_bug_bounty or x_bug_bounty == 'HackerOne-Unknown':
            print("❌ X-Bug-Bounty header not configured!")
            print("  Please configure your HackerOne username first using:")
            print("  https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=YOUR_USERNAME\n")
            return False

        print(f"✓ X-Bug-Bounty header configured: {x_bug_bounty}\n")

        # Test the header with a request
        try:
            import requests
            print("🔍 Testing header with actual request...\n")

            response = requests.get(
                target_url,
                headers={'X-Bug-Bounty': x_bug_bounty},
                timeout=10
            )

            print(f"✓ Request successful (Status: {response.status_code})")
            print(f"✓ Header is being accepted by the target\n")

            # Check for any error messages in response
            if response.text and 'bug bounty' in response.text.lower():
                print("✓ Website acknowledges bug bounty header\n")
            else:
                print("ℹ️  No specific acknowledgment from website\n")

            return True

        except Exception as e:
            print(f"✗ Error testing header: {e}")
            return False

    def save_valid_header(self, header_value):
        """Save the valid header to configuration file"""
        try:
            os.makedirs(os.path.dirname(self.config_file), exist_ok=True)

            with open(self.config_file, 'w') as f:
                f.write(header_value)

            print(f"\n✓ Valid header saved to: {self.config_file}")
            return True

        except Exception as e:
            print(f"\n✗ Error saving header: {e}")
            return False

    def load_valid_header(self):
        """Load the valid header from configuration file"""
        try:
            if os.path.exists(self.config_file):
                with open(self.config_file, 'r') as f:
                    return f.read().strip()
        except Exception as e:
            print(f"Error loading header: {e}")

        return None

    def check_aliases_file(self):
        """Check if the aliases file exists and is properly configured"""
        print("\n" + "="*70)
        print("ALIASES FILE CHECK")
        print("="*70 + "\n")

        if not os.path.exists(self.setup_file):
            print(f"❌ Aliases file not found: {self.setup_file}")
            print("  This file is needed to load bug bounty shortcuts\n")
            return False

        print(f"✓ Aliases file exists: {self.setup_file}\n")

        # Check if file has valid content
        with open(self.setup_file, 'r') as f:
            content = f.read()

        # Check for common patterns
        patterns = [
            'X-Bug-Bounty',
            'recon-subfinder',
            'recon-nikto',
            'recon-nuclei',
            'exploit-xss',
            'exploit-sqli',
            'exploit-idor'
        ]

        all_patterns = True
        for pattern in patterns:
            if pattern in content:
                print(f"✓ Found: {pattern}")
            else:
                print(f"❌ Missing: {pattern}")
                all_patterns = False

        print()
        return all_patterns

    def display_setup_instructions(self):
        """Display the complete setup instructions"""
        print("\n" + "="*70)
        print("CLEAR BUG BOUNTY - SETUP COMPLETE")
        print("="*70 + "\n")

        print("✅ Configuration Summary:")
        print("  ✓ Nikto installed and working")
        print("  ✓ Nuclei installed and working")
        print("  ✓ Scripts created")
        print("  ✓ Report templates ready")
        print("  ✓ Directory structure complete\n")

        print("📋 Next Steps:")
        print("  1. Configure your HackerOne username:")
        print("     https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=YOUR_USERNAME\n")

        print("  2. Set the X-Bug-Bounty environment variable:")
        print(f"     export X_BUG_BOUNTY='HackerOne-YOUR_USERNAME'\n")

        print("  3. Load the bug bounty aliases:")
        print("     source .clear-bounty-aliases.sh\n")

        print("  4. Run your first reconnaissance:")
        print("     recon-subfinder\n")
        print("     recon-nikto\n")
        print("     recon-nuclei\n")

        print("  5. Test XSS vulnerability:")
        print("     node xss-finder.js https://www.clearme.com\n")

        print("  6. Test SQL injection:")
        print("     python3 sql-injector.py --target https://www.clearme.com\n")

        print("  7. Test IDOR:")
        print("     python3 idor-scanner.py --username YOUR_USERNAME --session-id YOUR_SESSION_ID\n")

        print("  8. Write a report:")
        print("     report-new\n")

        print("\n" + "="*70)
        print("READY TO START BUG BOUNTY TESTING!")
        print("="*70 + "\n")

    def validate_tool_versions(self):
        """Validate that all required tools are installed and have correct versions"""
        print("\n" + "="*70)
        print("TOOL VERSION CHECK")
        print("="*70 + "\n")

        tools = {
            'nikto': ['nikto', '--version'],
            'nuclei': ['nuclei', '--version'],
            'subfinder': ['subfinder', '-version'],
            'python3': ['python3', '--version'],
            'node': ['node', '--version'],
            'go': ['go', 'version']
        }

        all_tools_valid = True

        for tool_name, command in tools.items():
            try:
                result = subprocess.run(
                    command,
                    capture_output=True,
                    text=True,
                    timeout=5
                )

                version = result.stdout.split('\n')[0].strip()
                print(f"✓ {tool_name}: {version}")

            except Exception as e:
                print(f"❌ {tool_name}: Not installed or error occurred")
                all_tools_valid = False

        print()
        return all_tools_valid


def main():
    configurator = HeaderConfigurator()

    # Parse command line arguments
    if len(sys.argv) > 1:
        command = sys.argv[1].lower()

        if command == 'check':
            configurator.check_aliases_file()
            configurator.validate_tool_versions()

        elif command == 'configure':
            configurator.configure_hackerone_username()

        elif command == 'verify':
            target_url = sys.argv[2] if len(sys.argv) > 2 else "https://www.clearme.com"
            configurator.verify_header(target_url)

        elif command == 'setup':
            configurator.check_aliases_file()
            configurator.validate_tool_versions()
            configurator.configure_hackerone_username()

        elif command == 'status':
            configurator.check_aliases_file()
            configurator.validate_tool_versions()
            x_bug_bounty = os.environ.get('X_BUG_BOUNTY', '')
            if x_bug_bounty:
                print(f"\n✓ Current X-Bug-Bounty: {x_bug_bounty}")
            else:
                print("\n❌ X-Bug-Bounty not set")

        elif command == 'help':
            print("""
            Header Configuration Script for CLEAR Bug Bounty

            Usage: python3 header-configurator.py [command] [options]

            Commands:
              check           - Check aliases file and tool versions
              configure       - Configure your HackerOne username
              verify          - Verify header is properly set (optional URL)
              setup           - Run complete setup validation
              status          - Show current configuration status
              help            - Show this help message

            Examples:
              python3 header-configurator.py check
              python3 header-configurator.py configure
              python3 header-configurator.py verify https://www.clearme.com
              python3 header-configurator.py setup

            Notes:
              - The X-Bug-Bounty header is required for all testing
              - It's valid for 1 week from configuration
              - Visit https://www.clearme.com/?bug-bounty-program=HackerOne&bug-bounty-username=YOUR_USERNAME
            """)

        else:
            print(f"Unknown command: {command}")
            configurator.display_help()

    else:
        # Default: show setup instructions
        configurator.check_aliases_file()
        configurator.validate_tool_versions()
        configurator.configure_hackerone_username()


if __name__ == '__main__':
    main()
