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
            var usuarioDatos = RetrieveCategory(correo, password);
            return usuarioDatos;
        }

        private static UserBE RetrieveCategory(string correo, string password)
        {
            //Create PROC [dbo].usp_AutenticarUsuario 
            //@Usuario VARCHAR(50),
            //@Contrasena VARCHAR(50)
            //AS
            //    SET NOCOUNT ON 
            //    SET XACT_ABORT ON  

            //    BEGIN TRAN

            //    SELECT  [Usuario] ,
            //            [Nombre] ,
            //            [IdUsuario]
            //    FROM    [dbo].[usuarios]
            //    WHERE   ( [Usuario] = @Usuario
            //              AND [Contrasena] = @Contrasena
            //            ) 

            //    COMMIT
            try
            {
                string connectionString = ConfigurationManager.AppSettings["ConnectionString"];
                ConnectionManager myConnection = new ConnectionManager(connectionString);
                SqlConnection conexion = myConnection.CreateConnection();
                SqlCommand command = myConnection.createCommand(conexion);
                SqlDataReader userReader;

                command.CommandText = "usp_AutenticarUsuario";
                command.CommandType = CommandType.StoredProcedure;
                var parameter = new SqlParameter("@Usuario", SqlDbType.VarChar) { Value = correo };
                command.Parameters.Add(parameter);
                var parameter2 = new SqlParameter("@Contrasena", SqlDbType.VarChar) { Value = password };
                command.Parameters.Add(parameter2);
                conexion.Open();
                userReader = command.ExecuteReader();
                UserBE usuario = new UserBE();
                while (userReader.Read())
                {
                    usuario.Nombre = userReader["Nombre"].ToString();
                    usuario.Usuario = userReader["Usuario"].ToString();
                    usuario.IdUsuario = userReader["IdUsuario"].ToString();
                }
                conexion.Close();
                return usuario;
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);  
                throw;
            }
        }
    }
}
