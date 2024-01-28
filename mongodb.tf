# Configure the MongoDB Atlas Provider
provider "mongodbatlas" {
  public_key  = var.mongodbatlas_public_key
  private_key = var.mongodbatlas_private_key
  region      = var.region
}
# Create the resources

resource "mongodbatlas_cluster" "preparation" {
  name                 = "my-cluster"
  //provider_region_name = "US_EAST_1"
  //nodes = 1
  // storage_size = 512
  provider_instance_size_name = "M0"
  project_id                  = "65a0832006a1fb3d69d07042"
  provider_name               = "TENANT"
  backing_provider_name       = "AWS"
  provider_region_name = "US_EAST_1"
}


# Create a Database User
resource "mongodbatlas_database_user" "preparation_user" {
  username = "preparationsrv"
  password = "preparationsrv"
  project_id = "65a0832006a1fb3d69d07042"
  auth_database_name = "admin"
  roles {
    role_name     = "readWrite"
    database_name = "preparation"
  }
}

# Create Database IP Access List
resource "mongodbatlas_project_ip_access_list" "ip" {
  project_id = "65a0832006a1fb3d69d07042"
  cidr_block = "0.0.0.0/0"
}