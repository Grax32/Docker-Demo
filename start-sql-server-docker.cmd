echo Pulling SQL Server 2022 docker image
docker pull mcr.microsoft.com/mssql/server:2022-latest

echo Starting SQL Server 2022 docker container
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=YourStrong@Passw0rd" -p 1433:1433 --name sql1 --hostname sql1 -d mcr.microsoft.com/mssql/server:2022-latest
