resource "random_id" "server" {
  byte_length = 8
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.table_prefix}${random_id.server.hex}"
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.primaryKey.partition
  range_key      = try(var.primaryKey.sort, null)

  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.key
      type = attribute.value
    }
  }

  dynamic "global_secondary_index" {
    for_each = var.globalSecondaryIndexes
    content {
      name               = global_secondary_index.key
      hash_key           = global_secondary_index.value.key.partition
      range_key          = try(global_secondary_index.value.key.sort, null)
      write_capacity     = var.write_capacity
      read_capacity      = var.read_capacity
      projection_type    = global_secondary_index.value.projection.type
      non_key_attributes = try(global_secondary_index.value.projection.nonKeyAttributes, null)
    }
  }

  dynamic "local_secondary_index" {
    for_each = var.localSecondaryIndexes
    content {
      name               = local_secondary_index.key
      range_key          = try(local_secondary_index.value.key.sort, null)
      projection_type    = local_secondary_index.value.projection.type
      non_key_attributes = try(local_secondary_index.value.projection.nonKeyAttributes, null)
    }
  }

}

        