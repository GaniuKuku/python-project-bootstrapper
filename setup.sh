#!/bin/bash

# Stop script immediately if any command fails
set -e

# Log file (save for later debugging)
LOG_FILE="setup.log"

# Redirect all output to log file
exec > >(tee -a $LOG_FILE) 2>&1

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' 

#Logging functions
info() {
    echo -e "${BLUE}[INFO] $1${NC}"
}

success() {
    echo -e "${GREEN}[SUCCESS] $1${NC}"
}

warning() {
    echo -e "${YELLOW}[WARNING] $1${NC}"
}

error() {
    echo -e "${RED}[ERROR] $1${NC}"
}

#Setup environment function
setup_virtualenv() {
    info "Checking for virtual environment..."

    if [ -d ".venv" ]; then
        warning "Virtual environment already exists. Activating..."
    else
        info "Creating new virtual environment..."
        python3 -m venv .venv
        success "Virtual environment created."
    fi

    source .venv/bin/activate
    success "Virtual environment activated."
}

#Upgrade pip
upgrade_pip() {
    info "Upgrading pip..."
    python -m pip install --upgrade pip
    success "pip upgraded successfully."
}

#Create .gitignore
create_gitignore() {
    info "Checking for .gitignore..."

    if [ -f ".gitignore" ]; then
        warning ".gitignore already exists. Skipping creation."
    else
        cat <<EOL > .gitignore
.venv/
__pycache__/
*.pyc
*.pyo
*.pyd
.env
*.sqlite3
*.log
EOL
        success ".gitignore created."
    fi
}

#Install require packages
install_packages() {
    info "Installing required Python packages..."
    pip install pandas requests
    success "Packages installed successfully."
}

#Main function
main() {
    info "Starting project setup..."

    setup_virtualenv
    upgrade_pip
    create_gitignore
    install_packages

    success "Project setup completed successfully!"
}

main
