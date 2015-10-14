#sovpn
#####A vpn connection handler that uses tmux.

###Overview
Provides an easier way to connect and disconnect the active vpn connection.

###Usage
sovpn [list|connect|attach|disconnect] vpn

###Extra

######File Structure
* `sovpn/vpn/<provider>`
* `sovpn/vpn/<provider>/<country>`
* `sovpn/vpn/<provider>/<country>/<region>`
* `sovpn/vpn/<provider>/<country>/<region>/config.<vpn type>`

######Matching
If multiple provider(s), country(s) or region(s) match a vpn.
The first match, based on alphabetical order, will be used.

######VPN Client(s)
Reads by extension, currently only supports .ovpn (OpenVPN) config file(s).
