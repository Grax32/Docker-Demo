docker build . -t custom-sql-server --no-cache
docker run -d --name custom-sql-server -p1492:1433 custom-sql-server
