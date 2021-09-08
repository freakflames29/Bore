#!/usr/bin/env ruby
require "httparty"
puts "It seems like you are bored 😣"
puts "Ok I have some idea for you 🙋"
$req=nil
$flag=false
#function to show the buffering
def fetch 
   while !$flag
        print "\033[1;31mFetching New Idea🚀 .\r"
        sleep(0.5)
        print "\033[1;31mFetching New Idea🚀 ..\r"
        sleep(0.5)
        print "\033[1;31mFetching New Idea🚀 ...\r"
        sleep(0.5)
        print "                                      \r"
        print "\033[1;31mFetching New Idea🚀 .\r"

    end
end
#function to fetching content
def req
    url="https://www.boredapi.com/api/activity/"
    $req=HTTParty.get(url)
    if $req.code==200
        $flag=true
    end
end
#running to methods in different threads
def thrcall
    ft=Thread.new{fetch}
    rt=Thread.new{req}
    ft.join
    rt.join
end
thrcall #calling the thread
puts "\033[1;32m-----------------------"

# asking user 
nf=true
while nf
    if $req.code!=404
        puts "Try it :- #{$req["activity"]}"
        puts "Type :- #{$req["type"]}"
    else
        puts "Bad Bad"
    end
    puts "\033[1;33mCool ? [y/n]"
    us=gets.strip.downcase
    if us=='y'
        puts "\033[1;34mOk lets do it ! #{$req["activity"]} 💪"
        break
    else
        $flag=false
        thrcall
        puts "\033[1;32m-----------------------"
    end
end
