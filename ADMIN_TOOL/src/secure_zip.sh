#!/bin/sh    
read -p "Enter Folder Name : " folder
zip --encrypt -r $folder.zip  $folder
#tar -cvjf --encrypt -r  $folder.tar.bz2  $folder

#Enter password: 
#Verify password: 

# adding: $folder/ (stored 0%)
#  adding: var/log/dmesg.0 (deflated 74%)
#  adding: var/log/dpkg.log.9.gz (deflated 0%)
#  adding: var/log/samba/log.asc-nb (deflated 96%)
#***


#REFERENCE:
#https://www.shellhacks.com/create-password-protected-zip-file-linux/


#This code will crearte a secure.zip folder which is protected by password
#!/bin/sh    
# zip --encrypt my_codes.zip restart.sh test_case.sh date-time.sh
#Enter password: 
#Verify password:
#  adding: restart.sh (stored 15%)
#  adding: test_case.sh (deflated 30%)
#  adding: date-time.sh (deflated 45%)

#Use the following command to uncompress a ZIP file :
#unzip secure.zip
#Enter password
:
