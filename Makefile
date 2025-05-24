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
	$(DRUSH) user:password admin "$(openssl rand -base64 16)"
	@echo "Updating admin email..."
	$(DRUSH) config:set system.site system.site.mail admin_email=dev@morethanthemes.com -y
install-modules:
#	Passwordless is not ready for Drupal 11
#
#	@echo "Requiring and enabling Passwordless module..."
#	$(COMPOSER) require drupal/passwordless
#	$(DRUSH) pm-enable passwordless -y
	@echo "Requiring and enabling Simple Style Guide module..."
	$(COMPOSER) require drupal/simple_styleguide
	$(DRUSH) pm-enable simple_styleguide -y


setup-gtm:
	@echo "Installing and configuring Google Tag Manager module..."
	$(COMPOSER) require drupal/gtm
	$(DRUSH) pm-enable gtm -y
	$(DRUSH) config-set gtm.settings gtm_id "$(GTM_ID)" -y