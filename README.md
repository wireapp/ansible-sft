SFT - Selective Forwarding TURN
===============================

### Prerequisites

* Ubuntu 18.04

### About this repository

THe structure of this repository structured towards a new Ansible feature called `collection`. However, the content
only supports Ansible __2.7__ (for now). To already allow structural elements like `./roles`, some
[workarounds](https://github.com/ansible/ansible/issues/16804) have been applied.
When we will start to support 2.9, the main TODO is to fully adapt the official structure mentioned in the docs:

* [usage](https://docs.ansible.com/ansible/2.9/user_guide/collections_using.html)
* [development](https://docs.ansible.com/ansible/2.9/dev_guide/developing_collections.html)


### Development setup

* Install [poetry](https://python-poetry.org/docs/)
* run `poetry install` anywhere inside the git checkout folder to install the current dependencies.
* (`poetry update` can be used to re-generate the .lock file after making changes to dependencies)

### Test this role using molecule

Ensure you have hetzner cloud credentials:

```
env | grep HCLOUD_TOKEN > /dev/null || echo "[ERROR] Missing HCLOUD_TOKEN" && exit 1
```

At the moment, you also need AWS credentials in order to create DNS records. FUTUREWORK: remove dependency on AWS credentials.

To start with, create a random number for your server (to avoid name clashes), and cd to the right directory:

```
export INSTANCE_UUID=$RANDOM
cd roles/sft-server
```

create a server

```
poetry run molecule create
```

apply the playbook from molecule/default/create.yml (run as often as you want)

```
poetry run molecule converge
```

destroy the server (and apply the molecule/default/destroy.yml playbook)

```
poetry run molecule destroy
```

all of the above (create, converge, destroy)

```
poetry run molecule destroy
```
