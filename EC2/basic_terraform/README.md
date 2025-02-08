#Terraform Code for AWS CloudWatch Alarm

##Components:

Creates a CloudWatch Alarm for EC2 CPU Utilization.
Sets a threshold of 80% for 5 minutes.
Sends a notification to an SNS topic.
Subscribes an email address to receive alerts.

##Terraform Script

```
provider "aws" {
  region = "us-east-1"
}

# SNS Topic for Alarm Notifications
resource "aws_sns_topic" "alarm_topic" {
  name = "cloudwatch-alarm-topic"
}

# Subscribe an email to the SNS Topic
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alarm_topic.arn
  protocol  = "email"
  endpoint  = "your-email@example.com"  # Replace with your email
}

# CloudWatch Alarm for EC2 CPU Utilization
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "High-CPU-Utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = 300   # Check every 5 minutes
  statistic          = "Average"
  threshold          = 80    # Trigger when CPU > 80%
  alarm_description  = "Triggers when CPU usage exceeds 80% for 5 minutes"
  actions_enabled    = true

  dimensions = {
    InstanceId = "i-1234567890abcdef0"  # Replace with your EC2 instance ID
  }

  alarm_actions = [aws_sns_topic.alarm_topic.arn]  # Send alert to SNS topic
}


```