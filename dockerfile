# Use the SQL Server 2022 base image from Microsoft
FROM mcr.microsoft.com/mssql/server:2022-latest

# Set the environment variables for SQL Server
ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=YourStrongPassword99!

# Create a directory for SQL scripts
WORKDIR /usr/src/sql

# Copy the SQL file to the container
COPY initialize-my-database.sql .
COPY --chmod=+x init-db-during-build.sh .

# Start the db server and run the SQL script
RUN ./init-db-during-build.sh

# Expose the SQL Server port
EXPOSE 1433

# Start SQL Server when the container starts
CMD ["/opt/mssql/bin/sqlservr"]
