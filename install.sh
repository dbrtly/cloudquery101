#!/bin/bash 

# Install CloudQuery
if [[ $(command -v brew) == "" ]]; then
    echo "Homebrew not found. Installing CloudQuery using curl..."
    curl -L https://github.com/cloudquery/cloudquery/releases/download/cli-v2.4.1/cloudquery_darwin_amd64 -o cloudquery
    chmod a+x cloudquery
    mv cloudquery ~/.local/bin/
else
    echo "Homebrew found. Installing CloudQuery..."
    brew install cloudquery/tap/cloudquery
fi

# Install GitHub CLI
if ! command -v gh &> /dev/null; then
    echo "gh not found, installing..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Downloading and installing gh for Linux
        curl -L https://github.com/cli/cli/releases/latest/download/gh_$(curl -s https://api.github.com/repos/cli/cli/releases/latest | grep 'tag_name' | cut -d\" -f4)_linux_amd64.deb -o gh.deb
        sudo apt install ./gh.deb
        rm gh.deb
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Check if asdf is available
        if command -v asdf &> /dev/null; then
            # Use asdf to install the version of gh specified in .tool-versions
            echo "asdf found. Installing gh using asdf..."
            asdf install github-cli $(grep "github-cli" .tool-versions | cut -d ' ' -f2)
        else
            # Downloading and installing gh for macOS
            brew install gh
        fi
    else
        echo "Unsupported operating system. Please install gh manually from https://github.com/cli/cli"
        exit 1
    fi
else
    echo "gh is already installed"
fi

# make run.sh executable
find . -name "run.sh" -type f -exec chmod +x {} \;

if ! command -v direnv &> /dev/null
then
    echo direnv not installed. Loading manually.
    source .envrc
fi
