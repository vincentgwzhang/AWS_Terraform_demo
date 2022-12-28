data "aws_ec2_instance_type_offerings" "deeplearnaws_ec2_types" {
  for_each = toset(data.aws_availability_zones.deeplearnaws_azones.names)
  filter {
    name   = "instance-type"
    values = [var.instance_type_map[each.key]]
  }
  filter {
    name   = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
}