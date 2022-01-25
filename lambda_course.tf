data "archive_file" "init_course" {
  type        = "zip"
  source_file = "${path.module}/my_lambda/course.js"
  output_path = "outputs/course.zip"
}

resource "aws_lambda_function" "course_lambda" {
  filename      = "outputs/course.zip"
  function_name = "course"
  role          = "arn:aws:iam::565092215026:role/lamda_functions"
  handler       = "course.handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("outputs/course.zip")

  runtime = "nodejs14.x"
}