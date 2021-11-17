function flush
    sudo killall -HUP mDNSResponder >/dev/null 2>&1
    sudo dscacheutil -flushcache >/dev/null 2>&1
    sudo sudo launchctl kickstart -k user/org.uk.thekelleys.dnsmasq >/dev/null 2>&1
    sudo sudo launchctl kickstart -k user/io.coredns >/dev/null 2>&1
end
