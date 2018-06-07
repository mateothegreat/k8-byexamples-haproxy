<!--
#                                 __                 __
#    __  ______  ____ ___  ____ _/ /____  ____  ____/ /
#   / / / / __ \/ __ `__ \/ __ `/ __/ _ \/ __ \/ __  /
#  / /_/ / /_/ / / / / / / /_/ / /_/  __/ /_/ / /_/ /
#  \__, /\____/_/ /_/ /_/\__,_/\__/\___/\____/\__,_/
# /____                     matthewdavis.io, holla!
#
#-->

[![Clickity click](https://img.shields.io/badge/k8s%20by%20example%20yo-limit%20time-ff69b4.svg?style=flat-square)](https://k8.matthewdavis.io)
[![Twitter Follow](https://img.shields.io/twitter/follow/yomateod.svg?label=Follow&style=flat-square)](https://twitter.com/yomateod) [![Skype Contact](https://img.shields.io/badge/skype%20id-appsoa-blue.svg?style=flat-square)](skype:appsoa?chat)

## Getting Started

First we need to pull in the .make (helper) library:

```sh
git submodule update --init
```
Now you can simply run a `make install` which will deploy the resources from the manifests/ directory.

To revert you can run `make delete`.

## Usage

```sh

                                __                 __
   __  ______  ____ ___  ____ _/ /____  ____  ____/ /
  / / / / __ \/ __  __ \/ __  / __/ _ \/ __ \/ __  /
 / /_/ / /_/ / / / / / / /_/ / /_/  __/ /_/ / /_/ /
 \__, /\____/_/ /_/ /_/\__,_/\__/\___/\____/\__,_/
/____
                        yomateo.io, it ain't easy.

Usage: make <target(s)>

Targets:

  git/update           Update submodule(s) to HEAD from origin
  install              Installs manifests to kubernetes using kubectl apply (make manifests to see what will be installed)
  delete               Deletes manifests to kubernetes using kubectl delete (make manifests to see what will be installed)
  get                  Retrieves manifests to kubernetes using kubectl get (make manifests to see what will be installed)
  describe             Describes manifests to kubernetes using kubectl describe (make manifests to see what will be installed)
  context              Globally set the current-context (default namespace)
  shell                Grab a shell in a running container
  dump/logs            Find first pod and follow log output
  dump/manifests       Output manifests detected (used with make install, delete, get, describe, etc)

```

## Testing

```sh
$ make test

nmap -P0 -p80,443 haproxy-ingress

Starting Nmap 7.01 ( https://nmap.org ) at 2018-02-18 01:22 STD

Nmap scan report for haproxy-ingress (10.31.243.235)

Host is up (0.059s latency).
rDNS record for 10.31.243.235: haproxy-ingress.default.svc.cluster.local
PORT    STATE SERVICE
80/tcp  open  http
443/tcp open  https

Nmap done: 1 IP address (1 host up) scanned in 0.53 seconds

curl haproxy-ingress -H 'Host: foo.bar'

CLIENT VALUES:
client_address=10.28.2.38
command=GET
real path=/
query=nil
request_version=1.1
request_uri=http://foo.bar:8080/

SERVER VALUES:
server_version=nginx: 1.10.0 - lua: 10001

HEADERS RECEIVED:
accept=*/*
host=foo.bar
user-agent=curl/7.47.0
x-forwarded-for=10.28.1.126
BODY:
-no body in request-y

```

## See also

* https://github.com/jcmoraisjr/haproxy-ingress
* https://www.haproxy.com/blog/haproxy_ingress_controller_for_kubernetes/
