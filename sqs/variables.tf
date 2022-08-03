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

variable "queue_name" {
  description = "Name of the queue"
  type        = string
}

variable "source_tag" {
  description = "The value of the \"source\" tag added to the cluster"
  type        = string
}
