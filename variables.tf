variable "env" {
  description = "Environment name"
}

variable "platform_config" {
  description = "Platform configuration"
  type        = map(string)
  default     = {}
}

variable "release" {
  type        = map(string)
  description = "Metadata about the release"
}

variable "image_id" {
  type        = string
  description = "Image id of docker release"
}

variable "common_application_environment" {
  description = "Environment parameters passed to the container for all environments"
  type        = map(string)
  default     = {}
}

variable "application_environment" {
  description = "Environment specific parameters passed to the container"
  type        = map(string)
  default     = {}
}

variable "secrets" {
  type        = map(string)
  description = "Secret credentials fetched using credstash"
  default     = {}
}

variable "dns_domain" {
  type        = string
  description = "The DNS domain - unused, pending deletion"
  default     = ""
}

variable "ecs_cluster" {
  type        = string
  description = "The ECS cluster"
  default     = "default"
}

variable "port" {
  type        = string
  description = "The port that container will be running on"
}

variable "cpu" {
  type        = string
  description = "CPU unit reservation for the container"
}

variable "memory" {
  type        = string
  description = "The memory reservation for the container in megabytes"
}

variable "alb_listener_arn" {
  type        = string
  description = "The Amazon Resource Name for the HTTPS listener on the load balancer"
}

variable "alb_listener_rule_priority" {
  type        = string
  description = "The priority for the rule - must be different per rule."
}

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running."
  type        = string
  default     = "3"
}

# optional
variable "path_conditions" {
  description = "Defines path-based conditions for routing; separate by, eg. '/home,/home/*'"
  type        = list(string)
  default     = ["*"]
}

variable "host_condition" {
  description = "Defines host-based condition for rule (domain name)"
  type        = string
  default     = "*.*"
}

variable "name_suffix" {
  description = "Set a suffix that will be applied to the name in order that a component can have multiple services per environment"
  type        = string
  default     = ""
}

variable "task_role_policy" {
  description = "IAM policy document to apply to the tasks via a task role"
  type        = string
  default     = <<END
{
  "Version": "2012-10-17",
  "Statement": []
}
END

}
variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds."
  type        = string
  default     = "5"
}

variable "health_check_path" {
  description = "The destination for the health check request."
  type        = string
  default     = "/internal/healthcheck"
}

variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check."
  type        = string
  default     = "4"
}

variable "health_check_healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy."
  type        = string
  default     = "2"
}

variable "health_check_unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy."
  type        = string
  default     = "2"
}

variable "health_check_matcher" {
  description = "The HTTP codes to use when checking for a successful response from a target. You can specify multiple values (for example, \"200,202\") or a range of values (for example, \"200-299\")."
  type        = string
  default     = "200-299"
}

