# Description

This cookbook install VMWare harbor [https://github.com/vmware/harbor]

It doesn't install docker engine required for this installation.

# Requirements

## Platform:

* debian
* ubuntu

## Cookbooks:

* docker

# Attributes

* `node['harbor']['foo']` -  Defaults to `bar`.

# Recipes

* harbor::default - Installs and configures VMWare Harbor

# License and Maintainer

Maintainer:: Yauhen Artsiukhou (<jsirex@gmail.com>)
Source:: https://github.com/jsirex/harbor-cookbook
Issues:: https://github.com/jsirex/harbor-cookbook/issues

License:: MIT
