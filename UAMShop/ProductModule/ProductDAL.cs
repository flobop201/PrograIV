using System;
using System.Collections.Generic;
using ConnectionManage;
using System.Data;
using System.Data.SqlClient;

namespace ProductModule
{
    public class ProductDAL
    {
        public List<ProductBE> RetrieveProducts(string connectionString,int idCategoria, string busqueda)
        {
            ConnectionManager myConnection = new ConnectionManager(connectionString);
            SqlConnection conexion = myConnection.CreateConnection();
            SqlCommand command = myConnection.createCommand(conexion);
            SqlDataReader productReader;

            List<ProductBE> listResult = new List<ProductBE>();
            ProductBE product;

            command.CommandText = "usp_productosSelect";
            command.CommandType = CommandType.StoredProcedure;

            SqlParameter parameter = new SqlParameter("@IdCategoria",SqlDbType.Int);
            parameter.Value = idCategoria;                        
            command.Parameters.Add(parameter);

            SqlParameter parameter2 = new SqlParameter("@Busqueda", SqlDbType.VarChar);
            parameter2.Value = busqueda;
            command.Parameters.Add(parameter2);

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

        public List<ProductBE> RetrieveProductsTop(string connectionString)
        {
            ConnectionManager myConnection = new ConnectionManager(connectionString);
            SqlConnection conexion = myConnection.CreateConnection();
            SqlCommand command = myConnection.createCommand(conexion);
            SqlDataReader productReader;

            List<ProductBE> listResult = new List<ProductBE>();
            ProductBE product;

            command.CommandText = "usp_productosSelectTop";
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
