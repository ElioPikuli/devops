#!/bin/bash
# "Execute shell" build step of the Jenkins job
set -e

git config --global --add safe.directory '*'

echo "----------------------------------------------"
echo "Welcome to the Braude DevOps Python CI Job!"
echo "----------------------------------------------"

echo "Installing Python..."
apt-get update
apt-get install -y python3
ln -sf /usr/bin/python3 /usr/bin/python

echo "Verifying Installation:"
python --version

echo "Running Unit Tests..."
export PYTHONPATH=$PYTHONPATH:.
python -m unittest discover tests
