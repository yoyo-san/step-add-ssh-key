# Step add-ssh-key

Wercker allows you to generate SSH keys and expose them as via
environment variables to your build or deployment pipeline.
This step can be used to write these values to an EdentityFile
and add them to the SSH configuration.

# Options

* `KEYNAME`: The name of the key variable to export, this is without the `_PUBLIC` or `_PRIVATE` suffix.

# Example

``` yaml
add-ssh-key:
  keyname: MYPACKAGE_KEY
```

# What's new

Also add the ssh-key for root.
 
# History

* 0.0.2 - add ssh-key for root

* 0.0.1 - Initial version

# License

The MIT License (MIT)

Copyright (c) 2013 wercker
