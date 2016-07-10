using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ConnectionManage;
using System.Data;
using System.Data.SqlClient;

namespace ProductModule
{
    public class ProductDAL
    {
        public List<ProductBE> RetrieveProducts(string connectionString)
        {
            ConnectionManager myConnection = new ConnectionManager(connectionString);
            SqlConnection conexion = myConnection.CreateConnection();
            SqlCommand command = myConnection.createCommand(conexion);
            SqlDataReader productReader;

            List<ProductBE> listResult = new List<ProductBE>();
            ProductBE product;

            command.CommandText = "RetrieveProducts";
            command.CommandType = CommandType.StoredProcedure;

            conexion.Open();
            productReader = command.ExecuteReader();

            while (productReader.Read())
            {
                product = new ProductBE();
                product.Codigo = productReader["Codigo"].ToString();
                product.Producto = productReader["Producto"].ToString();
                product.Existencia = Int32.Parse(productReader["Existencia"].ToString());
                product.IdCategoria = Int32.Parse(productReader["IdCategoria"].ToString());
                product.Imagen = productReader["Imagen"].ToString();
                product.Precio = Double.Parse(productReader["Precio"].ToString());
                listResult.Add(product);
            }

            conexion.Close();
            return listResult;
        }

        //ToDo: Insert - Crear Delete - Crear Update
    }
}
