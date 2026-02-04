output "name" {
  value       = module.database.name
  description = "The S3 Bucket domain name."
}

output "bucket_arn" {
  value       = module.database.arn
  description = "The S3 Bucket ARN."
}

