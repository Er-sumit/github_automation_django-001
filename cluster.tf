# data "aws_iam_role" "ecs_task_execution_role" {
#   name = "ecsTaskExecutionRole"
# }

# resource "aws_ecs_task_definition" "github-backup-task" {
#   family                   = "${var.task_name}"
#   requires_compatibilities = ["FARGATE"]
#   network_mode             = "awsvpc"
#   cpu                      = "${var.fargate_cpu}"
#   memory                   = "${var.fargate_memory}"
#   task_role_arn            = "${aws_iam_role.github-role.arn}"
#   execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"

#   container_definitions = <<DEFINITION
#   [
#     {
#       "cpu": ${var.fargate_cpu},
#       "image": "${var.image}",
#       "memory": ${var.fargate_memory},
#       "name": "github-backup",
#       "networkMode": "awsvpc"
#     }
#   ]
#   DEFINITION
# }