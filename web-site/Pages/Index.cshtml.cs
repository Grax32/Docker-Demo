using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;

namespace web_site.Pages;

public class IndexModel : PageModel
{
    private readonly ILogger<IndexModel> _logger;

    public IndexModel(ILogger<IndexModel> logger)
    {
        _logger = logger;
    }

    public List<(string Name, string Id)> Users { get; set; } = new ();

    public void OnGet()
    {

        // Establish a connection to the database using the custom SQL Server connection string
        string connectionString = "Server=ms-sql-server,1433;Database=YourDatabaseName;TrustServerCertificate=True;User Id=sa;Password=YourStrongPassword99@;";
        using (var connection = new SqlConnection(connectionString))
        {
            // Open the connection
            connection.Open();

            // Create a SQL command to query the database
            string query = "SELECT Name,Id FROM YourTableName";
            SqlCommand command = new SqlCommand(query, connection);

            // Execute the command and retrieve the data
            SqlDataReader reader = command.ExecuteReader();

            // Read the data and populate the list of users
            while (reader.Read())
            {
                Users.Add((reader.GetString(0), reader.GetInt32(1).ToString()));
            }

            // Close the reader and the connection
            reader.Close();
            connection.Close();

        }
    }
}
