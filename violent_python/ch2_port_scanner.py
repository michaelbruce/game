import optparse
from socket import *

def conn_scan(tgt_host, tgt_port):
    try:
        conn_skt = socket(AF_INET, SOCK_STREAM)
        conn_skt.connect((tgt_host, tgt_port))
        print '[+]%d/tcp open'% tgt_port
        conn_skt.close()
    except:
        print '[-]%d/tcp closed'% tgt_port

def port_scan(tgt_host, tgt_ports):
    try:
        tgt_ip = gethostbyname(tgt_host)
    except:
        print "[-] Cannot resolve '%s': Unknown Host"%tgt_host
        return
    try:
        tgt_name = gethostbyaddr(tgt_ip)
        print '\n[+] Scan Results for: ' + tgt_name[0]
    except:
        print '\n[+] Scan Results for: ' + tgt_ip
    setdefaulttimeout(1)
    for tgt_port in tgt_ports:
        print 'Scanning port ' + tgt_port
        conn_scan(tgt_host, int(tgt_port))

parser = optparse.OptionParser('usage %prog -H'+\
        '<target hosts> -p <target port>')
parser.add_option('-H', dest='tgt_host', type='string', \
        help='specify target host')
parser.add_option('-p', dest='tgt_port', type='int', \
        help='specify target port')
(options, args) = parser.parse_args()
tgt_host = options.tgt_host
tgt_port = options.tgt_port
if (tgt_host == None) | (tgt_port == None):
    print parser.usage
    exit(0)

# usage: python portscan.py -H <adde> -p 21, 22, 80
