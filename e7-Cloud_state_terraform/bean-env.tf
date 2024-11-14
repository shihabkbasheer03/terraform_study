resource "random_string" "suffix" {
  length  = 4
  special = false
}

resource "aws_elastic_beanstalk_environment" "vprofile-bean-prod" {
  name                = "vprofile-bean-prod"
  application         = aws_elastic_beanstalk_application.vprofile-prod.name
  solution_stack_name = "64bit Amazon Linux 2 v4.7.3 running Tomcat 9 Corretto 8"
  cname_prefix        = "vprofile-bean-prod-${random_string.suffix.result}"

  setting {
    namespace  = "aws:ec2:vpc"
    option_name = "VPCId"
    value       = module.vpc.vpc_id
  }
  setting {
    namespace  = "aws:autoscaling:launchconfiguration"
    option_name = "IamInstanceProfile"
    value       = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace  = "aws:ec2:vpc"
    option_name = "AssociatePublicIpAddress"
    value       = "false"
  }
  setting {
    namespace  = "aws:ec2:vpc"
    option_name = "Subnets"
    value       = join(",", module.vpc.private_subnets)
  }
  setting {
    namespace  = "aws:ec2:vpc"
    option_name = "ELBSubnets"
    value       = join(",", module.vpc.public_subnets)
  }
  setting {
    namespace  = "aws:autoscaling:launchconfiguration"
    option_name = "InstanceType"
    value       = "t2.micro"
  }
  setting {
    namespace  = "aws:autoscaling:launchconfiguration"
    option_name = "EC2KeyName"
    value       = aws_key_pair.vprofilekey.key_name
  }
  setting {
    namespace  = "aws:autoscaling:asg"
    option_name = "Availability Zones"
    value       = "Any 3"
  }
  setting {
    namespace  = "aws:autoscaling:asg"
    option_name = "MinSize"
    value       = "1"
  }
  setting {
    namespace  = "aws:autoscaling:asg"
    option_name = "MaxSize"
    value       = "8"
  }
  setting {
    namespace  = "aws:elasticbeanstalk:application:environment"
    option_name = "environment"
    value       = "prod"
  }
  setting {
    namespace  = "aws:elasticbeanstalk:application:environment"
    option_name = "LOGGING_APPENDER"
    value       = "GRAYLOG"
  }
  setting {
    namespace  = "aws:elasticbeanstalk:application:system"
    option_name = "SystemType"
    value       = "enhanced"
  }
  setting {
    namespace  = "aws:autoscaling:updatepolicy:rollingupdate"
    option_name = "RollingUpdateEnabled"
    value       = "true"
  }
  setting {
    namespace  = "aws:autoscaling:updatepolicy:rollingupdate"
    option_name = "RollingUpdateType"
    value       = "Health"
  }
  setting {
    namespace  = "aws:autoscaling:updatepolicy:rollingupdate"
    option_name = "MaxBatchSize"
    value       = "1"
  }
  setting {
    namespace  = "aws:elb:loadbalancer"
    option_name = "CrossZone"
    value       = "true"
  }
  setting {
    namespace  = "aws:elb:loadbalancer"
    option_name = "StickinessEnabled"
    value       = "true"
  }
  setting {
    namespace  = "aws:elasticbeanstalk:command"
    option_name = "BatchSizeType"
    value       = "Fixed"
  }
  setting {
    namespace  = "aws:elasticbeanstalk:command"
    option_name = "BatchSize"
    value       = "1"
  }
  setting {
    namespace  = "aws:elasticbeanstalk:command"
    option_name = "DeploymentPolicy"
    value       = "Rolling"
  }
  setting {
    namespace  = "aws:autoscaling:launchconfiguration"
    option_name = "SecurityGroups"
    value       = aws_security_group.vprofile-prod-dg.id
  }
  setting {
    namespace  = "aws:elbv2:loadbalancer"
    option_name = "SecurityGroups"
    value       = aws_security_group.vprofile-bean-elb-sg.id
  }

  depends_on = [
    aws_security_group.vprofile-bean-elb-sg,
    aws_security_group.vprofile-prod-sg
  ]
}
