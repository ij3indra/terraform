resource "local_file" "pets" {
  filename = var.fileName
  content  = var.content
}

resource "random_pet" "my-pet" {
  prefix    = var.prefix[0]
  separator = "."
  length    = 2
}

resource "local_file" "map-file-content" {
  filename = "map-file.txt"
  content  = var.file-content["statement1"]
}
 
