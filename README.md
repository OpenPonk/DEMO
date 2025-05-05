# OpenPonk: DEMO

[![Nightly](https://github.com/OpenPonk/DEMO/actions/workflows/nightly.yml/badge.svg)](https://github.com/OpenPonk/DEMO/actions/workflows/nightly.yml) 

This is an extension of [OpenPonk tool](https://openponk.org) that adds DEMO diagrams. 

## Installation

Requires Pharo 12 image - clean or with loaded OpenPonk.

In Playground, execute following script:
```
Metacello new
    baseline: 'OpenPonkDEMO';
    repository: 'github://OpenPonk/DEMO/repository';
    load
```
