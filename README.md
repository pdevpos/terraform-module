# terraform-module

* create infrastructure by using terraform
* to pass values dynamically "use different types of variables" if required
1. ".tf"
2. ".tfvars"
3. "command line prompt"
4. export
*  a "data source" allows you to fetch information from external resources or other Terraform configurations, instead of giving static values
*  to reuse the code and avoid duplicates use "modules"
* modules are nothing but functions in terraform
* to call the resource from one directory to another directory "modules" use the below syntax
module "module-name"{
source = "./path from where to get source code"
* }

*depends_on:
============
* earlier three modules can run at a time , parallel all modules start to execute so here some credentials will not able to get in a proper order.
* so which module can execute first and then execute other modules.
* we can use depends_on argument. depends_on argument to create explicit dependencies between resources and modules in Terraform. 