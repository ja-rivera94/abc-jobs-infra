resource "google_compute_url_map" "api_gateway" {
  name = "${var.api_gateway_name}"
  default_service = google_compute_backend_service.load_balancer.id
}

resource "google_compute_target_http_proxy" "api_gateway_proxy" {
  name = "my-api-gateway-proxy"
  url_map = google_compute_url_map.api_gateway.id
}

resource "google_compute_global_forwarding_rule" "api_gateway_forwarding_rule" {
  name = "my-api-gateway-forwarding-rule"
  target = google_compute_target_http_proxy.api_gateway_proxy.id
  port_range = "80"
}

resource "google_compute_backend_service" "load_balancer" {
  name = var.load_balancer_name
}