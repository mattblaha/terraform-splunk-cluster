variable "external_cidr" {
  type    = string
  default = "127.0.0.1/32"
}

variable "search_heads" {
  type    = number
  default = 2
}

variable "indexers" {
  type    = number
  default = 2
}
