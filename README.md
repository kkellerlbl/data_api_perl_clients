[![Join the chat at https://gitter.im/kbase/data_api](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/kbase/data_api?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

<img src="GolgiVolvox.png" alt="Volvox" style="width: 100px;"/>

# data_api

Towards a unified data api for KBase

This repository is configured to use TravisCI

Source code is under lib/ (Python)

Develop branch status for data_api_perl_clients: coming soon

Master branch status for data_api core
[![Build Status](https://travis-ci.org/kbase/data_api.svg?branch=master)](https://travis-ci.org/kbase/data_api)
[![Coverage Status](http://codecov.io/github/kbase/data_api/coverage.svg?branch=master)](http://codecov.io/github/kbase/data_api?branch=master)
![Coverage Graph](http://codecov.io/github/kbase/data_api/branch.svg?branch=master&time=1y)

Develop branch status for data_api core
[![Build Status](https://travis-ci.org/kbase/data_api.svg?branch=develop)](https://travis-ci.org/kbase/data_api)
[![Coverage Status](http://codecov.io/github/kbase/data_api/coverage.svg?branch=develop)](http://codecov.io/github/kbase/data_api?branch=master)
![Coverage Graph](http://codecov.io/github/kbase/data_api/branch.svg?branch=develop&time=1y)

##### Table of Contents
- [Quickstart install instructions](#quickstart-instructions-for-installation)
- [Documentation](#documentation)
- [Examples](#examples)
- [Information for developers modifying Data API](#for-developers)


#Quickstart instructions for installation

See https://github.com/kbase/data_api .  Client install instructions coming soon.

# Documentation

[API docs](http://kbase.github.io/docs-ghpages/docs/data_api/index.html)

# Examples
    
# For developers

## Versioning and Changelog

Use semantic versioning, "x.y.z", where x is major, or incompatible, differences, y is new but backwards-compatible, and z is minor changes and bugfixes.

Keep the version current in the file `VERSION` at the root level.

Record changes in a human-readable format in the `CHANGELOG` at the root level. Each version should:

- List its release date in the above format.
- Group changes to describe their impact on the project, as follows:
    * Added for new features.
    * Changed for changes in existing functionality.
    * Deprecated for once-stable features removed in upcoming releases.
    * Removed for deprecated features removed in this release.
    * Fixed for any bug fixes.
    * Security to invite users to upgrade in case of vulnerabilities.
- Changes not yet released should be put in the "Unreleased" section at the top. This serves as a sort of preview of upcoming changes.

