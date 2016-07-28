using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ConnectionManage;

namespace SaleModule
{
    public class CarritoDal
    {
        public List<CarritoBe> ObtenerCarrito(Int32 usuario, String connectionString)
        {
            var myConnection = new ConnectionManager(connectionString);
            var conexion = myConnection.CreateConnection();
            var command = myConnection.createCommand(conexion);

            var listResult = new List<CarritoBe>();

            command.CommandText = "usp_carritoSelect";
            command.CommandType = CommandType.StoredProcedure;

            var parameter = new SqlParameter("@IdUsuario", SqlDbType.Int) { Value = usuario };
            command.Parameters.Add(parameter);

            conexion.Open();
            SqlDataReader carritoReader = command.ExecuteReader();

            while (carritoReader.Read())
            {
                var carrito = new CarritoBe
                {
                    Id = Int32.Parse(carritoReader["Id"].ToString()),
                    IdUsuario = Int32.Parse(carritoReader["IdUsuario"].ToString()),
                    Codigo = Int32.Parse(carritoReader["Codigo"].ToString()),
                    Descripcion = (carritoReader["Descripcion"].ToString()),
                    Precio = Double.Parse(carritoReader["Precio"].ToString()),
                    Cantidad = Int32.Parse(carritoReader["Cantidad"].ToString()),
                    Imagen = (carritoReader["Imagen"].ToString()),
                };


                listResult.Add(carrito);
            }

            conexion.Close();
            return listResult;
        }

        public bool EliminarItem(string connectionString, int id)
        {
            var myConnection = new ConnectionManager(connectionString);
            var conexion = myConnection.CreateConnection();
            var command = myConnection.createCommand(conexion);

          

            command.CommandText = "usp_carritoDelete";
            command.CommandType = CommandType.StoredProcedure;

            var parameter = new SqlParameter("@Id", SqlDbType.Int) { Value = id };
            command.Parameters.Add(parameter);        

            conexion.Open();
            command.ExecuteNonQuery();           
            conexion.Close();
            return true;
        }

        public void ActualizarItem(string connection, int id, int cantidad)
        {
            var myConnection = new ConnectionManager(connection);
            var conexion = myConnection.CreateConnection();
            var command = myConnection.createCommand(conexion);



            command.CommandText = "usp_carritoUpdate";
            command.CommandType = CommandType.StoredProcedure;

            var parameter = new SqlParameter("@Id", SqlDbType.Int) { Value = id };
            command.Parameters.Add(parameter);

            var parameter2 = new SqlParameter("@Cantidad", SqlDbType.Int) { Value = cantidad };
            command.Parameters.Add(parameter2);

            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
          
        }

        public void AgregarItem(string connection, int idUsuario, int codigo, int cantidad)
        {
            var myConnection = new ConnectionManager(connection);
            var conexion = myConnection.CreateConnection();
            var command = myConnection.createCommand(conexion);



            command.CommandText = "usp_carritoInsert";
            command.CommandType = CommandType.StoredProcedure;

            var parameter = new SqlParameter("@IdUsuario", SqlDbType.Int) { Value = idUsuario };
            command.Parameters.Add(parameter);

            var parameter2 = new SqlParameter("@Codigo", SqlDbType.Int) { Value = codigo };
            command.Parameters.Add(parameter2);

            var parameter3 = new SqlParameter("@Cantidad", SqlDbType.Int) { Value = cantidad };
            command.Parameters.Add(parameter3);

            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
        }
    }
}
