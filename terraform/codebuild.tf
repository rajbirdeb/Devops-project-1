resource "aws_codebuild_project" "react_build" {
  name         = "ReactAppBuild"
  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:6.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true
  }

  source {
    type            = "CODEPIPELINE"
    buildspec       = "src/buildspec.yml"  # ✅ Correct: keep this here
  }
}
