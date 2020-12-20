resource "aws_iam_user" "username" {
  for_each = toset(var.users)
  name = each.key
}