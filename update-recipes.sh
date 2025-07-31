#!/bin/bash

ddev drush php:eval "
\$config = \Drupal::configFactory()->getEditable('project_browser.admin_settings');
\$config->set('allowed_projects.recipes', [
  'drupal_cms_accessibility_tools',
  'drupal_cms_ai',
  'drupal_cms_blog',
  'drupal_cms_case_study',
  'drupal_cms_events',
  'drupal_cms_fonts',
  'drupal_cms_google_analytics',
  'drupal_cms_news',
  'drupal_cms_person',
  'drupal_cms_project',
  'drupal_cms_search',
  'drupal_cms_seo_tools',
  'extra_ux',
  'extra_content',
  'extra_service',
  'extra_service_views'
]);
\$config->save();
"
ddev drush config:get project_browser.admin_settings allowed_projects.recipes