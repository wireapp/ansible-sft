SFT - Selective Forwarding TURN
===============================

### Prerequisites

* Ubuntu 18.04

### Terminology

__Server:__ an instance hosting the SFT service as well as a local proxy in front of it.

__Load balancer:__ a different instance from *servers*, that distributes new incoming conference calls across
*servers* during the *signaling* procedure.

### About this repository

THe structure of this repository structured towards a new Ansible feature called `collection`. However, the content
only supports Ansible __2.7__ (for now). To already allow structural elements like `./roles`, some
[workarounds](https://github.com/ansible/ansible/issues/16804) have been applied.
When we will start to support 2.9, the main TODO is to fully adapt the official structure mentioned in the docs:

* [usage](https://docs.ansible.com/ansible/2.9/user_guide/collections_using.html)
* [development](https://docs.ansible.com/ansible/2.9/dev_guide/developing_collections.html)
