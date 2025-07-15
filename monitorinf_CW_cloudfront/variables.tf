variable "alarm_name" {
  type        = string
  description = "Name of the alarma"
}

variable "comparison_operator" {
  type        = string
  description = "valores ><= >= <="
}

variable "evaluation_periods" {
  type        = number
  description = "periodo de evaluacion"
}

variable "metric_name" {
  type        = string
  description = "nombre de la metrica"
}

variable "namespace" {
  type        = string
  description = "espacio de nombres"
}

variable "period" {
  type        = number
  description = "periodo de evaluacion"
}

variable "statistic" {
  type        = string
  description = "valor sum average percent"
}

variable "threshold" {
  type        = number
  description = "valor de umbral"
}

variable "alarm_description" {
  type        = string
  description = "descripcion de la alarma"
}

variable "alarm_actions" {
  type        = list(string)
  description = "accion de la alerta"
}

variable "dimensions" {
  type        = map(string)
  description = "dimensiones eje Cloudfront-region"
}

