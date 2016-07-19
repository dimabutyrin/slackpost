#!/bin/bash
# Usage: ./slackpost.sh <webhook URL> <channel> <message>

url=$1
channel=$2
# shift two parameters left to catch the rest to $text
shift 2
text=$*

if [[ $text == "" ]]
then
        echo "No text specified"
        echo "Usage: ./slackpost.sh <webhook URL> <channel> <message>"
        exit 1
fi

escapedText=$(echo $text | sed 's/"/\"/g' | sed "s/'/\'/g" )
json="{\"channel\": \"#$channel\", \"text\": \"$escapedText\", \"link_names\":1}"

curl -s -d "payload=$json" "$url"
