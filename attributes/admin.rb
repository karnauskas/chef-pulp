default['pulp']['admin'] = {

  'server' => {
    'host' => "localhost",
    'port' => 443,
    'api_prefix' => '/pulp/api',
    'upload_chunk_size' => 104_857_6,
    'ca_path' => '/etc/pki/tls/certs/ca-bundle.crt',
    'verify_ssl' => true
  },

  'client' => {
    'role' => 'admin'
  },

  'filesystem' => {
    'extensions_dir' => '/usr/lib/pulp/admin/extensions',
    'id_cert_dir' => '~/.pulp',
    'id_cert_filename' => 'user-cert.pem',
    'upload_working_dir' => '~/.pulp/uploads'
  },

  'logging' => {
    'filename' => '~/.pulp/admin.log',
    'call_log_filename' => '~/.pulp/server_calls.log'
  },

  'output' => {
    'poll_frequency_in_seconds' => 1,
    'enable_color' => true,
    'wrap_to_terminal' => false,
    'wrap_width' => 80
  }
}
