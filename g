#!/usr/bin/env bash

# Unset any existing alias named 'g'
unalias g 2>/dev/null

# g: Combine git add, commit, push, and status with confirmation
g() {
    echo "You can exit this command at any time by pressing 'x' and then Enter."

	# Check if the current directory is a git repository
	if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Error: This command must be run inside a Git repository."
        return 1
    fi

    # Loop until a valid commit message is provided
    while true; do
        echo -n "Enter commit message (or type 'x' to cancel): "
        read commit_message

        # Check if the commit message is empty or if the user wants to cancel
        if [ -z "$commit_message" ]; then
            echo "Error: Commit message cannot be empty."
        elif [[ "$commit_message" == "x" ]]; then
            echo "Operation cancelled. Exiting."
            return 0
        else
            break  # Valid commit message provided, exit the loop
        fi
    done

    # Show the commands to be executed
    echo "About to execute the following commands: "
    echo "git add ."
    echo "git commit -m \"$commit_message\""
    echo "git push"
    echo "git status"

	# Confirm with the user, accepting 'y', 'Y', or Enter as a valid confirmation
    while true; do
        echo -n "Do you want to proceed? (y/n): "
        read confirmation

        # If Enter is pressed (empty input), treat it as 'yes'
        if [ -z "$confirmation" ] || [[ "$confirmation" == "y" || "$confirmation" == "Y" ]]; then
            break  # Proceed if yes or Enter was pressed
        elif [[ "$confirmation" == "n" || "$confirmation" == "N" ]]; then
            echo "Operation cancelled. Exiting."
            return 0
        else
            echo "Invalid input. Please enter 'y' (yes) or 'n' (no)."
        fi
    done
	
    # If confirmed, proceed to execute the commands
    echo "Executing git add ..."
    git add .

    # Check if the add was successful
    if [ $? -ne 0 ]; then
        echo "Error: git add failed."
        return 1
    fi

    echo "Executing git commit ..."
    git commit -m "$commit_message"

    # Check if the commit was successful
    if [ $? -ne 0 ]; then
        echo "Error: git commit failed."
        return 1
    fi

    echo "Executing git push ..."
    git push

    # Check if the push was successful
    if [ $? -ne 0 ]; then
        echo "Error: git push failed."
        return 1
    fi

    echo "Executing git status ..."
    git status

    echo "All commands executed successfully."
    return 0
}
