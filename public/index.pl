#!/usr/bin/perl
use strict;
use warnings;
use Text::Template;
use CGI;

my $cgi = CGI->new();

my $name = $cgi->param('name');
my $requestMethod = $cgi->request_method();

print "Content-type: text/html\r\n\r\n";
print "<html><body><h1>Hello, $name! $requestMethod</h1></body></html>";