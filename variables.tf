variable "organization" {
  type        = string
  description = "Organization's name."
}

variable "name" {
  type        = string
  description = "Database's name."
}

variable "writer_arn" {
  type        = string
  description = "Writer's ARN."
}

variable "reader_arn" {
  type        = string
  description = "Reader's ARN."
}
