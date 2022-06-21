resource "local_file" "pets" {
  filename = var.fileName
  content  = "Generated pet name is ${random_pet.my-pet.id}"
}

resource "random_pet" "my-pet" {
  prefix    = var.prefix[0]
  separator = "."
  length    = 2
}

resource "local_file" "map-file-content" {
  filename = "map-file.txt"
  content  = var.file-content["statement1"]

  depends_on = [
    random_pet.my-pet
  ]
}

output "pet-name" {
  value       = random_pet.my-pet
  description = "This is optional paramater to desctibe what is this op variable use for"
}
