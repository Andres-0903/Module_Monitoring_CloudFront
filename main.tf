resource "aws_sns_topic" "alarmcloudfront" {
  name = "cloudfront-alarms"
}

resource "aws_sns_topic_subscription" "alarmcloudfront" {
  topic_arn = aws_sns_topic.alarmcloudfront.arn
  protocol  = "email"
  endpoint  = "arenasandres7@gmail.com"
}

#uso del modulo Cloudfront

module "monitoring_cloudfront_5xx" {
  source = "./monitorinf_CW_cloudfront"

  alarm_name          = "5xxErrorRate"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 5
  metric_name         = "5xxErrorRate"
  namespace           = "AWS_CloudFront"
  period              = 60
  statistic           = "Average"
  threshold           = 2
  alarm_description   = "Alerta peticiones 500 que superen el 2%"

  alarm_actions = [aws_sns_topic.alarmcloudfront.arn]

  dimensions = {
    CDN = "Global"
  }
}

module "monitoring_cloudfront_4xx" {
  source = "./monitorinf_CW_cloudfront"

  alarm_name          = "4xxErrorRate"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 5
  metric_name         = "4xxErrorRate"
  namespace           = "AWS_CloudFront"
  period              = 60
  statistic           = "Average"
  threshold           = 5
  alarm_description   = "Alerta peticiones 400 que superen el 5%"

  alarm_actions = [aws_sns_topic.alarmcloudfront.arn]

  dimensions = {
    CDN = "Global"
  }
}

module "monitoring_cloudfront_latency" {
  source = "./monitorinf_CW_cloudfront"

  alarm_name          = "Alta latencia"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 3
  metric_name         = "OriginLatency"
  namespace           = "AWS_CloudFront"
  period              = 60
  statistic           = "Average"
  threshold           = 500
  alarm_description   = "Se genera la alarma cuando se superan los 500ms"

  alarm_actions = [aws_sns_topic.alarmcloudfront.arn]

  dimensions = {
    CDN = "Global"
  }
}

module "monitoring_cloudfront_total_time" {
  source = "./monitorinf_CW_cloudfront"

  alarm_name          = "Latencia Total"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 3
  metric_name         = "Total_Latency"
  namespace           = "AWS_CloudFront"
  period              = 60
  statistic           = "Average"
  threshold           = 1000
  alarm_description   = "Se genera la alarma cuando se superan los 1000ms"

  alarm_actions = [aws_sns_topic.alarmcloudfront.arn]

  dimensions = {
    CDN = "Global"
  }
}
