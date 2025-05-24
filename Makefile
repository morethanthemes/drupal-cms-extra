SHELL := /bin/bash
DRUSH := ./vendor/bin/drush
COMPOSER := composer

ENV_FILE := .env

default: setup-admin install-modules

# Load environment variables from .env
include $(ENV_FILE)
export

setup-admin:
	@echo "Setting admin password..."
	$(DRUSH) user-password admin --password="$$(openssl rand -base64 16)"
	@echo "Updating admin email..."
	$(DRUSH) user:email admin dev@morethanthemes.com

install-modules:
	@echo "Requiring and enabling Passwordless module..."
	$(COMPOSER) require drupal/passwordless:^2.0@beta
	$(DRUSH) pm-enable passwordless -y
	@echo "Requiring and enabling Simple Style Guide module..."
	$(COMPOSER) require drupal/simple_styleguide
	$(DRUSH) pm-enable simple_styleguide -y


setup-gtm:
	@echo "Installing and configuring Google Tag Manager module..."
	$(COMPOSER) require drupal/gtm
	$(DRUSH) pm-enable gtm -y
	$(DRUSH) config-set gtm.settings gtm_id "$(GTM_ID)" -y