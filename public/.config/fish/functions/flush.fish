function flush
  sudo killall -HUP mDNSResponder \
    && sudo dscacheutil -flushcache \
    && sudo sudo launchctl kickstart -k system/org.uk.thekelleys.dnsmasq
end
