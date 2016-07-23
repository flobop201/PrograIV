using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MenuModule
{
    public class MenuDal
    {
        public List<MenuBe> RetrieveMenu()
        {
            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];
            var myConnection = new ConnectionManage.ConnectionManager(connectionString);
            SqlConnection conexion = myConnection.CreateConnection();
            SqlCommand command = myConnection.createCommand(conexion);

            var listMenu = new List<MenuBe>();

            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "usp_menuSelect";

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
            return listMenu;
        }


        public string RetieveMenuToPage()
        {
            string menuaspx = string.Empty + "<ul>";
            var menuDal = new MenuDal();
            List<MenuBe> listMenu = menuDal.RetrieveMenu();
            foreach (var menu in listMenu)
            {
                if (menu.IdSubMenu == 0)
                {
                    List<MenuBe> submenus = listMenu.Where(a => a.IdSubMenu == menu.IdMenu).ToList();

                    menuaspx += ("<li> <a href=\"" + menu.Pagina + "\"> " + menu.Menu);
                    if (submenus.Any())
                    {
                        menuaspx += ("<ul>");
                    }
                    foreach (var submenu in submenus)
                    {
                        menuaspx += ("<li> <a href=\"" + submenu.Pagina + "\"> " + submenu.Menu + " </li>");
                    }
                    if (submenus.Any())
                    {
                        menuaspx += ("</ul>");
                    }
                    menuaspx += " </li>";
                }
            }
            return (menuaspx + " </ul>");
        }
    }
}
