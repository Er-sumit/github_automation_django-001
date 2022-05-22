# data "aws_iam_policy_document" "instance-assume-role-policy" {
#   statement {
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "Service"
#       identifiers = ["ec2.amazonaws.com"]
#     }
#   }
# }

data "aws_iam_policy_document" "deployment-service-policy" {
  statement {
    actions = ["sts:AssumeRole"]
    service = "codedeploy.amazonaws.com"
  }
}