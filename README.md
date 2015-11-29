#sovpn
#####A BASH vpn connection handler.


###Overview
Provides an easier way to connect and disconnect the active vpn connection.

###Usage
sovpn [list|connect] vpn


###File Structure

######Config
* `sovpn/vpn/<provider>`
* `sovpn/vpn/<provider>/<country>`
* `sovpn/vpn/<provider>/<country>/<region>`
* `sovpn/vpn/<provider>/<country>/<region>/config.<vpn type>`


###Extra

######Matching
If multiple provider(s), country(s) or region(s) match a vpn.
The first match, based on alphabetical order, will be used.

######VPN Client(s)
Reads by extension, currently only supports .ovpn (OpenVPN) config file(s).
