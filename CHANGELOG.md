# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Redis hardening (password, rename-command) and removed as included in geerlingguy.redis
- Allow remote mysql server
- Systemd service hardening
- Packer configuration
- Partial Azure mysql testing
- Gitignore

### Changed
- Heavy lint following galaxy new rules following adoption of ansible-lint
https://groups.google.com/forum/#!topic/ansible-project/ehrb6AEptzA
https://docs.ansible.com/ansible-lint/rules/default_rules.html
https://github.com/ansible/ansible-lint
- Galaxy dependency naming evolution (juju4.redhat_epel)
- update upstream binary url to github releases
- Travis: force test-kitchen 0.1.25 to keep compatibility with kitchen-lxd_cli
- Travis: dist from trusty to xenial + lxd3
https://blog.travis-ci.com/2018-11-08-xenial-release
- Github: rename tags to match semantic versioning: 0.8.0
- Update default fleet to 2.0.2

### Removed
- Remove license-checker

## [v0.8] - 2018-06-02

### Added
- Ubuntu 18.04 support
- Jenkinsfile
- Initial commit on Github, include simple travis, kitchen and vagrant tests

### Changed
- fix mysql temporary password at install (mysql 5.7+)
