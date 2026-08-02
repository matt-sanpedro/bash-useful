#!/bin/bash

# List your repository paths here
CONFIG_FILE=".git_config.txt"

# Read the file line by line
while IFS= read -r line || [ -n "$line" ]; do
    echo "----------------------------------------"

    # Skip empty lines
    [ -z "$line" ] && continue
    
    # Skip lines that start with a comment (#)
    [[ "$line" =~ ^# ]] && continue
    
    # Print the configuration line
    echo "Checking: $line"
    if [ -d "$line/.git" ]; then
        cd "$line" || continue
        echo "Updating..."
        git pull
    else
        echo "Error: Not a valid git repository."
    fi

done < "$CONFIG_FILE"

echo "----------------------------------------"
echo "Done!"
