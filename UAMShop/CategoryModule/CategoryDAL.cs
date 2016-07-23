using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CategoryModule;
using ConnectionManage;
using System.Data;
using System.Data.SqlClient;

namespace CategoryModule
{
    public class CategoryDAL
    {
        public List<CategoryBE> RetrieveCategory(string connectionString)
        {
            ConnectionManager myConnection = new ConnectionManager(connectionString);
            SqlConnection conexion = myConnection.CreateConnection();
            SqlCommand command = myConnection.createCommand(conexion);
            SqlDataReader productReader;

            List<CategoryBE> listResult = new List<CategoryBE>();
            CategoryBE product;

            command.CommandText = "usp_CategoriasSelect";
            command.CommandType = CommandType.StoredProcedure;

            conexion.Open();
            productReader = command.ExecuteReader();

            while (productReader.Read())
            {
                product = new CategoryBE();
                product.Id = Convert.ToInt16(productReader["Id"]);
                product.Categoria = productReader["Categoria"].ToString();
                listResult.Add(product);
            }

            conexion.Close();
            return listResult;
        }

        //ToDo: Insert - Crear Delete - Crear Update
    }
}
