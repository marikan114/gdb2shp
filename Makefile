# Makefile for gb2shp project

# Set virtual environment name
VENV					=	venv
export VIRTUAL_ENV      := $(abspath ${VENV})
export PATH             := ${VIRTUAL_ENV}/bin:${PATH}

# Set Python environment
PYTHON_SYSTEM	= python3
PYTHON 			= $(VIRTUAL_ENV)/bin/python

# Set Python package manager
PIP 			= $(VIRTUAL_ENV)/bin/pip


# Set requirements file
REQUIREMENTS	= requirements.txt

# Set script name
SCRIPT	= gdb2shp.py

# ANSI color codes
BLACK        := $(shell tput -Txterm setaf 0)
RED          := $(shell tput -Txterm setaf 1)
GREEN        := $(shell tput -Txterm setaf 2)
YELLOW       := $(shell tput -Txterm setaf 3)
LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
PURPLE       := $(shell tput -Txterm setaf 5)
BLUE         := $(shell tput -Txterm setaf 6)
WHITE        := $(shell tput -Txterm setaf 7)
RESET		 := $(shell tput -Txterm sgr0)

# Create virtual environment
venv:
	$(PYTHON_SYSTEM) -m venv $(VENV)
	$(VENV)/bin/pip install --upgrade pip

# Install requirements
install: venv
	$(PIP) install -r $(REQUIREMENTS)
	@echo "$(GREEN)Install requirements completed successfully.$(RESET)"

# Run script in virtual environment
run: install
	$(PYTHON) $(SCRIPT)

# Install requirements and run script
all: venv install run

# Clean up
clean:
	rm -rf extracted_shapefiles extraction.log
	rm -rf $(VENV)

# Help
help:
	@echo "$(BLUE)Usage: make $(GREEN)[target]$(RESET)"
	@echo ""
	@echo "  make $(GREEN)venv$(RESET)        Create virtual environment"
	@echo "  make $(GREEN)install$(RESET)     Install requirements in virtual environment"
	@echo "  make $(GREEN)run$(RESET)         Run script in virtual environment"
	@echo "  make $(GREEN)all$(RESET)         Create virtual environment, install requirements, and run script"
	@echo "  make $(GREEN)clean$(RESET)       Clean up extracted shapefiles, log file, and virtual environment"
	@echo "  make $(GREEN)help$(RESET)        Show this help message"

# vim:noexpandtab:ts=8:sw=8:ai
#EOF
