# alb-https-redirect

Terraform module that provisions an Application Load Balancer (ALB) with an HTTP listener that redirects to HTTPS and an HTTPS listener with an ACM certificate. Optionally creates a target group and a Route53 alias record.

## Usage

```hcl
module "alb_https_redirect" {
  source = "./alb-https-redirect"

  name            = "example-alb"
  vpc_id          = "vpc-12345678"
  subnets         = ["subnet-12345678", "subnet-87654321"]
  certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/abc123"

  enable_target_group  = true
  target_group_port    = 80
  target_group_protocol = "HTTP"
  health_check_path    = "/"

  hosted_zone_id = "Z123456ABCDEFG"
  record_name    = "app.example.com"

  tags = {
    Environment = "prod"
    Service     = "web"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name for the ALB and related resources. | `string` | n/a | yes |
| vpc_id | VPC ID where the ALB and security group will be created. | `string` | n/a | yes |
| subnets | Subnet IDs to attach to the ALB. | `list(string)` | n/a | yes |
| certificate_arn | ACM certificate ARN for the HTTPS listener. | `string` | n/a | yes |
| enable_target_group | Whether to create and attach a target group to the HTTPS listener. | `bool` | `true` | no |
| target_group_port | Target group port. | `number` | `80` | no |
| target_group_protocol | Target group protocol. | `string` | `"HTTP"` | no |
| health_check_path | Health check path for the target group. | `string` | `"/"` | no |
| hosted_zone_id | Route53 hosted zone ID for an optional alias record. | `string` | `null` | no |
| record_name | Record name for the optional Route53 alias. | `string` | `null` | no |
| tags | Tags to apply to resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| alb_arn | ARN of the Application Load Balancer. |
| alb_dns_name | DNS name of the Application Load Balancer. |
| https_listener_arn | ARN of the HTTPS listener. |
| target_group_arn | ARN of the target group (null if disabled). |
