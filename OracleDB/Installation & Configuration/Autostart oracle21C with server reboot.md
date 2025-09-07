--------------------------------------------------------------------------------
Autostart Oracle21C with ser
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
    ExecStart=/u01/app/oracle/product/db/21.3.0/dbhome/bin/dbstart /u01/app/oracle/product/db/21.3.0/dbhome
    ExecStop=/u01/app/oracle/product/db/21.3.0/dbhome/bin/dbshut /u01/app/oracle/product/db/21.3.0/dbhome
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
