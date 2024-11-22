resource "aws_subnet" "public" {
  count                   = length(var.vpc.public_subnets)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.vpc.public.subnets[count.index].cidr_block
  availability_zone       = var.vpc.public.subnets[count.index].availability_zone
  map_public_ip_on_launch = var.vpc.public.subnets[count.index].map_public_ip_on_launch

  tags = var.tags
}
