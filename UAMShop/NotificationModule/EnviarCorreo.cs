using System;
using System.IO;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;

namespace NotificationModule
{
    public static class EnviarCorreo
    {
        public static bool EnviarFactura(String NumeroFactura,String Destinatario, String NombreDestinatario, String HtmlDetalleFactura)
        {
            try
            {
                Correos Cr = new Correos();
                MailMessage correo = new MailMessage();

                correo.Subject = "Factura de Compra #"+NumeroFactura;
                correo.To.Add(new MailAddress(Destinatario));
                correo.From = new MailAddress("uamshopcr@gmail.com", "UAM SHOP");

                //mnsj.Attachments.Add(new Attachment("D:\\ArchivoAdjunto#2.txt"));
                correo.IsBodyHtml = true;

                string htmlmensaje = "<h3>Estimado " + NombreDestinatario + ":</h3>"
                                     + "<br>Es un gusto enviarle la factura de su compra realizada recientemente"
                                     + "<br><br>Le recordamos que puede ver su historial de compras en www.uamshopcr.com, lo esperamos próximamente en la sucursal electronica."
                                     + "<br><br>Gracias por recibir su factura de compra, de esta forma cuidamos el medio ambiente al reducir el uso de papel y energía."
                                     + "<br><br>Le agradecemos no contestar este correo,  esta dirección de correo electrónico únicamente envía facturas de compra. Favor remitir sus consultas a uamshopcr@gmail.com o comuníquese al teléfono (506) 8302-1353";

                string ruta = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Remove(0, 6) + @"\Imagenes\banneruam.PNG";
                ruta = ruta.Replace("\\bin\\Debug", "");
                LinkedResource imagen = new LinkedResource(ruta, MediaTypeNames.Image.Jpeg);
                imagen.ContentId = "imagen";

                htmlmensaje += HtmlDetalleFactura;
                htmlmensaje += "<div align=\"center\"> <img src='cid:imagen' />  </div> ";

                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(htmlmensaje, Encoding.UTF8, MediaTypeNames.Text.Html);

                htmlView.LinkedResources.Add(imagen);
                correo.AlternateViews.Add(htmlView);
                Cr.MandarCorreo(correo);

                Console.Write("El correo se ha enviado correctamente");
                return true;
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
                return false;
            }
        }
    }
}

