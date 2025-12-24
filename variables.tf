variable "name" {
  description = "Name for the ALB and related resources."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB and security group will be created."
  type        = string
}

variable "subnets" {
  description = "Subnet IDs to attach to the ALB."
  type        = list(string)
}

variable "certificate_arn" {
  description = "ACM certificate ARN for the HTTPS listener."
  type        = string
}

variable "enable_target_group" {
  description = "Whether to create and attach a target group to the HTTPS listener."
  type        = bool
  default     = true
}

variable "target_group_port" {
  description = "Target group port."
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Target group protocol."
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Health check path for the target group."
  type        = string
  default     = "/"
}

variable "hosted_zone_id" {
  description = "Route53 hosted zone ID for an optional alias record."
  type        = string
  default     = null
}

variable "record_name" {
  description = "Record name for the optional Route53 alias."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}
