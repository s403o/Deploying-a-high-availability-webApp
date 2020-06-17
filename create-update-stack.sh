#!/bin/bash
# script to create, update and delete stacks in aws cloudformation.
# s403o

create_stack()
{
  echo "Create Stack"
  read -p "Enter Stack Name: " s_name
  read -p "Template file Name: " yml
  read -p "Json file Name: " json
  aws cloudformation create-stack \
  --stack-name $s_name \
  --template-body file://$yml \
  --parameters file://$json \
  --region=us-west-2 \
  --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM"
}
update_stack()
{
  echo "Update Stack"
  read -p "Enter Stack Name: " s_name1
  read -p "Template file Name: " yml1
  read -p "Json file Name: " json1
  aws cloudformation update-stack \
  --stack-name $s_name1 \
  --template-body file://$yml1 \
  --parameters file://$json1 \
  --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
  --region=us-west-2
}

delete_stack()
{
  read -p "Enter Stack Name you want to delete: " s_del
  aws cloudformation delete-stack \
  --stack-name $s_del
  echo "Stack Deleted!"
}

method()
{
  read -p "Enter your choice [create/update/delete]: " choice
  case $choice in
    create)
      create_stack
      ;;
    update)
      update_stack
      ;;
      delete)
      delete_stack
      ;;
    *)
      echo "Sorry, invalid input"
      method
      ;;
  esac
}
method



