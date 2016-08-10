using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Log4NetModule;
using MenuModule;
using ProductModule;
using System.Web.Configuration;
using SaleModule;
using UAMShop.MasterPages;

namespace UAMShop.category
{
    public partial class category : System.Web.UI.Page
    {
        public List<ProductBE> ListProducts;
        public int IdCategoria;
        public string Busqueda;
        private static object _user;

        protected void Page_Load(object sender, EventArgs e)
        {
            #region Validar acceso a la pagina
            try
            {
                //Se obtiene el usuario si esta logueado
                var usuario = Session["usuario_id"];
                //Se obtiene la pagina que esta intentando ingresar el usuario
                string pagina = Path.GetFileName(Request.Path);
                //Instanciamos el dal para acceder el metodo
                var menuDal = new MenuDal();
                //Accedemos el metodo de validar si se tiene acceso a la pagina
                if (!menuDal.AccessToPage(Convert.ToInt32(usuario), pagina))
                {
                    Page.Response.Redirect("~/login.aspx?logout=true", false);
                }
            }
            catch (Exception exception)
            {
                Log4NetModule.Log4Net.WriteLog(exception, Log4NetModule.Log4Net.LogType.Error);
            }
            #endregion

            try
            {
                _user = Session["usuario_id"];
                IdCategoria = Convert.ToInt16(Request["id"]);
                Busqueda = Request["search"];
                var productDal = new ProductDAL();
                string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                ListProducts = productDal.RetrieveProducts(connection, IdCategoria, Busqueda);
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
                Response.Redirect("~/informacion.aspx");
            }
        }

        [WebMethod]
        public static string AgregarCarrito(Int32 codigo, Int32 cantidad)
        {
            string mensaje = string.Empty;
            try
            {
                if (_user != null)
                {
                    int idUsuario = Convert.ToInt32(_user);

                    var carritoDal = new CarritoDal();
                    string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                    var resultado = carritoDal.AgregarItem(connection, idUsuario, codigo, cantidad);

                    switch (resultado)
                    {
                        case true:
                            mensaje = string.Format("Producto agregado al carrito de compras.");
                            break;
                        case false:
                            mensaje = string.Format("El producto no ha sido agregado al carrito de compras.");
                            break;
                    }
                    return mensaje;
                }
                else
                {
                    mensaje = "Por favor inicie session...";
                }

            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
            }
            return mensaje;
        }
    }
}