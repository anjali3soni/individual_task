#!/bin/bash

# Parameters from Jenkins
TASK=$1
PARAM1=$2
PARAM2=$3
PARAM3=$4
PARAM4=$5


case $TASK in
    "Create a user")
        echo "Creating user: $PARAM1"
        ansible-playbook -i ./inventory ./adduser.yml -e "username=$PARAM1"
        ;;
    "Delete a user")
        echo "Deleting user: $PARAM1"
        ansible-playbook -i ./inventory ./del-user.yml -e "username_del=$PARAM1"
        ;;
    "Add to group")
        echo "Adding to group with username: $PARAM1 and groupname: $PARAM2"
        ansible-playbook -i ./inventory ./grp-upd.yml -e "username=$PARAM1 groupname=$PARAM2"
        ;;
    "Install packages")
        echo "Installing packages: $PARAM1"
        ansible-playbook -i ./inventory ./install.yml -e "packages=$PARAM1"
        ;;
    "Run Docker container")
        echo "Running Docker container with name: $PARAM1, image: $PARAM2, host port: $PARAM3, container port: $PARAM4"
        ansible-playbook -i ./inventory ./doc-con.yml -e "container_name=$PARAM1 image_name=$PARAM2 host_port=$PARAM3 container_port=$PARAM4"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac
