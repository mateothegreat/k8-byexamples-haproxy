#                                 __                 __
#    __  ______  ____ ___  ____ _/ /____  ____  ____/ /
#   / / / / __ \/ __ `__ \/ __ `/ __/ _ \/ __ \/ __  /
#  / /_/ / /_/ / / / / / / /_/ / /_/  __/ /_/ / /_/ /
#  \__, /\____/_/ /_/ /_/\__,_/\__/\___/\____/\__,_/
# /____                     matthewdavis.io, holla!
#
include .make/Makefile.inc

NS          ?= default
APP         ?= haproxy-ingress
SECRET_NAME ?= tls-secret-haproxy-ingress

install: tls/generate

tls/generate:

	openssl req -x509 -newkey rsa:2048 -nodes -days 365 -keyout tls.key -out tls.crt -subj '/CN=localhost'

	kubectl delete secret $(SECRET_NAME) | true
	kubectl create secret tls $(SECRET_NAME) --cert=tls.crt --key=tls.key

test:

	nmap -P0 -p80,443 haproxy-ingress
	
	curl haproxy-ingress -H 'Host: foo.bar'
