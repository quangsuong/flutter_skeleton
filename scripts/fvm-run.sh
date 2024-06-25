#!/bin/sh

# Load environment variables from the .env file
if [ -f .env ]; then
  export $(cat .env | xargs)
fi
