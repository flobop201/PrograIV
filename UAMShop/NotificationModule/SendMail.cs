using System;
using System.IO;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using Log4NetModule;

namespace NotificationModule
{
    public static class SendMail
    {

        public static bool SendInvoice(String idInvoice, String to, String nameTo, Double amount, String titularTarjeta, String creditCard, String htmltable)
        {
            const string linea = "<hr noshade=\"noshade\" width=\"100%\"/>";

            try
            {
                var mail = new Mail();
                var mailMessage = new MailMessage { Subject = "Factura de Compra #" + idInvoice };

                mailMessage.To.Add(new MailAddress(to));
                mailMessage.From = new MailAddress("uamshopcr@gmail.com", "UAM SHOP");
                mailMessage.IsBodyHtml = true;

                string htmlmessage = "<h3>Estimado(a) " + nameTo + ":</h3>"
                                     + "<br>Es un gusto enviarle la factura de su compra realizada recientemente"
                                     + "<br><br>Le recordamos que puede ver su historial de compras en uamcr.azurewebsites.net, lo esperamos próximamente en la sucursal electronica."
                                     + "<br><br>Gracias por recibir su factura de compra, de esta forma cuidamos el medio ambiente al reducir el uso de papel y energía."
                                     + "<br><br>Le agradecemos no contestar este correo,  esta dirección de correo electrónico únicamente envía facturas de compra. Favor remitir sus consultas a uamshopcr@gmail.com o comuníquese al teléfono (506) 8302-1353";

                var directoryName = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase);
                if (directoryName != null)
                {
                    string ruta = directoryName.Remove(0, 6) + @"\img\banneruam.PNG";
                    ruta = ruta.Replace("\\bin", "");
                    LinkedResource imagen = null;
                    try
                    {
                         imagen = new LinkedResource(ruta, MediaTypeNames.Image.Jpeg) {ContentId = "imagen"};
                    }
                    catch (Exception)
                    {
                        string val="";
                    }
                    htmlmessage += "<h2 style=\"color:white;width:100%;background-color:#DF0101\">UAM Shop | Factura de Compra</h2>"
                                   + "<ul><li><strong>Detalle de Compra.</strong><br>"
                                   + "<table style=\"width:100%\">"
                                   + " <tr>"
                                   + "    <td>Tarjeta de Crédito:</td>"
                                   + "    <td>" + creditCard + "</td>"
                                   + "  </tr>"
                                   + "  <tr>"
                                   + "    <td>Nombre Titular:</td>"
                                   + "    <td>" + titularTarjeta.ToUpper() + "</td>"
                                   + "  </tr>"
                                   + "  <tr>"
                                   + "    <td>Monto:</td>"
                                   + "    <td>" + String.Format("{0:C}", amount) + "</td>"
                                   + "  </tr>"
                                   + "</table> </li></ul>";

                    htmlmessage += "<ul><li><strong>Detalle de Artículos.<br></strong></li></ul>";

                    htmlmessage += htmltable;

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

        public static bool SendUserNotification(String nombre, String correo)
        {
            try
            {
                var mail = new Mail();
                var mailMessage = new MailMessage { Subject = "Registro en UAM SHOP" };

                mailMessage.To.Add(new MailAddress(correo));
                mailMessage.From = new MailAddress("uamshopcr@gmail.com", "UAM SHOP");
                mailMessage.IsBodyHtml = true;

                string htmlmessage = "<h3>Estimado(a) " + nombre + ":</h3>"
                                     + "<br>Se ha registrado correctamente en UAM SHOP"
                                     + "<br><br>Le recordamos que puede realizar sus compras en uamcr.azurewebsites.net, lo esperamos próximamente en la sucursal electronica."
                                     + "<br><br>Agradecemos no contestar este correo,  esta dirección de correo electrónico únicamente envía codigos de registro. Favor remitir sus consultas a consultas@uamshopcr.com o comuníquese al teléfono (506) 8302-1353." +
                                     "<br><br>Si no ha realizado ningun registro por favor ignorar este mensaje.";
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(htmlmessage, Encoding.UTF8, MediaTypeNames.Text.Html);
                mailMessage.AlternateViews.Add(htmlView);
                mail.SendMail(mailMessage);

                Log4Net.WriteLog(string.Format("Estimado(a) {0} se le ha enviado a {1} un correo de registro}", nombre, correo), Log4Net.LogType.Info);
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

