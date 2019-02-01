import urllib2
import cookielib
from getpass import getpass
import sys
import os
from stat import *

#=======================================#
number = raw_input("Enter number: ")
message = raw_input("Enter text: ")
#=======================================#
#Taking raw input from file
#message = raw_input(" ")
#number = "9966451645"
#=======================================#

if __name__ == "__main__":    
#    username = "your_login_id"
#    passwd = "your_password"
    username = "9966451645"
    passwd = "nopassword"

    message = "+".join(message.split(' '))


    url ='http://site24.way2sms.com/Login1.action?'
    data = 'username='+username+'&password='+passwd+'&Submit=Sign+in'

 #For cookies

    cj= cookielib.CookieJar()
    opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj))

 #Adding header details
    opener.addheaders=[('User-Agent','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120')]
    try:
        usock =opener.open(url, data)
    except IOError:
        print "error"
        #return()

    jession_id =str(cj).split('~')[1].split(' ')[0]
    send_sms_url = 'http://site24.way2sms.com/smstoss.action?'
    send_sms_data = 'ssaction=ss&Token='+jession_id+'&mobile='+number+'&message='+message+'&msgLen=136'
    opener.addheaders=[('Referer', 'http://site25.way2sms.com/sendSMS?Token='+jession_id)]
    try:
        sms_sent_page = opener.open(send_sms_url,send_sms_data)
    except IOError:
        print "error"
        #return()

#  print "success" 
    #return ()

#==========================================================================#
#          ANJI BABU KAPAKAYALA                                            #
#==========================================================================#
#ref: http://home.iitk.ac.in/~saiwal/python/send-sms-way2sms-python/       #
#==========================================================================#
