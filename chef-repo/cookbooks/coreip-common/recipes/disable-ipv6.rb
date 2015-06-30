ruby_block "Disable IPv6" do
  block do
    fe = Chef::Util::FileEdit.new("/etc/sysctl.conf")
    fe.insert_line_if_no_match(/net.ipv6.conf.all.disable_ipv6.*=.*1/,
                               "net.ipv6.conf.all.disable_ipv6 = 1")
    fe.insert_line_if_no_match(/net.ipv6.conf.default.disable_ipv6.*=.*1/,
                               "net.ipv6.conf.default.disable_ipv6 = 1")
    fe.insert_line_if_no_match(/net.ipv6.conf.lo.disable_ipv6.*=.*1/,
                               "net.ipv6.conf.lo.disable_ipv6 = 1")
    fe.write_file
  end
end
