default['pulp']['consumer'] = {
  'server' => {
    'host' => "pulp.#{node['domain']}",
    'port' => 443,
    'api_prefix' => '/pulp/api'
  },
  'client' => {
    'role' => 'consumer'
  },
  'filesystem' => {
    'extensions_dir' => '/usr/lib/pulp/consumer/extensions',
    'repo_file' => '/etc/yum.repos.d/pulp.repo',
    'mirror_list_dir' => '/etc/yum.repos.d',
    'gpg_keys_dir' => '/etc/pki/pulp-gpg-keys',
    'cert_dir' => '/etc/pki/pulp/client/repo',
    'id_cert_dir' => '/etc/pki/pulp/consumer/',
    'id_cert_filename' => 'consumer-cert.pem'
  },
  'reboot' => {
    'permit' => 'False',
    'delay' => 3
  },
  'logging' => {
    'filename' => '~/.pulp/consumer.log',
    'call_log_filename' => '~/.pulp/consumer_server_calls.log'
  },
  'output' => {
    'poll_frequency_in_seconds' => 1,
    'enable_color' => 'true',
    'wrap_to_terminal' => 'false',
    'wrap_width' => 80
  },
  'messaging' => {
    'scheme' => 'tcp',
    'port' => 5672,
    'cacert' => '',
    'clientcert' => '/etc/pki/pulp/consumer/consumer-cert.pem'
  },
  'heartbeat' => {
    'seconds' => 10
  }

}
