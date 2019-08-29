#!/usr/bin/env bash
# [WIP]

# A simplistic web server that works with static and dynamic pages.
# There is are a lot of subtle things going on here. First we accept a socket 
# and fork the server. Then we overload the new socket as a code ref. 
# This code ref takes one argument, another code ref, 
# which is used as a callback.
# The callback is called once for every line read on the socket. 
# The line is put into $_ and the socket itself is passed in to the callback.
# Our callback is scanning the line in $_ for an HTTP GET request. 
# If one is found it parses the file name into $1. Then we use $1 to create 
# an new IO::All file object... with a twist. If the file is executable (-x), 
# then we create a piped command as our IO::All object. 
# This somewhat approximates CGI support.
#Whatever the resulting object is, we direct the contents back at our socket 
# which is in $_[0].
perl -MIO::All -e 'io(":8080")->fork->accept->(sub { $_[0] < io(-x $1 ? "./$1 |" : $1) if /^GET \/(.*) / })'

# Feed it a GET request to fetch output of startpage PERL script.
curl -X GET http://127.0.0.1:8080/.start_page.plx
