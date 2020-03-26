# WP Core Test Framework

[![License: MIT](https://img.shields.io/github/license/assertwell/wp-core-test-framework)](LICENSE.md)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md) 

This package helps reduce duplication across WordPress plugins and themes by enabling common test scaffolding to be provided [via Composer](https://getcomposer.org/).

## Installation

To install the WordPress core test framework into your plugin or theme, install this package as a Composer dependency:

```sh
$ composer require --dev assertwell/wp-core-test-framework
```

## Usage

### Replacing the default `bin/install-wp-tests.sh` file

When [scaffolding a new WordPress plugin or theme via WP-CLI](https://developer.wordpress.org/cli/commands/scaffold/), the generator will [create a shell script at `bin/install-wp-tests.sh`](https://github.com/wp-cli/scaffold-command/blob/master/templates/install-wp-tests.sh).

This file is meant to [create an instance of the WordPress core development repository](https://make.wordpress.org/core/handbook/testing/automated-testing/phpunit/), which includes the WordPress core testing framework.

In many cases, this shell script is never modified, and is often the only file present in the `bin/` directory. Rather than copying and pasting this file across a bunch of repositories, `install-wp-tests.sh` is provided as a vendor binary by this package.

To use it, find anywhere you're currently (or would be) referencing `bin/install-wp-tests.sh` and replace it with `vendor/bin/install-wp-tests.sh`.

```diff
# .travis.yml

  install:
      - composer install --prefer-dist --no-interaction
-     - bash bin/install-wp-tests.sh wordpress_test root '' localhost $WP_VERSION
+     - bash vendor/bin/install-wp-tests.sh wordpress_test root '' localhost $WP_VERSION
```

If your project already contains a `bin/install-wp-tests.sh` file, you may delete it from your repository.
