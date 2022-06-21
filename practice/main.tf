resource "local_file" "pets" {
  filename = var.fileName
  content  = "Generated pet name is ${random_pet.my-pet.id}"
}

resource "random_pet" "my-pet" {
  prefix    = var.prefix[0]
  separator = "."
  length    = 2
}

// variable use, depedency and lifecycle
resource "local_file" "map-file-content" {
  filename = "map-file.txt"
  content  = var.file-content["statement1"]

  depends_on = [
    random_pet.my-pet
  ]

  lifecycle {
    create_before_destroy = false // this will create resource first then destroy old one
    prevent_destroy       = false // this will not destroy old resource

    ignore_changes = [
      // this contains list of attibutes for which changes should be ignored
      content, filename
    ]
  }

}

// data source
resource "local_file" "external-data-source" {
  filename = "externalDataSource.txt"
  content  = data.local_file.dog.content

}

data "local_file" "dog" {
  filename = "dog.txt"

}

output "pet-name" {
  value       = random_pet.my-pet
  description = "This is optional paramater to desctibe what is this op variable use for"
}

// count demo
resource "local_file" "count-demo" {
  filename = var.cloud-providers[count.index]
  count    = length(var.cloud-providers)
  content  = "test"

}

// for-each demo
resource "local_file" "foreach-demo" {
  filename = each.value
  for_each = toset(var.cloud-providers)
  content  = "test"

}


