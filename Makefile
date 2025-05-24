SHELL := /bin/bash
DRUSH := ./vendor/bin/drush
COMPOSER := composer

default: setup-admin install-modules

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
