variable "bucket_name" {
  type = string
  description = "das ist der name unseres app buckets"
}

variable "mime_types" {
  description = "Mapping of file extensions to MIME types"
  type = map(string)
  default = {
    ".js"   = "application/javascript"
    ".html" = "text/html"
    ".css"  = "text/css"
    ".png"  = "image/png"
    ".jpg"  = "image/jpg"
    ".jpeg" = "image/jpeg"
    ".gif"  = "image/gif"
    ".svg"  = "image/svg+xml"
    ".json" = "application/json"
    # Weitere MIME-Typen hier hinzufügen
  }
}