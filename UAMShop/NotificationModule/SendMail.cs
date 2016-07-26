using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using Log4NetModule;
using ProductModule;

namespace NotificationModule
{
    public static class SendMail
    {

        public static bool SendInvoice(String idInvoice, String to, String nameTo, Double amount, String creditCard, List<ProductBE> listProducts)
        {
            const string htmlTableStart = "<table style=\" text-align:center; width:100%\" cellpadding=\"0\" align=\"center\" cellspacing=\"0\" >";
            const string htmlTableEnd = "</table> ";
            const string htmlHeaderRowStart = "<tr>";
            const string htmlHeaderRowEnd = "</tr>";
            const string htmlTrStart = "<tr>";
            const string htmlTrEnd = "</tr>";
            const string linea = "<hr noshade=\"noshade\" width=\"100%\"/>";
            const string htmlTdStart = "<td style=\" border-style:solid; border-width:thin; padding: 5px;\">";
            const string htmlTdEnd = "</td>";

            try
            {
                var mail = new Mail();
                var mailMessage = new MailMessage { Subject = "Factura de Compra #" + idInvoice };

                mailMessage.To.Add(new MailAddress(to));
                mailMessage.From = new MailAddress("uamshopcr@gmail.com", "UAM SHOP");
                mailMessage.IsBodyHtml = true;

                string htmlmessage = "<h3>Estimado " + nameTo + ":</h3>"
                                     + "<br>Es un gusto enviarle la factura de su compra realizada recientemente"
                                     + "<br><br>Le recordamos que puede ver su historial de compras en www.uamshopcr.com, lo esperamos próximamente en la sucursal electronica."
                                     + "<br><br>Gracias por recibir su factura de compra, de esta forma cuidamos el medio ambiente al reducir el uso de papel y energía."
                                     + "<br><br>Le agradecemos no contestar este correo,  esta dirección de correo electrónico únicamente envía facturas de compra. Favor remitir sus consultas a uamshopcr@gmail.com o comuníquese al teléfono (506) 8302-1353";

                var directoryName = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase);
                if (directoryName != null)
                {
                    string ruta = directoryName.Remove(0, 6) + @"\img\banneruam.PNG";
                    ruta = ruta.Replace("\\bin\\Debug", "");
                    var imagen = new LinkedResource(ruta, MediaTypeNames.Image.Jpeg) { ContentId = "imagen" };

                    htmlmessage += "<h2 style=\"color:white;width:100%;background-color:#DF0101\">UAM Shop | Factura de Compra</h2>"
                                   + "<ul><li><strong>Detalle de Compra.</strong><br>"
                                   + "<table style=\"width:100%\">"
                                   + " <tr>"
                                   + "    <td>Tarjeta de Crédito:</td>"
                                   + "    <td>" + creditCard + "</td>"
                                   + "  </tr>"
                                   + "  <tr>"
                                   + "    <td>Nombre Titular:</td>"
                                   + "    <td>" + nameTo + "</td>"
                                   + "  </tr>"
                                   + "  <tr>"
                                   + "    <td>Monto:</td>"
                                   + "    <td>" + String.Format("{0:C}", amount) + "</td>"
                                   + "  </tr>"
                                   + "</table> </li></ul>";

                    htmlmessage += "<ul><li><strong>Detalle de Artículos.<br></strong></li></ul>";


                    if (listProducts.Any())
                    {

                        htmlmessage += htmlTableStart;
                        htmlmessage += htmlHeaderRowStart;
                        htmlmessage += htmlTdStart + "Codigo " + htmlTdEnd;
                        htmlmessage += htmlTdStart + "Descripcion " + htmlTdEnd;
                        htmlmessage += htmlTdStart + "Precio " + htmlTdEnd;
                        htmlmessage += htmlTdStart + "Cantidad " + htmlTdEnd;
                        htmlmessage += htmlTdStart + "SubTotal " + htmlTdEnd;
                        htmlmessage += htmlHeaderRowEnd;

                        foreach (var producto in listProducts)
                        {
                            htmlmessage = htmlmessage + htmlTrStart;
                            htmlmessage = htmlmessage + htmlTdStart + producto.Codigo + htmlTdEnd;
                            htmlmessage = htmlmessage + htmlTdStart + producto.Producto + htmlTdEnd;
                            htmlmessage = htmlmessage + htmlTdStart + String.Format("{0:C}", producto.Precio) +
                                          htmlTdEnd;
                            htmlmessage = htmlmessage + htmlTdStart + Convert.ToString(producto.Existencia) + htmlTdEnd;
                            htmlmessage = htmlmessage + htmlTdStart +
                                          string.Format("{0:C}", producto.Existencia * producto.Precio) + htmlTdEnd;
                            htmlmessage = htmlmessage + htmlTrEnd;
                        }
                        htmlmessage = htmlmessage + htmlTableEnd;
                    }
                    htmlmessage += linea;
                    htmlmessage += "<div align=\"center\"> <img src='cid:imagen' />  </div> ";

                    AlternateView htmlView = AlternateView.CreateAlternateViewFromString(htmlmessage, Encoding.UTF8, MediaTypeNames.Text.Html);

                    htmlView.LinkedResources.Add(imagen);
                    mailMessage.AlternateViews.Add(htmlView);
                }
                mail.SendMail(mailMessage);

                Log4Net.WriteLog(string.Format("Estimado(a) {0} se le ha enviado a {1} la factura de compra {2} por un monto de {3}.", nameTo, to, idInvoice, string.Format("{0:C}", amount)), Log4Net.LogType.Info);
                return true;
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
                return false;
            }
        }
    }
}

