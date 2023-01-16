1. Login as root to the machine
2. Create a file 'dbora' under /etc/init.d
3. Use the contents of 'dbora' from this folder and paste it on the file
4. save the file on the machine
5. Change the file permissions using the following command
    chmod 750 /etc/init.d/dbora
6. Associate the "dbora" service with the appropriate run levels and set it to auto-start using the following command
    chkconfig --add dbora