variable "fileName" {
  default = "pet.txt"
}

// string
variable "content" {
  default = "This is test file, modified value using variable"
}

//list
variable "prefix" {
  default = ["Mr", "Mrs", "Sir"]
  type    = list(string)
}

// map
variable "file-content" {
  type = map(string)
  default = {
    "statement1" = "This is statement 1"
    "statement2" = "This is statement 2"
  }
}

// set - no duplications
variable "fruits" {
  type    = set(string)
  default = ["apple", "banana"]
}

// object
variable "student" {
  type = object({
    name     = string
    rollNo   = string
    grade    = number
    present  = boolean
    subjects = list(string)
  })

  default = {
    grade    = 6
    name     = "Jatin"
    present  = false
    rollNo   = "003MR"
    subjects = ["maths", "english", "science"]
  }
}

// tuples
variable "kitty" {
  type    = tuple([string, number, boolean])
  default = ["cat", 1, false]
}
