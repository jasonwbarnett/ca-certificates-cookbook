ca-certificates Cookbook
========================

This cookbook installs ca-certificates.

Requirements
------------

#### OS
Must be running a RHEL distro.

Attributes
----------
### package

This is the name of the package to be installed by the package manager.

### ca-bundle_path

This is the location of the actual ca-bundle.crt that is installed by the package manager.

Usage
-----
#### ca-certificates::default
Just include `ca-certificates` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ca-certificates]"
  ]
}
```

License and Authors
-------------------
Authors: Jason Barnett (<J@sonBarnett.com>)
