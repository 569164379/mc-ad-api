echo net.ipv6.conf.all.disable_ipv6 = 1 >> /etc/sysctl.conf
echo net.ipv6.conf.default.disable_ipv6 = 1 >> /etc/sysctl.conf
echo net.ipv6.conf.lo.disable_ipv6 = 1 >> /etc/sysctl.conf
echo net.ipv6.conf.eth0.disable_ipv6 = 1 >> /etc/sysctl.conf
sysctl -p
sync
echo 3 > /proc/sys/vm/drop_caches
cd /opt/tibco/bw/5.12/bin
./bwengine -p bwengine_debug.tra /mc-ad-api/mcapi_project/
source /root_doc/shareprofile
