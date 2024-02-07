#!/bin/bash

# Assign the parameter to a variable
mssql_sa_password="$MSSQL_SA_PASSWORD"

# Check if the variable is set
if [ -z "$mssql_sa_password" ]; then
    echo "Environment variable ENV_VARIABLE_NAME is not set."
    exit 1
fi

# Function to check if SQL Server is ready
wait_for_sql_server() {
    while ! /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$mssql_sa_password" -Q "SELECT 1;" &> /dev/null; do
        sleep 5

        echo "Sleeping for 5 seconds..."
        
        # Check if the program is running
        if ! pid=$(pidof sqlservr); then
            echo "Error: sqlservr is not running."
            exit 1
        fi
    done
    echo "SQL Server is ready."
}

echo "Starting the database"
# Start SQL Server service during the build
/opt/mssql/bin/sqlservr &

# Call the function to wait for SQL Server to be ready
echo "Waiting for SQL Server to be ready..."
wait_for_sql_server

echo "Running setup script."
# Run the setup script to create the DB and the schema in the DB
if ! /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$mssql_sa_password" -d master -b -i initialize-my-database.sql; then
    echo "Error: SQL script failed to run."
    exit 1
fi

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$mssql_sa_password" -Q "SHUTDOWN" &> /dev/null

echo "SQL Script complete."
sleep 2
