resource "aws_codedeploy_app" "react_app" {
  name = "ReactAppCodeDeploy"
  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "react_deploy_group" {
  app_name              = aws_codedeploy_app.react_app.name
  deployment_group_name = "ReactAppDeploymentGroup"
  service_role_arn      = aws_iam_role.codedeploy_role.arn
  deployment_config_name = "CodeDeployDefault.AllAtOnce"

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "ReactAppEC2"
    }
  }

  deployment_style {
    deployment_type = "IN_PLACE"
    deployment_option = "WITHOUT_TRAFFIC_CONTROL"
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  load_balancer_info {}
}
