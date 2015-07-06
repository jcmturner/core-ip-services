cd /vagrant/chef-repo

cat <<EOF > /vagrant/chef-args.json
{ 
  "coreip": {
    "domain": "$2"
  }
}
EOF
chef-client --local-mode --runlist "recipe[$1]" -j /vagrant/chef-args.json
