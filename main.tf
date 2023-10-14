provider "aws" {
  region     = "us-east-1"
#Para uma bucket mais segura configure sua CLI para não precisar utilizar sua key's
  access_key = "sua-access-key"
  secret_key = "sua-secret-key"
}

# Crie uma chave SSH
resource "aws_key_pair" "terraform-keypair" {
  key_name   = "terraform-keypair"  # Escolha um nome para a sua chave SSH
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6sPFdtwP/Z/ctDOgVu0qaHLBc6CkOtfj9/mmgS9lnEpiSk1Yg2Cglohxg/I8XmPUyB3O9sVuWlyzzJebvLYEUCEMjJwmH7Qb27OD4mqtydjEwG27DrSDm4zkPBhkDaHpJ+XTftViQWqYl+zDARZcoaM0nBNZAE8RMAEdeCYM73LaqXFJSHUTaGP6M2Vy6o5lQna07ric2sroOEtr6J4afpPQqMMPzEhjBr6d1zRbvkcuXq+V/ahr2g39aTi69/AQQTpYWXmElulH2S+rFEePGp4tr4oFlPUzVkiplQqUymlCyOMbt5LEFpPcGKCLRWAt37X7D8z3eOduzbgePJSmjREdLgshpdmAX19bIcU1uGXKTL4HavRnPpfjLI/8zELroRI2cPqSWx/sJvySGwblbmp86Szae5CSUzCtt/pJN9lJKYW/wurzAyVELe35juK5SVjNti6LJzsfCuVOqjUoVXAEsjW/qnJE4l1WZvBCG5siZp86P4LtiAtGvtz/dels= edson-andrade@LT-000020-BASE" # Substitua pelo caminho da sua chave pública
}

resource "aws_instance" "Ec2-terraform" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terraform-keypair.key_name # Use o mesmo nome definido no recurso aws_key_pair

  tags = {
    Name = "Ec2-terraform"
  }
}

