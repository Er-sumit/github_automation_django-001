terraform {
  cloud {
    organization = "own-space"

    workspaces {
      name = "Django-gh-actions-test"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "network" {
  source = "terraform-aws-modules/vpc/aws"

  name = "dev-vpc"
  cidr = var.vpc_cidr

  azs            = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]


  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev1"
  }
}

resource "aws_ecs_cluster" "github_cicd_cluster" {
  name = "github-cicd-cluster"

  tags = {
    Name = "github-cicd-cluster"
  }
}

# resource "aws_iam_role" "instance" {
#   name               = "instance_role"
#   path               = "/system/"
#   assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
# }


resource "aws_iam_role" "deployment_service_role1" {
  name               = "deployment_service_role1"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.deployment-service-policy.json
}


resource "aws_ecs_cluster" "github_cicd_cluster" {
  name = "github-cicd-cluster"

  tags = {
    Name = "github-cicd-cluster"
  }
}

resource "aws_ecs_task_definition" "service_task_definition" {
  family = "service"
  container_definitions = jsonencode([
    {
      name      = "first"
      image     = "docker.io/library/docker.io/ersumit/github_automation_django:latest"
      cpu       = 2
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 80
        }
      ]
    }
  ])

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [ap-south-1a, ap-south-1b]"
  }
}

# resource "aws_ecs_task_definition" "container_task" {
#   family = "container-task"

#   container_definitions = <<EOF
#   [
#     {
#       "name": "container-task",
#       "image": "docker.io/library/docker.io/ersumit/github_automation_django:latest",
#       portmappings = [
#         {
#           container_port = 8080
#           host_port = 8080
#         }
#       ]
#       "cpu": 2,
#       "memory": 512,
#       "essential": true
#     }
#   ]
#   EOF
#   requires_compatibilities = ["FARGATE"]
#   network_mode = "awsvpc"
#   memory = 512
#   cpu = 2
#   execution_role_arn = "${aws_iam_role.tf_ecs_service_role.arn}"
# }


# resource "aws_ecs_service" "github_automation_django_service" {
#   name = "github-automation-django-service"
#   cluster = "${aws_ecs_cluster.github_cicd_cluster.id}"
#   task_definition = "${aws_ecs_task_definition.container_task.arn}"
#   launch_type = "FARGATE"
#   desired_count = 1
#   network_configuration {
#     subnets = ["${module.network.public_subnets}"]
#     security_groups = ["${module.network.security_groups}"]
#     assign_public_ip = "ENABLED"
#   }
# }