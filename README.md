# terraform_data_source_modules

> Modules to lookup AWS or extant resources

## Notes
I find these lookup modules particularly useful in brownfield projects, where
one might need to grab existing resource ids to manage.


#### Extant resource lookup modules:
* vpc_lookup
* instance_lookup

#### AWS lookup modules:
* ami_lookup
* ami_ubuntu_xenial
* ami_amazon_linux

### Examples:
* vpc
* instance
* ami



```sh
vpc_lookup

lookup VPC, public & private subnet ids
* provide 'Name' tags of each

* inputs:
  * vpc_name_tag
  * public_subnet_name_tag
  * private_subnet_name_tag
* outputs:
  * vpc_id: string
  * private_subnet_ids: list
  * public_subnet_ids: list

Example usage:

  module "vpc_data" {
     source  = "../../../modules/data_sources/vpc"
     vpc_name_tag = "${var.application}-${var.environment}"
     private_subnet_name_tag = "${var.application}-${var.environment}-private-*"
     public_subnet_name_tag = "${var.application}-${var.environment}-public-*"
  }

 locals
    vpc_id = "${module.vpc_data.vpc_id}"
    private_subnet_id = "${module.vpc_data.private_subnet_ids[0]}"
    public_subnet_id = "${module.vpc_data.public_subnet_ids[0]}"
 }
```

## [License](LICENSE.md)
