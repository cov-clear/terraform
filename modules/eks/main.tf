resource "aws_cloudwatch_log_group" "main" {
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = 14
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.main.arn

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler",
  ]

  vpc_config {
    endpoint_public_access  = false
    endpoint_private_access = false
    subnet_ids              = var.subnet_ids
  }

  depends_on = [
    "aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.eks-AmazonEKSServicePolicy",
    "aws_cloudwatch_log_group.eks_cluster",
  ]
}
