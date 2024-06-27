# CompleteCD
This repository is the place where I put together a complete CD pipeline (CI later on as well if I can manage)

The plan is as follows

1) use terraform and github action to provision and configure the infrastructure completely
   - this should also include installing the necessary packages that the application need to run
  
2) based on the previous node JS app I have deployed as practice, deploy this application automatically and allow a true end to end CD pipeline

This readme will also contain the steps that I used to set up a fresh repo to do such thing.

as all projects are built on top of previous work we are going to use the HashiCorp demo as we learn the best practice
https://developer.hashicorp.com/terraform/tutorials/automation/github-actions

in short - creating a pull request will perform terraform plan, where merging to main will a terraform apply

but I am going to change it to trigger it with labels

copied across the gitigore file, tfplan and apply yml files, then made changes so those trigger only on labels of PR of "TFplan" and "TFapply"






