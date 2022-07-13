#!/bin/bash

set -e

cd '/Users/raelyn/Library/Application Support/barrier/SSL'
openssl req -x509 -nodes -days 365 -subj /CN=Barrier -newkey rsa:4096 -keyout Barrier.pem -out Barrier.pem
