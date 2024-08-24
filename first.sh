#!/bin/bash

TODO_FILE="todo.exe"

view_tasks() {
    if [[ ! -s $TODO_FILE ]]; then
        echo "No tasks found."
    else
        cat -n $TODO_FILE
    fi
}

add_task() {
    echo "$1" >> $TODO_FILE
    echo "Task added."
}

# Function to delete a task
delete_task() {
    task_num=$1
    if [[ -z $task_num ]]; then
        echo "Please specify a task number to delete."
    else
        sed -i "${task_num}d" $TODO_FILE
        echo "Task $task_num deleted."
    fi
}

while true; do
    echo "To-Do List:"
    view_tasks
    echo ""
    echo "Options: [0] Add task [1] Delete task [99] Exit"
    read -p "Choose an option: " choice

    case $choice in
        0)
            read -p "Enter the task: " task
            add_task "$task"
            ;;
        1)
            read -p "Enter task number to delete: " task_num
            delete_task $task_num
            ;;
        99)
            echo "bye bye!"
            break
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac
    echo ""
done
