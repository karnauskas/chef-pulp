default['pulp']['server'] = {

  'run_init_db' => true,

  'server_name' => node['fqdn'],
  'key_url' => '/pulp/gpg',
  'ks_url' => '/pulp/ks',
  'default_login' => 'admin',
  'default_password' => 'admin',
  'debugging_mode' => false,

  'database' => {
    'name' => 'pulp_database',
    'seeds' => 'localhost:27017',
    'operation_retries' => 2,
    'replica_set' => nil
  },
  
  'security' => {
    'cacert' => '/etc/pki/pulp/ca.crt',
    'cakey' => '/etc/pki/pulp/ca.key',
    'ssl_ca_certificate' => '/etc/pki/pulp/ssl_ca.crt',
    'user_cert_expiration' => '7',
    'consumer_cert_expiration' => '3650',
    'serial_number_path' => '/var/lib/pulp/sn.dat'
  },

  'consumer_history' => {
    'lifetime' => 180
  },

  'coordinator' => {
    'task_state_poll_interval' => 0.1
  },

  'data_reaping' => {
    'reaper_interval' => 0.25,
    'archived_calls' => 0.5,
    'consumer_history' => 60,
    'repo_sync_history' => 60,
    'repo_publish_history' => 60,
    'repo_group_publish_history' => 60
  },

  'ldap' => {
    'enabled' =>  false,
    'uri' =>  'ldap://localhost',
    'base' =>  'dc=localhost',
    'tls' =>  false,
    'default_role' =>  '<role-id>',
    'filter' =>  '(gidNumber=200)',
  },

  'oauth' => {
    'enabled' => true,
    'oauth_key' => 'YYS5ILM6',
    'oauth_secret' => 'O8MK25S8'
  },

  'logs' => {
    'config' => ' /etc/pulp/logging/basic.cfg',
    'db_config' => ' /etc/pulp/logging/db.cfg',
  },

  'messaging' => {
    'url' => 'tcp://localhost:5672',
    'cacert' => '/etc/pki/qpid/ca/ca.crt',
    'clientcert' => '/etc/pki/qpid/client/client.pem',
    'topic_exchange' => 'amq.topic',
    'install_timeout' => '30s:12h',
    'update_timeout' => '30s:12h',
    'uninstall_timeout' => '30s:12h',
    'bind_timeout' => '30d:6h',
    'unbind_timeout' => '30d:6h'
  },

  'scheduler' => {
    'dispatch_interval' => 30
  },

  'tasks' => {
    'concurrency_threshold' => 9,
    'dispatch_interval' => 0.5,
    'archived_call_lifetime' => 48,
    'consumer_content_weight' => 0,
    'create_weight' => 0,
    'publish_weight' => 1,
    'sync_weight' => 2,
  },

  'email' => {
    'enabled' => false,
    'host' => 'localhost',
    'port' => 25,
    'from' => "root@#{node['fqdn']}"
  }

}
