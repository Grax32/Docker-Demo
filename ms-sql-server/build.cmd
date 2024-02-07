
@REM Remove the existing image and build a new one
docker rmi custom-sql-server --force
docker build -t custom-sql-server . --no-cache
