resource "aws_eks_cluster" "this" {
  name = "example"

  role_arn = aws_iam_role.eks_cluster_role.arn
  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  vpc_config {
    subnet_ids = aws_subnet.privates[*].id
  }

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_AmazonEKSClusterPolicy
  ]
}
