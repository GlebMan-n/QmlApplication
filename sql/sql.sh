#!/bin/bash

sudo mysql --user=root -p123  < ./CREATE_DATABASE.sql
sudo mysql --user=root -p123  < ./CREATE_USER.sql
sudo mysql --user=root -p123  sophic_medical < ./sophic_medical_dump1.sql
sudo mysql --user=root -p123 -D sophic_medical -e "GRANT ALL PRIVILEGES ON sophic_medical.*  TO 'sophic_medical'@'localhost';"
