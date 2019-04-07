#!/bin/bash

# arguments expected: yes or no
if [ "$1" == "yes" ] ; then
    echo "Installing apt-cacher-ng detector, as requested."

    # This uses the apt-proxy-ng only if present. It checks on port 3142 of the host/gateway, and returns DIRECT for no proxy,
    # or the proxy address if it's detected. This uses an undocumented feature of apt-get.
    # Code taken and adapted from these URLs:
    # http://askubuntu.com/questions/53443/how-do-i-ignore-a-proxy-if-not-available
    # https://gist.github.com/wassname/6e97c2165d9ffe13b270

    apt-get install -y netcat iproute2
 
    export HOST_IP=$(ip route| awk '/^default/ {print $3}')

    echo "#!/bin/bash" > /usr/local/bin/apt-ng-host-discover
    echo "if nc -w1 -z $HOST_IP 3142; then printf http://$HOST_IP:3142; else printf DIRECT; fi" >> /usr/local/bin/apt-ng-host-discover
    chmod +x /usr/local/bin/apt-ng-host-discover

    echo 'Acquire::http::Proxy-Auto-Detect "/usr/local/bin/apt-ng-host-discover";' > /etc/apt/apt.conf.d/30proxy
    echo "Host for apt-cacher-ng: " $(/usr/local/bin/apt-ng-host-discover)

else
    echo "Not installing apt-cacher-ng detector, as requested."
fi
