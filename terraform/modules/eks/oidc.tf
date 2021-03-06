data "external" "thumbprint" {
  program = ["./${path.module}/templates/oidc-thumbprint.sh", var.aws_region]
}

resource "aws_iam_openid_connect_provider" "main" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.external.thumbprint.result.thumbprint]
  url             = aws_eks_cluster.main.identity.0.oidc.0.issuer
}
