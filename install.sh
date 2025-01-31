#!/bin/zsh

# Install Homebrew (if not already installed)
if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Azure CLI
echo "###############################################"
echo "Installing Azure CLI..."
brew update && brew install azure-cli

# Enable Azure CLI autocompletion
echo "Enabling Azure CLI autocompletion..."
az completion -zsh > ~/.azure-completion.zsh
echo "source ~/.azure-completion.zsh" >> ~/.zshrc

# Install Terraform
echo "Installing Terraform..."
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Enable Terraform autocompletion
echo "Enabling Terraform autocompletion..."
terraform -install-autocomplete

# Verify installation
echo "Installed Azure CLI version:"
az --version

echo "Installed Terraform version:"
terraform -v

echo "Installation complete"
echo "###############################################"
