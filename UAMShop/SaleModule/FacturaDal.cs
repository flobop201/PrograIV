using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using ConnectionManage;
using Log4NetModule;
using NotificationModule;

namespace SaleModule
{
    public class FacturaDal
    {
        public string GenerarFactura(Int32 usuario, String tarjeta, String titular, String emailTo, String emailNameTo, string connectionString)
        {
            var firstOrDefault = string.Empty;
            string resultado = string.Empty;
            try
            {
                var execute = GuardarFactura(usuario, tarjeta, titular, connectionString);

                object orDefault = execute.FirstOrDefault();
                resultado = execute[1].ToString();
                if (orDefault != null) firstOrDefault = orDefault.ToString();
                if (Int32.Parse(firstOrDefault) != -1)
                {
                    var factura = (FacturaBe)(execute[2]);
                    var listFacturaDetalle = (List<FacturaDetalleBe>)(execute[3]);
                    SendMail.SendInvoice(factura.IdFactura.ToString(CultureInfo.InvariantCulture), emailTo, emailNameTo, factura.Monto, factura.Titular, factura.Tarjeta, GenerarTablaHtml(listFacturaDetalle));
                }
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
            }
            return resultado;
        }

        private List<Object> GuardarFactura(Int32 idUsuario, String tarjeta, String titular, string connectionString)
        {
            var mensajeResultado = string.Empty;
            var codigoResultado = string.Empty;
            var factura = new FacturaBe();
            var listFacturaDetalleBe = new List<FacturaDetalleBe>();
            var resultado = new List<Object>();

            var myConnection = new ConnectionManager(connectionString);
            var conexion = myConnection.CreateConnection();
            var command = myConnection.createCommand(conexion);

            command.CommandText = "usp_FacturaInsert";
            command.CommandType = CommandType.StoredProcedure;

            var pIdUsuario = new SqlParameter("@IdUsuario", SqlDbType.Int) { Value = idUsuario };
            command.Parameters.Add(pIdUsuario);

            var pTarjeta = new SqlParameter("@Tarjeta", SqlDbType.VarChar) { Value = tarjeta };
            command.Parameters.Add(pTarjeta);

            var pTitular = new SqlParameter("@Titular", SqlDbType.VarChar) { Value = titular };
            command.Parameters.Add(pTitular);

            conexion.Open();
            SqlDataReader invoiceReader = command.ExecuteReader();
            if (invoiceReader.HasRows)
            {
                if (invoiceReader.Read())
                {
                    mensajeResultado = invoiceReader["Mensaje"].ToString();
                    codigoResultado = invoiceReader["Resultado"].ToString();
                }
                invoiceReader.NextResult();
                if (invoiceReader.Read())
                {
                    factura = new FacturaBe
                    {
                        IdFactura = Int32.Parse(invoiceReader["IdFactura"].ToString()),
                        IdUsuario = Int32.Parse(invoiceReader["IdUsuario"].ToString()),
                        Fecha = DateTime.Parse(invoiceReader["Fecha"].ToString()),
                        Monto = Double.Parse(invoiceReader["Monto"].ToString()),
                        Tarjeta = invoiceReader["Tarjeta"].ToString(),
                        Titular = (invoiceReader["Titular"].ToString())
                    };
                }
                invoiceReader.NextResult();
                while (invoiceReader.Read())
                {
                    var facturadetalle = new FacturaDetalleBe()
                    {
                        IdFacturaDetalle = Int32.Parse(invoiceReader["IdFacturaDetalle"].ToString()),
                        IdFactura = Int32.Parse(invoiceReader["IdFactura"].ToString()),
                        Codigo = Int32.Parse(invoiceReader["Codigo"].ToString()),
                        Descripcion = invoiceReader["Descripcion"].ToString(),
                        Precio = Double.Parse(invoiceReader["Precio"].ToString()),
                        Cantidad = Int32.Parse(invoiceReader["Cantidad"].ToString()),
                        Imagen = invoiceReader["Imagen"].ToString()
                    };
                    listFacturaDetalleBe.Add(facturadetalle);
                }
            }
            conexion.Close();

            resultado.Add(codigoResultado);
            resultado.Add(mensajeResultado);
            resultado.Add(factura);
            resultado.Add(listFacturaDetalleBe);
            return resultado;
        }

        private string GenerarTablaHtml(List<FacturaDetalleBe> list)
        {
            string tablahtml = string.Empty;
            const string htmlTableStart = "<table style=\" text-align:center; width:100%\" cellpadding=\"0\" align=\"center\" cellspacing=\"0\" >";
            const string htmlTableEnd = "</table> ";
            const string htmlHeaderRowStart = "<tr>";
            const string htmlHeaderRowEnd = "</tr>";
            const string htmlTrStart = "<tr>";
            const string htmlTrEnd = "</tr>";
            const string htmlTdStart = "<td style=\" border-style:solid; border-width:thin; padding: 5px;\">";
            const string htmlTdEnd = "</td>";

            if (list.Any())
            {

                tablahtml += htmlTableStart;
                tablahtml += htmlHeaderRowStart;
                //tablahtml += htmlTdStart + "Imagen " + htmlTdEnd;
                tablahtml += htmlTdStart + "Codigo " + htmlTdEnd;
                tablahtml += htmlTdStart + "Descripcion " + htmlTdEnd;
                tablahtml += htmlTdStart + "Precio " + htmlTdEnd;
                tablahtml += htmlTdStart + "Cantidad " + htmlTdEnd;
                tablahtml += htmlTdStart + "SubTotal " + htmlTdEnd;
                tablahtml += htmlHeaderRowEnd;

                foreach (var producto in list)
                {
                    tablahtml = tablahtml + htmlTrStart;
                    //tablahtml = tablahtml + htmlTdStart + producto.Imagen + htmlTdEnd;
                    tablahtml = tablahtml + htmlTdStart + producto.Codigo + htmlTdEnd;
                    tablahtml = tablahtml + htmlTdStart + producto.Descripcion + htmlTdEnd;
                    tablahtml = tablahtml + htmlTdStart + String.Format("{0:C}", producto.Precio) + htmlTdEnd;
                    tablahtml = tablahtml + htmlTdStart + Convert.ToString(producto.Cantidad) + htmlTdEnd;
                    tablahtml = tablahtml + htmlTdStart +
                                  string.Format("{0:C}", producto.Cantidad * producto.Precio) + htmlTdEnd;
                    tablahtml = tablahtml + htmlTrEnd;
                }
                tablahtml = tablahtml + htmlTableEnd;
            }
            return tablahtml;
        }
    }
}