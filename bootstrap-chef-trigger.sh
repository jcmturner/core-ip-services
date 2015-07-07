cd /vagrant/chef-repo

cat <<EOF > /tmp/chef-args.json
{ 
  "coreip": {
    "domain": "$2"
  }
}
EOF
chef-client --local-mode --runlist "recipe[$1]" -j /tmp/chef-args.json
