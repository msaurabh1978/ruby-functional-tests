ConfigReposSshSupport
======================
tags: git_ssh_support

Setup of contexts
* Smoke Configuration - setup
* Login as "admin" - setup
* Capture go state "ConfigReposSshSupport" - setup

CreateConfigRepoWithSshFields
------------------------------
* Go to config repos page
* Perform add config repo action
* Set config repo id as "git_config_repo_with_ssh_support"
* Set config repo url as "https://dummygithub.com/gocd/ruby-functional-tests.git"
* Set config repo ssh_private_key as "AES-128-CBC,449C539637D2"
* Save config repo
* Verify success flash message "The config repository git_config_repo_with_ssh_support was created successfully!"
* Verify ssh private key "**********" and passphrase "(Not specified)" are present on config repos page

* Go to config repos page
* Edit config repo "git_config_repo_with_ssh_support"
* Set config repo ssh_private_key while edit as "AES-128-CBC,449C539637D2D6237246268210C539EE"
* Set config repo ssh_passphrase while edit as "admin123"
* Save config repo
* Verify success flash message "The config repository git_config_repo_with_ssh_support was updated successfully!"

Teardown of contexts
_____________________
* Capture go state "ConfigReposSshSupport" - teardown
