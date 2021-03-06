# This example config is neither production-ready
# nor secure. Please consult the official docs
# for full configuration instructions.
# https://www.nomadproject.io/docs/agent/config.html

bind_addr = "0.0.0.0"
data_dir  = "/var/lib/nomad"

leave_on_interrupt = true
leave_on_terminate = true

disable_update_check = true

server {
  bootstrap_expect = 1
}
