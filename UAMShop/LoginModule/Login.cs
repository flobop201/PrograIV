using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ConnectionManage;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Log4NetModule;
using UserModule;

namespace LoginModule
{
    public static class Login
    {
        public static UserBE Autenticar(string correo, string password)
        {
            UserBE usuarioDatos = null;
            try
            {
                usuarioDatos = ValidateUser(correo, password);
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
            }
            return usuarioDatos;
        }

        private static UserBE ValidateUser(string correo, string password)
        {
            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];
            var myConnection = new ConnectionManager(connectionString);
            SqlConnection conexion = myConnection.CreateConnection();
            SqlCommand command = myConnection.CreateCommand(conexion);
            try
            {
                command.CommandText = "usp_AutenticarUsuario";
                command.CommandType = CommandType.StoredProcedure;
                var parameter = new SqlParameter("@Usuario", SqlDbType.VarChar) { Value = correo };
                command.Parameters.Add(parameter);
                var parameter2 = new SqlParameter("@Contrasena", SqlDbType.VarChar) { Value = password };
                command.Parameters.Add(parameter2);
                conexion.Open();
                SqlDataReader userReader = command.ExecuteReader();
                var usuario = new UserBE();
                while (userReader.Read())
                {
                    usuario.Nombre = userReader["Nombre"].ToString();
                    usuario.Usuario = userReader["Usuario"].ToString();
                    usuario.IdUsuario = userReader["IdUsuario"].ToString();
                    usuario.IdRol = (userReader["Rol"].ToString());
                    usuario.Estado = (userReader["EstadoA"].ToString());
                    usuario.FechaSuscripcion = Convert.ToDateTime(userReader["FechaSuscripcion"]);

                }
                return usuario;
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
                throw;
            }
            finally
            {
                conexion.Close();
            }
        }

    }
}
