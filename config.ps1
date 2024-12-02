# Define global variables
$global:PROJECT_NAME = "ml-boilerplate"
$global:PYTHON_VERSION = "3.12"
$global:PYTHON_INTERPRETER = "python"

# Set up python interpreter environment
function create_environment {
    if (-Not (Test-Path -Path ".$global:PROJECT_NAME")) {
        & $global:PYTHON_INTERPRETER -m venv ".$global:PROJECT_NAME"
        Write-Output ">>> python sandbox environment created."
    } else {
        Write-Output ">>> python sandbox environment already exists"
    }
    Write-Output ">>> Activate python sandbox environment using command: activate_environment"
}

# Activate python interpreter environment
function activate_environment {
    Write-Output ">>> Activating python sandbox environment"
    try {
        & ".$global:PROJECT_NAME/Scripts/Activate.ps1"
        Write-Output ">>> Activated python sandbox environment"
        Write-Output ">>> Run 'deactivate' to exit the environment"
    } catch {
        Write-Output ">>> Error: Failed to activate python sandbox environment"
        Write-Output $_.Exception.Message
    }
}

# Install Python Dependencies
function install_requirements {
    try {
        & $global:PYTHON_INTERPRETER -m pip install -r dev-requirements.txt
        Write-Output ">>> Python dependencies installed successfully"
    } catch {
        Write-Output ">>> Error: Failed to install python dependencies"
        Write-Output $_.Exception.Message
    }
}