#!/bin/bash
export DDEV_NO_BEAMUP=true
ddev config --project-type=drupal11 --docroot=web --auto
echo "DDEV configured."

ddev start -y
echo "DDEV started."

ddev composer install --no-interaction
echo "Dependencies (composer) installed."

ddev composer setup-site
echo "Site setup completed."

echo "DDEV launched successfully."
echo "Access the site: https://$(echo $CODESPACE_NAME)-80.app.github.dev"
