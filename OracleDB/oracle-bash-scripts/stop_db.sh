#!/bin/bash
export TMP=/tmp
export TMPDIR=$TMP

export ORACLE_HOSTNAME=ol7
export ORACLE_UNQNAME=cdb19c
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=$ORACLE_BASE/product/db/19.0.0/dbhome_1
export ORA_INVENTORY=/u01/app/oraInventory
export ORACLE_SID=cdb19c
export PDB_NAME=samarth_db_sandbox

ORAENV_ASK=NO
. oraenv
ORAENV_ASK=YES

# Stop Database
sqlplus / as sysdba << EOF

SHUTDOWN IMMEDIATE;
EXIT;
EOF

# Stop Listener
lsnrctl stop
