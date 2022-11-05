#! /bin/bash


unzip zipfile -d extract_path
unzip -o /workspace/Odoo/odoo_data.zip -d /
unzip -o /workspace/Odoo/db_data.zip -d /
unzip -o  /workspace/Odoo/addons_data.zip -d /

# mkdir odoo_v
# mkdir db_v

cp -r /workspace/Odoo/odoo_data/odoo /workspace/Odoo/odoo_v
cp -r /workspace/Odoo/db_data/pgdata /workspace/Odoo/db_v
cp -r  /workspace/Odoo/addons_data/extra-addons  /workspace/Odoo/
find /workspace/Odoo/odoo_v -type d -exec chmod 777 {} \;
find /workspace/Odoo/db_v -type d -exec chmod 777 {} \;
find /workspace/Odoo/extra-addons -type d -exec chmod 777 {} \;
# Run docker compose
docker compose up

