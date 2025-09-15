--------------------------------------------------------------------------------
Autostart Oracle21C with server reboot
--------------------------------------------------------------------------------

As a root user
1. Create a file 'oracle-db.service' under the path: /etc/systemd/system
--------------------------------------------------------------------------------
    Contents of 'oracle-db.service'
    [Unit]
    Description=Run Oracle Startup as an oracle user
    After=network.target
    
    [Service]
    Type=forking
    User=oracle
    Group=oinstall
    Environment="ORACLE_UNQNAME=mdscdb21c"
    Environment="ORACLE_BASE=/u01/app/oracle"
    Environment="ORACLE_HOME=/u01/app/oracle/product/db/21.0.0/dbhome"
    Environment="ORA_INVENTORY=/u01/app/oraInventory"
    Environment="ORACLE_SID=mdscdb21c"
    Environment="PDB_NAME=mdspdb21c"
    Environment="DATA_DIR=/u02/oradata"
    Environment="TNS_ADMIN=/u01/app/oracle/network/admin"
    ExecStart=/home/oracle/scripts/start_db.sh
    ExecStop=/home/oracle/scripts/stop_db.sh
    Restart=on-failure
    LimitNOFILE=65536
    LimitNPROC=16384
    
    [Install]
    WantedBy=multi-user.target


--------------------------------------------------------------------------------
2. Once the file is saved: Reload the daemon
--------------------------------------------------------------------------------
    sudo systemctl daemon-reload
    
--------------------------------------------------------------------------------
3. Now Enable the oracle-service: So that the Oracle service gets started with service reboot
--------------------------------------------------------------------------------
    sudo systemctl enable oracle-db.service
