--------------------------------------------------------------------------------
Oracle 21C Installation
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
    yum install -y oracle-database-preinstall-21c

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
    mkdir -p /u01/app/oracle/product/db/21.0.0/dbhome
    mkdir -p /u02/oradata
    chown -R oracle:oinstall /u01 /u02
    chmod -R 775 /u01 /u02

--------------------------------------------------------------------------------
8.  We have to define some specific variables for oracle user, so
    As a 'oracle' user, perform the following
--------------------------------------------------------------------------------
    a.  mkdir /home/oracle/scripts
    b.  cd scripts
    c.  vi set_env.sh   {Add the following lines}

    # Temp Directory Settings
    export TMP=/tmp
    export TMPDIR=$TMP
    # Oracle Settings
    export ORACLE_HOSTNAME=$HOSTNAME
    export ORACLE_UNQNAME=orclcdb21c
    export ORACLE_BASE=/u01/app/oracle
    export ORACLE_HOME=$ORACLE_BASE/product/db/21.0.0/dbhome
    export ORA_INVENTORY=/u01/app/oraInventory
    export ORACLE_SID=orclcdb21c
    export PDB_NAME=orclpdb21c
    export DATA_DIR=/u02/oradata
    export TNS_ADMIN=$ORACLE_HOME/network/admin
    # Path Settings
    export PATH=/usr/sbin:/usr/local/bin:$PATH
    export PATH=$ORACLE_HOME/bin:$PATH
    # Additional Settings
    export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
    export CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib


    d.  edit the '.bash_profile' under /home/oracle and add the following
    
    # Envt Variable Settings
    . /home/oracle/scripts/set_env.sh

--------------------------------------------------------------------------------
9.  For the oracle user to be able to startup and shutdown the service,
    As a 'oracle' user, create following files, one for db start up and other for db shutdown

---------------------------------------------------
Contents of start_db.sh

--------------------------------------------------------------------------------
    #!/bin/bash
    . /home/oracle/scripts/set_env.sh

    export ORAENV_ASK=NO
    . oraenv
    export ORAENV_ASK=YES

    dbstart $ORACLE_HOME

---------------------------------------------------
Contents of stop_db.sh

--------------------------------------------------------------------------------
    #!/bin/bash
    . /home/oracle/scripts/set_env.sh

    export ORAENV_ASK=NO
    . oraenv
    export ORAENV_ASK=YES

    dbshut $ORACLE_HOME    

--------------------------------------------------------------------------------
Assign execute permissions to the startup and shutdown scripts

--------------------------------------------------------------------------------
    chmod 700 start_db.sh stop_db.sh

--------------------------------------------------------------------------------
10. For the newly added oracle 19c variables to take effect, source the .bash_profile
    As a 'oracle' user, execute the following

--------------------------------------------------------------------------------
    source ~/.bash_profile

--------------------------------------------------------------------------------
11. Unzip the LINUX version of DB installation in to oracle home
    Assumption: You have the 'LINUX.X64_213000_db_home.zip' downloaded and uploaded to /tmp of your target server, and the owner of this file is 'oracle' user

    As a 'oracle' user, unzip the zipped file inside $ORACLE_HOME

--------------------------------------------------------------------------------
    cd $ORACLE_HOME
    unzip -oq /tmp/LINUX.X64_213000_db_home.zip

--------------------------------------------------------------------------------
12. Once the file is unzipped in $ORACLE_HOME successfully, run the 'installer in silent mode'
    Running in silent mode, allows you to feed variables / values as a part of command execution, rather than provided them as a part of db installation progress

    As a 'oracle' user inside $ORACLE_HOME, execute the following

--------------------------------------------------------------------------------
    ./runInstaller -ignorePrereq -waitforcompletion -silent                    \
    -responseFile ${ORACLE_HOME}/install/response/db_install.rsp               \
    oracle.install.option=INSTALL_DB_SWONLY                                    \
    ORACLE_HOSTNAME=${ORACLE_HOSTNAME}                                         \
    UNIX_GROUP_NAME=oinstall                                                   \
    INVENTORY_LOCATION=${ORA_INVENTORY}                                        \
    SELECTED_LANGUAGES=en,en_GB                                                \
    ORACLE_HOME=${ORACLE_HOME}                                                 \
    ORACLE_BASE=${ORACLE_BASE}                                                 \
    oracle.install.db.InstallEdition=EE                                        \
    oracle.install.db.OSDBA_GROUP=dba                                          \
    oracle.install.db.OSBACKUPDBA_GROUP=dba                                    \
    oracle.install.db.OSDGDBA_GROUP=dba                                        \
    oracle.install.db.OSKMDBA_GROUP=dba                                        \
    oracle.install.db.OSRACDBA_GROUP=dba                                       \
    SECURITY_UPDATES_VIA_MYORACLESUPPORT=false                                 \
    DECLINE_SECURITY_UPDATES=true

--------------------------------------------------------------------------------
13. Installation of DB has few scripts that needs to be executed as 'root' user.
    Open a new terminal and login as 'root' user.

    Once step#11 is completed, execute the following
--------------------------------------------------------------------------------

    . /u01/app/oraInventory/orainstRoot.sh
    . /u01/app/oracle/product/db/21.0.0/dbhome/root.sh

--------------------------------------------------------------------------------
14. The product is installed, now its time to create a database.
    As a 'oracle' user, execute the following

a.  This step is only applicable if you wish to change the default port
    Run the following command, to update the port & host for listener and service name Configurations

--------------------------------------------------------------------------------
    netmgr

    # Once the listener and service name configurations are update and saved, when the following commands are executed, it will 
    # take reference from listener.ora and tnsnames.ora under $TNS_ADMIN

--------------------------------------------------------------------------------
b.  To start the listener

--------------------------------------------------------------------------------
    lsnrctl start

--------------------------------------------------------------------------------
c.  To create a database in silent mode

--------------------------------------------------------------------------------

    dbca -silent -createDatabase                                              \
    -templateName General_Purpose.dbc                                         \
    -gdbname ${ORACLE_SID} -sid  ${ORACLE_SID} -responseFile NO_VALUE         \
    -characterSet AL32UTF8                                                    \
    -sysPassword YourPasswordGoesHere                                         \
    -systemPassword YourPasswordGoesHere                                      \
    -createAsContainerDatabase true                                           \
    -numberOfPDBs 1                                                           \
    -pdbName ${PDB_NAME}                                                      \
    -pdbAdminPassword YourPasswordGoesHere                                    \
    -databaseType MULTIPURPOSE                                                \
    -memoryMgmtType auto_sga                                                  \
    -totalMemory 2000                                                         \
    -storageType FS                                                           \
    -datafileDestination "${DATA_DIR}"                                        \
    -redoLogFileSize 50                                                       \
    -emConfiguration NONE                                                     \
    -ignorePreReqs

--------------------------------------------------------------------------------
15. Once Step#13 is completed, perform the following

--------------------------------------------------------------------------------
As a 'oracle' user, edit the following file and change the entry from 'N' to 'Y'

--------------------------------------------------------------------------------
In /etc/oratab

    orclcdb21c:/u01/app/oracle/product/db/21.0.0/dbhome:Y

--------------------------------------------------------------------------------
16. Oracle 21c Database has been installed successfully on Oracle Linux 7. One last step is to open the PDB (pluggable database, that we created), 
    since the default status of the PDB is closed
    
    So we will open the database and save its state. This will ensure that the PDB is opened automatically after ever DB restart

--------------------------------------------------------------------------------
a.  Login to DB as a sys user   (Defined-As as a part of Database Creation)

    sqlplus / as sysdba

--------------------------------------------------------------------------------
b.  Check if you are connected to CDB or PDB

    show con_name;
    alter system set db_create_file_dest='${DATA_DIR}';

--------------------------------------------------------------------------------    
c.  If you are connected to CDB, then change the session to PDB
    
    alter session set container=orclpdb21c;

--------------------------------------------------------------------------------    
d.  Once the above statement is executed successfully, check if you are connected to PDB now.
    
    show con_name;

--------------------------------------------------------------------------------    
e.  If the PDB is open, the following statement will throw an error, if its closed, then the statement will open the PDB
    
    ALTER PLUGGABLE DATABASE orclpdb21c OPEN;
    COMMIT;

--------------------------------------------------------------------------------
f.  Save the opened state of PDB
    
    ALTER PLUGGABLE DATABASE orclpdb21c SAVE STATE;
    COMMIT;

--------------------------------------------------------------------------------