using System;
using System.Collections.Generic;
using ConnectionManage;
using System.Data;
using System.Data.SqlClient;
using Log4NetModule;

namespace ProductModule
{
    public class ProductDAL
    {
        public List<ProductBE> RetrieveProducts(string connectionString, int idCategoria, string busqueda)
        {
            var myConnection = new ConnectionManager(connectionString);
            var conexion = myConnection.CreateConnection();
            var command = myConnection.CreateCommand(conexion);
            var listResult = new List<ProductBE>();
            try
            {
                command.CommandText = "usp_productosSelect";
                command.CommandType = CommandType.StoredProcedure;

                var parameter = new SqlParameter("@IdCategoria", SqlDbType.Int) { Value = idCategoria };
                command.Parameters.Add(parameter);

                var parameter2 = new SqlParameter("@Busqueda", SqlDbType.VarChar) { Value = busqueda };
                command.Parameters.Add(parameter2);

                conexion.Open();
                SqlDataReader productReader = command.ExecuteReader();

                while (productReader.Read())
                {
                    var product = new ProductBE
                    {
                        Codigo = productReader["Codigo"].ToString(),
                        Producto = productReader["Producto"].ToString(),
                        Existencia = Int32.Parse(productReader["Existencia"].ToString()),
                        IdCategoria = Int32.Parse(productReader["IdCategoria"].ToString()),
                        Imagen = productReader["Imagen"].ToString(),
                        Precio = Double.Parse(productReader["Precio"].ToString())
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

        public List<ProductBE> RetrieveProductsTop(string connectionString)
        {
            var listResult = new List<ProductBE>();
            var myConnection = new ConnectionManager(connectionString);
            var conexion = myConnection.CreateConnection();
            var command = myConnection.CreateCommand(conexion);
            try
            {
                listResult = new List<ProductBE>();

                command.CommandText = "usp_productosSelectTop";
                command.CommandType = CommandType.StoredProcedure;

                conexion.Open();

                SqlDataReader productReader = command.ExecuteReader();

                while (productReader.Read())
                {
                    var product = new ProductBE
                    {
                        Codigo = productReader["Codigo"].ToString(),
                        Producto = productReader["Producto"].ToString(),
                        Existencia = Int32.Parse(productReader["Existencia"].ToString()),
                        IdCategoria = Int32.Parse(productReader["IdCategoria"].ToString()),
                        Imagen = productReader["Imagen"].ToString(),
                        Precio = Double.Parse(productReader["Precio"].ToString())
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
