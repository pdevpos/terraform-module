terraform {
  backend "s3" {
  dynamodb_table = "remote-state-terr"
  }
}
