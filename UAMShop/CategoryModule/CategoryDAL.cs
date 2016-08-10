using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CategoryModule;
using ConnectionManage;
using System.Data;
using System.Data.SqlClient;
using Log4NetModule;

namespace CategoryModule
{
    public class CategoryDAL
    {
        public List<CategoryBE> RetrieveCategory(string connectionString)
        {
            var listResult = new List<CategoryBE>();
            var myConnection = new ConnectionManager(connectionString);
            SqlConnection conexion = myConnection.CreateConnection();
            SqlCommand command = myConnection.CreateCommand(conexion);
            try
            {
                command.CommandText = "usp_CategoriasSelect";
                command.CommandType = CommandType.StoredProcedure;

                conexion.Open();
                SqlDataReader productReader = command.ExecuteReader();

                while (productReader.Read())
                {
                    var product = new CategoryBE
                    {
                        Id = Convert.ToInt16(productReader["Id"]),
                        Categoria = productReader["Categoria"].ToString()
                    };
                    listResult.Add(product);
                }
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
            }
            finally
            {
                conexion.Close();
            }
            return listResult;
        }
    }
}
