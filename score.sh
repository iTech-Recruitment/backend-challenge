#!/bin/bash

# prep the env
sudo apt update > /dev/null 2>&1 &
sudo apt install -y php7.0-curl 2>&1 &
composer install > /dev/null 2>&1 &

API_URL="http://18.130.116.85/recipes"
LOCAL_URL="http://127.0.0.1:8080"
SCORE=0

# running php built-in server in the background
php -S 127.0.0.1:8080 > /dev/null 2>&1 &

# default call
EXPECTED_VALUE=$(curl -X POST $API_URL 2>/dev/null | tr -d [:space:])
ACTUAL_VALUE=$(curl -X POST $LOCAL_URL 2>/dev/null | tr -d [:space:])

if [ "$EXPECTED_VALUE" == "$ACTUAL_VALUE" ]
then
  SCORE=$((SCORE+20))
fi
# single item
EXPECTED_VALUE=$(curl -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "offset=300&limit=1" $API_URL 2>/dev/null | tr -d [:space:])
ACTUAL_VALUE=$(curl -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "offset=300&limit=1" $LOCAL_URL 2>/dev/null | tr -d [:space:])

if [ "$EXPECTED_VALUE" == "$ACTUAL_VALUE" ]
then
  SCORE=$((SCORE+10))
fi

# 2 items from a random offset
OFFSET=$((1 + RANDOM % 300))
EXPECTED_VALUE=$(curl -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "offset=${OFFSET}&limit=1" $API_URL 2>/dev/null | tr -d [:space:])
ACTUAL_VALUE=$(curl -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "offset=${OFFSET}&limit=1" $LOCAL_URL 2>/dev/null | tr -d [:space:])

if [ "$EXPECTED_VALUE" == "$ACTUAL_VALUE" ]
then
  SCORE=$((SCORE+10))
fi

# going over dataset
EXPECTED_VALUE=$(curl -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "offset=5000&limit=1" $API_URL 2>/dev/null | tr -d [:space:])
ACTUAL_VALUE=$(curl -H "Content-Type: application/x-www-form-urlencoded" -X POST -d "offset=5000&limit=1" $LOCAL_URL 2>/dev/null | tr -d [:space:])

if [ "$EXPECTED_VALUE" == "$ACTUAL_VALUE" ]
then
  SCORE=$((SCORE+10))
fi

echo "Half of the score comes from an automatic test that compares the output of the challenge with the benchmark API."
echo "The other half of the score will come from manual evaluation be a reviewer based on the next step live coding session."
echo "FS_SCORE:${SCORE}%"
