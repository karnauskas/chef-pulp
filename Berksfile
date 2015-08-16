source 'https://supermarket.chef.io'

metadata

group :integration do
    cookbook 'apache2'
    cookbook 'yum'
    cookbook 'yum-epel'
    cookbook 'mongodb', '~> 0.16.2'

    cookbook 'qpid', github: 'nkts/chef-qpid', tag: 'v0.1.2'
end
