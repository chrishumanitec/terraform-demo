variable "name" {
  type    = string
  default = ""
}

variable "attributes" {
  type = map(any)
}

variable "primaryKey" {
  type = map(any)
}

variable "globalSecondaryIndexes" {
  type    = map(any)
  default = {}
}

variable "localSecondaryIndexes" {
  type    = map(any)
  default = {}
}

variable "region" {
  type = string
}

variable "table_prefix" {
  type    = string
  default = ""
}

variable "billing_mode" {
  type    = string
  default = "PROVISIONED"
}

variable "read_capacity" {
  type    = number
  default = 20
}

variable "write_capacity" {
  type    = number
  default = 20
}