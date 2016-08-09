using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Log4NetModule;
using MenuModule;
using SaleModule;

namespace UAMShop.user
{

    public partial class history : System.Web.UI.Page
    {
        public List<FacturaBe> ListCompras;
        private static Object _idUsuario;        
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
                ListCompras = new List<FacturaBe>();
                _idUsuario = Session["usuario_id"];                
                if (_idUsuario != null)
                {
                    var facturaDal = new FacturaDal();
                    string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                    ListCompras = facturaDal.ObtenerCompras(Convert.ToInt32(_idUsuario), connection);
                }
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
                Response.Redirect("~/informacion.aspx");
            }
        }
    }
}