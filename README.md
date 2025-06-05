# Drupal CMS Extra

This repository is an enhanced distribution of the official [Drupal CMS](https://www.drupal.org/project/drupal_cms), developed by [More than Themes](https://morethanthemes.com/). It builds upon the standard Drupal CMS by incorporating additional themes, sample content, and pre-configured layouts to provide a richer out-of-the-box experience.

## Getting Started

You have two options to set up and use this enhanced Drupal CMS distribution:

### Option 1: Composer-Based Installation (Recommended for Developers)

This method uses Composer to download all assets (Drupal core, modules, themes, etc.) and assumes Composer is available in your environment. The repository is already preconfigured for local development using [DDEV](https://ddev.com), which is recommended.

**Prerequisites:**

* [Composer](https://getcomposer.org/)
* [DDEV](https://ddev.com) (optional but suggested)

**Installation Steps:**

```bash
git clone https://github.com/morethanthemes/drupal-cms-extra.git
cd drupal-cms-extra
ddev config --project-type=drupal11 --docroot=web
ddev start
ddev composer install
ddev composer setup-site
ddev launch
```

> If not using DDEV, ensure your local environment meets [Drupal system requirements](https://www.drupal.org/docs/system-requirements) and adjust the commands accordingly.

### Option 2: Pre-Packaged ZIP Installation (No Composer Required)

For users without Composer or those seeking a simpler installation process, we provide pre-packaged ZIP files that include all necessary files.

**Steps:**

1. Download the latest release from:
   👉 [https://github.com/morethanthemes/drupal-cms-extra/releases/latest](https://github.com/morethanthemes/drupal-cms-extra/releases/latest)
2. Extract the ZIP file into your web server's root directory.
3. Make sure your environment meets [Drupal's system requirements](https://www.drupal.org/docs/system-requirements).
4. Open your site in a browser and follow the Drupal installation wizard.

## Enhanced Features

This enhanced distribution offers a richer default experience compared to the stock Drupal CMS:

* **Pre-installed Free Themes** (latest versions):

  * [BaseCore](https://www.drupal.org/project/basecore)
  * [Corporate Clean](https://www.drupal.org/project/corporateclean)
  * [Bootstrap Business](https://www.drupal.org/project/bootstrap_business)

* **Convincing Sample Content**
  Sample content for all core content types in Drupal CMS to demonstrate layouts and features.

* **Landing Pages Content Type**
  A dedicated content type for creating marketing or campaign landing pages using the Layout Builder.

* **Reusable Blocks**
  A library of reusable content blocks for assembling rich page layouts.

* **Sample Landing Pages**
  Pre-configured landing pages built using sample content and blocks.

> This setup allows you to replicate the look and structure of More than Themes’ live demos like [Corporate Clean](https://corporateclean.morethanthemes.com/).


## Documentation

For more information on included themes, blocks, and layout features, please refer to:
📘 [Webmaker+ Documentation](https://docs.webmaker.plus/)


## Contributing

Contributions are welcome!

* Fork the repository
* Submit a pull request
* Or open an issue for bug reports and feature requests

## License

This project is licensed under the [GNU General Public License, version 2 or later](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html).

See [Drupal's trademark policy](https://www.drupal.com/trademark) for guidance on logo and name usage.

