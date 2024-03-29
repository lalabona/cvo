from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
import SocketServer
import os
from urlparse import urlparse, parse_qs

class S(BaseHTTPRequestHandler):
    def _set_headers(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        self._set_headers()

        self.wfile.write("".join(["<html><body><h1>Reader</h1><h2>Date :", os.popen("date").read(), "</h2></body></html>"]))
        self.wfile.write("".join(["<html><body><h4>Mounts:", os.popen("mount | egrep -o '(^.*?\:.*? on .*? type nfs.)'").read(), "/<h4>",  "<h2>CWD :", os.popen("pwd").read(), "</h2><pre>", os.popen("ls -ltr").read(), "</pre></body></html>"]))

    def do_POST(self):
        # Doesn't do anything with posted data
        o = urlparse(self.path)
        qmap = parse_qs(o[4])
        fname = qmap['fname'][0]
        fsize = qmap['fsize'][0]
        tfile = "".join(['/opt/cvo/', fname, '.txt'])

        f = open(tfile, "w")
        f.write(str("P" * int(fsize)))
        f.close()

        self._set_headers()
        self.wfile.write("<html><body><h1>POST!</h1><p>Data written</p></body></html>")

def run(server_class=HTTPServer, handler_class=S, port=80):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print 'Starting httpd...'
    httpd.serve_forever()

if __name__ == "__main__":
    from sys import argv

    if len(argv) == 2:
        run(port=int(argv[1]))
    else:
        run()
