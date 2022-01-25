data "archive_file" "init_user_course" {
  type        = "zip"
  source_file = "${path.module}/my_lambda/user_course.js"
  output_path = "outputs/user_course.zip"
}

resource "aws_lambda_function" "user_course_lambda" {
  filename      = "outputs/user_course.zip"
  function_name = "user_course"
  role          = "arn:aws:iam::565092215026:role/lamda_functions"
  handler       = "user_course.handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  #source_code_hash = filebase64sha256("outputs/user_course.zip")

  runtime = "nodejs14.x"
}