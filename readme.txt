# Run docker compose
docker compose up


# Shutdown docker containers
docker compose down


# Take backup
docker exec -t your-db-container pg_dumpall -c -U your-db-user > dump_$(date +%Y-%m-%d_%H_%M_%S).sql


# Restore backup

cat your_dump.sql | docker exec -i your-db-container psql -U your-db-user -d your-db-name

ex
 cat /workspace/Odoo/dump_2022-11-04_18_53_51.sql | docker exec -i 077c2823ba8c psql -U odoo -d postgres


# Get database container id 
docker ps -f name=odoo-mydb-1 --quiet

# Get all containers info 
docker container ls 

# docker cp source_file_path container_id:<container path>