SHELL := /bin/bash
DRUSH := ./vendor/bin/drush
COMPOSER := composer

ENV_FILE := .env

default: setup-admin install-modules

# Load environment variables from .env
include $(ENV_FILE)
export

install:
	@echo "Running DDEV installation steps..."
	ddev config --project-type=drupal11 --docroot=web
	ddev start
	ddev composer install
	ddev composer setup-site
	ddev launch

setup-admin:
	@echo "Setting admin password..."
#	$(DRUSH) user:password admin "$$(openssl rand -base64 16)"
	@PASS=$$(openssl rand -base64 16); \
	echo "Generated password: $$PASS"; \
	$(DRUSH) user:password admin "$$PASS"
#	@echo "Updating admin email..."
#	$(DRUSH) config:set system.site system.site.mail admin_email=dev@morethanthemes.com -y

install-modules:
#	Passwordless is not ready for Drupal 11
#
#	@echo "Requiring and enabling Passwordless module..."
#	$(COMPOSER) require drupal/passwordless
#	$(DRUSH) pm-enable passwordless -y
#	@echo "Requiring and enabling Simple Style Guide module..."
#	$(COMPOSER) require drupal/simple_styleguide
#	$(DRUSH) pm-enable simple_styleguide -y

GTM_UUID := 5cd4a5c3-9f7e-4b90-ab72-c8c1365f265b
GTM_ENTITY_ID := $(GTM_ID).68357ddf5caa65.14569244

setup-gtm:
	@echo "Installing and configuring Google Tag Manager module..."
	@echo $(COMPOSER) require drupal/gtm
	@echo $(COMPOSER) require 'drupal/google_tag:^2.0'
#	$(DRUSH) pm-enable gtm -y
	$(DRUSH) pm-enable google_tag -y
#	$(DRUSH) config-set gtm.settings gtm_id "$(GTM_ID)" -y
#	$(DRUSH) config-set gtm.settings admin-pages 0 -y
#	$(DRUSH) config-set gtm.settings admin-disable 0 -y
#	$(DRUSH) config-set gtm.settings google-tag "$(GTM_ID)" -y
	$(DRUSH) config:set google_tag.container.$(GTM_ENTITY_ID) uuid $(GTM_UUID) -y
	$(DRUSH) config:set google_tag.container.$(GTM_ENTITY_ID) id $(GTM_ENTITY_ID) -y
	$(DRUSH) config:set google_tag.container.$(GTM_ENTITY_ID) label $(GTM_ID) -y
	$(DRUSH) config:set google_tag.container.$(GTM_ENTITY_ID) tag_container_ids.0 $(GTM_ID) -y
	$(DRUSH) config:set google_tag.container.$(GTM_ENTITY_ID) advanced_settings.consent_mode false -y
	$(DRUSH) config:set google_tag.settings default_google_tag_entity $(GTM_ENTITY_ID) -y
	$(DRUSH) config:set google_tag.settings use_collection false -y


