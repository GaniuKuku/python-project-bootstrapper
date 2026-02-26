# Python Project Environment Bootstrapper

This project automates the setup of a Python development environment.

## What the script does

- Creates or activates a Python virtual environment
- Upgrades pip
- Creates a .gitignore file if missing
- Installs required Python packages
- Displays colorful terminal messages
- Logs all setup actions to setup.log
- Stops if any error occurs

## How to Run

Make script executable:

chmod +x setup.sh

Run script:

./setup.sh

## Example Output
[INFO] Starting project setup...

[INFO] Checking for virtual environment...

[INFO] Creating new virtual environment...

[SUCCESS] Virtual environment created.

[SUCCESS] Virtual environment activated.

[INFO] Upgrading pip...

[SUCCESS] pip upgraded successfully.

[INFO] Checking for .gitignore...

[SUCCESS] .gitignore created.

[INFO] Installing required Python packages...

[SUCCESS] Packages installed successfully.

[SUCCESS] Project setup completed successfully!

## Challenges Faced

- Handling script reusability
- Preventing duplicate file creation
- Implementing logging system
- Managing error handling with set -e

## Lessons Learned

- Importance of automation in Data Engineering
- Writing modular Bash functions
- Using conditional checks in Bash
- Improving user experience with colored output

