--------------------------------------------------------------------------------
Oracle 11GR2 Installation
--------------------------------------------------------------------------------

1.  The machine must have a fully qualified name for the server.
--------------------------------------------------------------------------------
    As a 'root' user
    check the /etc/hosts file and add the following line

    ip-address-of-the server    hostname

    e.g.
    192.168.1.125   ol7.ol7

    Note: The letter case (upper or lower) of hostname must be consistent across the board

--------------------------------------------------------------------------------
2.  The hostname in /etc/hostname must be same as the hostname defined in /etc/hosts. This can be managed as a part of oracle linux installation itself.
--------------------------------------------------------------------------------

3.  The advantage of using oracle 7 over fedora or Centos is, their is a oracle db preinstall package available for oracle linux with 'yum'
    As a 'root' user, execute the following
--------------------------------------------------------------------------------
    yum install oracle-rdbms-server-11gR2-preinstall

--------------------------------------------------------------------------------
4.  You may want pull and install the os updates and security fixes, but its not mandatory. If you want to update it
    As a 'root' user, execute the following
--------------------------------------------------------------------------------
    yum update -y

--------------------------------------------------------------------------------
5.  Once the preinstall is completed, go ahead and set up a password for the 'oracle' user (This was created as a part of preinstall)
    As a 'root' user, execute the following
--------------------------------------------------------------------------------
    passwd oracle

--------------------------------------------------------------------------------
6.  With default install of Oracle Linux, the 'secure linux' parameter is set to 'enforcing', we need to modify it to 'permissive' as a part of db installation
    As a 'root' user, edit the following file
--------------------------------------------------------------------------------
    /etc/selinux/config

    comment the line: SELINUX=enforcing
    Add a new line: SELINUX=permissive

    After the file has been modified,
    As a 'root' user, execute the following for the changes to take effect

    setenforce Permissive

--------------------------------------------------------------------------------
7.  Create the following directory structures
    As a 'root' user, execute the following
--------------------------------------------------------------------------------
    mkdir -p /u01/app/oracle/product/11.2.0.4/db_1
    chown -R oracle:oinstall /u01
    chmod -R 775 /u01

--------------------------------------------------------------------------------
8.  We have to define some specific variables for oracle user, so
    As a 'oracle' user, perform the following
--------------------------------------------------------------------------------
    a.  vi .bash_profile   {Add the following lines}

	#Oracle Settings

	export TMP=/tmp
	export TMPDIR=$TMP

	export ORACLE_HOSTNAME=$HOSTNAME
	export ORACLE_UNQNAME=ORCL11G
	export ORACLE_BASE=/u01/app/oracle
	export ORACLE_HOME=$ORACLE_BASE/product/11.2.0.4/db_1
	export ORACLE_SID=ORCLDB11G
	export ORACLE_TERM=xterm
	export TNS_ADMIN=$ORACLE_HOME/network/admin

	export PATH=/usr/sbin:$PATH
	export PATH=$ORACLE_HOME/bin:$PATH

	export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
	export CLASSPATH=$ORACLE_HOME/JRE:$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib

--------------------------------------------------------------------------------
9. For the newly added oracle 19c variables to take effect, source the .bash_profile
    As a 'oracle' user, execute the following

--------------------------------------------------------------------------------
    source ~/.bash_profile

--------------------------------------------------------------------------------
10. Unzip the LINUX version of DB installation in to oracle home
    Assumption: You have the 'V17530-01_1of2.zip' and 'V17530-01_2of2.zip' downloaded from oracle edelivery site and uploaded to /tmp of your target server, and the owner of this file is 'oracle' user

    As a 'oracle' user, unzip the zipped file inside $ORACLE_HOME

--------------------------------------------------------------------------------
    cd $ORACLE_HOME
    unzip -oq /tmp/V17530-01_1of2.zip
	unzip -oq /tmp/V17530-01_2of2.zip

--------------------------------------------------------------------------------
11. Once the file is unzipped in $ORACLE_HOME successfully, run the installer
    
	./runInstaller

--------------------------------------------------------------------------------
12.	The installer will generate errors at the following places for linking errors

	a.	ins_ctx.mk
	
	fix for the above error is:

		1.	Go to $ORACLE_HOME/ctx/lib/
		2.	vi ins_ctx.mk
		3. 	Look for the text in the file (it will appear only once)
			ctxhx: $(CTXHXOBJ)
			$(LINK_CTXHX) $(CTXHXOBJ) $(INSO_LINK)
		4.	Modify the '$(LINK_CTXHX) $(CTXHXOBJ) $(INSO_LINK)' to the following
			-static $(LINK_CTXHX) $(CTXHXOBJ) $(INSO_LINK) /usr/lib/gcc/x86_64-redhat-linux/4.8.2/libstdc++.so
		5.	Save the file
		6.	On the Installer UI, click on 'Retry' and the error should go away
	
	
	b.	ins_emagent.mk

		1.	Go to $ORACLE_HOME/sysman/lib/
		2.	vi ins_emagent.mk
		3.	Look for the text in the file (it will appear only once)
			$(MK_EMAGENT_NMECTL)
		4.	Modify the '$(MK_EMAGENT_NMECTL)' to
			$(MK_EMAGENT_NMECTL) -lnnz11 
		5.	Save the file
		6.	On the Installer UI, click on 'Retry' and the error should go away

--------------------------------------------------------------------------------
13. Installation of DB has few scripts that needs to be executed as 'root' user.
    Open a new terminal and login as 'root' user.

    Once step#12 is completed, execute the following
--------------------------------------------------------------------------------

    . /u01/app/oraInventory/orainstRoot.sh
    . /u01/app/oracle/product/11.2.0.4/db_1/root.sh

--------------------------------------------------------------------------------
14. Once Step#13 is completed, perform the following

--------------------------------------------------------------------------------
As a 'oracle' user, edit the following file and change the entry from 'N' to 'Y'

--------------------------------------------------------------------------------
In /etc/oratab

    orcl:/u01/app/oracle/product/11.2.0.4/db_1:Y

--------------------------------------------------------------------------------
15. The product is installed, now its time to create a database.
    As a 'oracle' user, execute the following
a.  This step is only applicable if you wish to change the default port
    Run the following command, to update the port & host for listener and service name Configurations

--------------------------------------------------------------------------------
    netmgr

    # Once the listener and service name configurations are update and saved, when the following commands are executed, it will 
    # take reference from listener.ora and tnsnames.ora under $TNS_ADMIN

--------------------------------------------------------------------------------
b.	Correct the Parameters for Oracle Initialization

--------------------------------------------------------------------------------
	1.	Navigate to /u01/app/oracle/product/11.2.0.4/db_1/dbs
	2.	cp init.ora initORCLDB11G.ora
	3.	vi initORCLDB11G.ora
		a.	edit: audit_file_dest to have the absolute path of $ORACLE_BASE
		b.	edit: db_recovery_file_dest to have the absolute path of $ORACLE_BASE
		c.	edit: diagnostic_dest to have the absolute path of $ORACLE_BASE
		d.	Comment out the existing entry of control_files and add the following new line 
			control_files = (control01.ctl)
	4.	Copy the control01.ctl from /u01/app/oracle/oradata/orcl to $ORACLE_HOME/dbs
	
--------------------------------------------------------------------------------
c.	Start the Database

--------------------------------------------------------------------------------
	1.	sqlplus / as sysdba
	2.	startup
	3.	show parameter control_files	:	output should match the path: $ORACLE_HOME/dbs/control01.ctl
		a. 	If its not matching, set the spfile file
		b.	alter system set spfile='/u01/app/oracle/product/11.2.0.4/db_1/dbs/spfileorcl.ora';
		c.	Then set the control_files parameter
		d.	alter system set control_files='/u01/app/oracle/oradata/orcl/control01.ctl' scope=spfile;

--------------------------------------------------------------------------------
d.	Add the entry of Listener to tnsnames.ora

--------------------------------------------------------------------------------
	1.	Navigate to $TNS_ADMIN
	2.	cat listener.ora
	3.	Copy the following lines
		LISTENER =
			(ADDRESS = (PROTOCOL = TCP)(HOST = your_hostname)(PORT = 1521))
	4.	vi tnsnames.ora
		Paste the above line to the end of the tnsnames.ora

--------------------------------------------------------------------------------
e.  To start the listener

--------------------------------------------------------------------------------
    lsnrctl start

	To check the status of the listener and if the DB was registered to listener
	watch -n10 listener status
	
	It should take about 30 seconds to have the DB registered with the listener
	And then you will be able to connect to the non-SYS users via any external SQL client

--------------------------------------------------------------------------------