resource "aws_iam_policy" "jenkins-controller-policy" {
  name        = "jenkins-controller-policy"
  path        = "/"
  description = "Jenkins Controller Policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "Stmt1312295543082",
        "Action" : [
          "ec2:DescribeSpotInstanceRequests",
          "ec2:CancelSpotInstanceRequests",
          "ec2:GetConsoleOutput",
          "ec2:RequestSpotInstances",
          "ec2:RunInstances",
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:TerminateInstances",
          "ec2:CreateTags",
          "ec2:DeleteTags",
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceTypes",
          "ec2:DescribeKeyPairs",
          "ec2:DescribeRegions",
          "ec2:DescribeImages",
          "ec2:DescribeAvailabilityZones",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "iam:ListInstanceProfilesForRole",
          "iam:PassRole",
          "ec2:GetPasswordData"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_role" "jenkins-controller-role" {
  name = "jenkins-controller-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "jenkins-controller-role"
  }
}

resource "aws_iam_policy_attachment" "jenkins-controller-policy-attach" {
  name       = "jenkins-controller-policy-attach"
  roles      = [aws_iam_role.jenkins-controller-role.name]
  policy_arn = aws_iam_policy.jenkins-controller-policy.arn
}

resource "aws_iam_instance_profile" "jenkins-controller-instance-profile" {
  name = "jenkins-controller-instance-profile"
  role = aws_iam_role.jenkins-controller-role.name
}
