@REM stop if running
docker stop custom-sql-server

@REM remove if exists
docker rm custom-sql-server

docker run -d --name custom-sql-server -p1492:1433 custom-sql-server 
