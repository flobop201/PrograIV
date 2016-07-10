using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace ConnectionManage
{
    public class ConnectionManager
    {
        private string connectionString;

        public string ConnectionString
        {
            get { return connectionString; }
        }

        public ConnectionManager(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public SqlConnection CreateConnection()
        {
            SqlConnection connection = new SqlConnection(this.connectionString);
            return connection;
        }

        public SqlCommand createCommand(SqlConnection cnn)
        {
            SqlCommand sqlcommand = new SqlCommand(this.connectionString, cnn);
            return sqlcommand;
        }
    }
}
