using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Log4NetModule;

namespace MenuModule
{
    public class MenuDal
    {
        public List<MenuBe> RetrieveMenu(int idUsuario)
        {
            var listMenu = new List<MenuBe>();
            try
            {
                string connectionString = ConfigurationManager.AppSettings["ConnectionString"];
                var myConnection = new ConnectionManage.ConnectionManager(connectionString);
                SqlConnection conexion = myConnection.CreateConnection();
                SqlCommand command = myConnection.createCommand(conexion);                
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "usp_menuSelect";
                var parameter = new SqlParameter("IdUsuario", SqlDbType.BigInt) { Value = idUsuario };
                command.Parameters.Add(parameter);

                conexion.Open();
                SqlDataReader menuReader = command.ExecuteReader();

                while (menuReader.Read())
                {
                    var menu = new MenuBe
                    {
                        IdMenu = Int32.Parse(menuReader["IdMenu"].ToString()),
                        Menu = menuReader["Menu"].ToString(),
                        Pagina = menuReader["Pagina"].ToString(),
                        IdSubMenu = Int32.Parse(menuReader["IdSubMenu"].ToString()),
                        IdCategoria = Int32.Parse(menuReader["IdCategoria"].ToString())
                    };

                    listMenu.Add(menu);
                }

                conexion.Close();                
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
            }
            return listMenu;
        }

        public bool AccessToPage(int idUsuario, string namePage)
        {
            bool returnvalue = false;
            List<MenuBe> menuAccess = RetrieveMenu(idUsuario);

            var result = menuAccess.Where(a => a.Pagina.Contains(namePage)).ToList();
            if (result.Any())
                returnvalue = true;

            return returnvalue;
        }

    }
}
