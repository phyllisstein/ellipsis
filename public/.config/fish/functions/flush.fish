function flush
    sudo killall -HUP mDNSResponder >/dev/null 2>&1
    sudo dscacheutil -flushcache >/dev/null 2>&1
    lunchy restart coredns >/dev/null 2>&1
end
