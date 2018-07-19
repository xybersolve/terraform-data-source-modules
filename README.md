# terraform_data_source_modules

> Custom Terraform Modules to lookup AWS or extant resources

## Notes
I find these lookup modules particularly useful, when one needs to grab existing
resource ids or dynamically pull AMI Ids.

#### Extant resource lookup modules:
* vpc_lookup: given VPC Name tag, returns VPC and Subnet Ids
* instance_lookup: given Instance Name tag, returns Instance Id

#### AMI lookup modules:
* ami_lookup: Given AMI and Owner Name, return AMI Id.
* ami_ubuntu_xenial: Returns AMI Id for latest Ubuntu Xenial.
* ami_amazon_linux: Return AMI Id for latest Amazon Linux AMI.

### Syntax & Examples:
#### VPC Lookup (vpc_lookup)
lookup VPC, public & private subnet ids (wildcards ok)

* inputs:
  * vpc_name_tag
  * public_subnet_name_tag
  * private_subnet_name_tag

* outputs:
  * vpc_id: string
  * private_subnet_ids: list
  * public_subnet_ids: list

```sh

module "vpc_data" {
  source = "git::git@github.com:xybersolve/terraform-data-source-modules.git//vpc-lookup"
  vpc_name_tag            = "${var.application}-${var.environment}"
  private_subnet_name_tag = "${var.application}-${var.environment}-private-*"
  public_subnet_name_tag  = "${var.application}-${var.environment}-public-*"
}

# assign return ids into local variables
locals {
  vpc_id              = "${module.vpc_data.vpc_id}"
  private_subnet_id   = "${module.vpc_data.private_subnet_ids[0]}"
  public_subnet_id    = "${module.vpc_data.public_subnet_ids[0]}"
}
```

#### Instance Lookup (instance_lookup)
Lookup Instance, public & private subnet ids (use wildcards)

* inputs:
  * instance_name_tag (wildcards ok)

* outputs:
  * id: string
  * ami: string
  * public_ip: string
  * private_ip: string
  * availability_zone: string
  * subnet_id: string
  * security_groups: list
  * vpc_security_group_ids: list
  * key_name: string
  * tags: list

```sh
# lookup 'bastion' server instance
module "bastion" {
  source = "git::git@github.com:xybersolve/terraform-data-source-modules.git//instance-lookup"
  instance_name_tag = "${var.application}-${var.environment}-bastion"
}

# assign return outputs for 'bastion' into local variables
locals {
  bastion_id          = "${module.bastion.id}"
  bastion_ami_id      = "${module.bastion.ami}"
  bastion_public_ip   = "${module.bastion.public_ip}"
  bastion_private_ip  = "${module.bastion.private_ip}"
  bastion_az          = "${module.bastion.availability_zone}"
  bastion_subnet_id   = "${module.bastion.subnet_id}"
  bastion_sgs         = "${module.bastion.security_groups}"
  bastion_vpc_sgs     = "${module.bastion.vpc_security_group_ids}"
  bastion_key_name    = "${module.bastion.key_name}"
  bastion_tags        = "${module.bastion.tags}"
}

```

#### AMI Lookups
'amazon_ami' & 'ubuntu_ami'

* input: none
* output: ami_id

```sh
# ubuntu_ami & amazon_ami, used together

# get the latest Amazon Linux AMI Id
module "xenial_ami" {
  source = "git::git@github.com:xybersolve/terraform-data-source-modules.git//ami-ubuntu-xenial"
}

module "amazon_ami" {
  source = "git::git@github.com:xybersolve/terraform-data-source-modules.git//ami-amazon-linux"
}


# assign each AMI Id to a local variable
locals {
  ubuntu_ami_id = "${module.xenial_ami.ami_id}"
  amazon_ami_id = "${module.amazon_ami.ami_id}"
}

```

'ami-lookup'

* inputs (wilcards ok)
  * ami_name
  * ami_owner

* output
  * ami_id



## [License](LICENSE.md)
