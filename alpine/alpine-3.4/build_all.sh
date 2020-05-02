#!/bin/sh
for f in vars-alpine-3.4-*.json; do
  for g in alpine-3.4-[max]*.json; do
    packer build -var-file=$f $* $g
  done
done
packer build -var-file=vars-alpine-3.4-x86_64.json $* alpine-3.4-docker.json

for f in vars-alpine-virt-3.4-*.json; do
  for g in alpine-3.4-[max]*.json; do
    packer build -var-file=$f $* $g
  done
done
packer build -var-file=vars-alpine-virt-3.4-x86_64.json $* alpine-3.4-docker.json
