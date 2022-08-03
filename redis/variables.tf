variable "region" {
  description = "The region the EC2 instance should be created in."
  type        = string
}

variable "credentials" {
  description = "The credentials for connecting to AWS."
  type = object({
    access_key = string
    secret_key = string
  })
  sensitive = true
}


variable "cluster_id" {
  description = "Id to assign the new cluster"
}

variable "subnet_id" {
  description = "Subnet to create the redis cluster in"
}