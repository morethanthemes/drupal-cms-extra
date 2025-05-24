SHELL := /bin/bash
DRUSH := ./vendor/bin/drush
COMPOSER := composer

default: setup-admin install-modules

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
