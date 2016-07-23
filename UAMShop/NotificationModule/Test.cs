using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.IO;
using NotificationModule;

namespace EnviarCorreos
{
    class Test
    {
        static void Main(string[] args)
        {
            string html = "<div>                                                                                              "
  + "<table width=\"96%\" cellpadding=\"0\" align=\"center\" cellspacing=\"0\">                         "
  + "<tbody>                                                                                            "
  + "<tr>                                                                                               "
  + "<td height=\"10\"></td>                                                                            "
  + "</tr>                                                                                              "
  + "<tr>                                                                                               "
  + "<td>                                                                                               "
  + "<p></p>                                                                                            "
  + "<h2 style=\"color:white;width:100%;background-color:#DF0101\">UAM Shop | Factura de Compra</h2>"
  + "<p></p>                                                                                            "
  + "<br>                                                                                               "
  + "<strong>                                                                                           "
  + "<div align=\"center\">&nbsp; Detalle de Compra </div>                                 "
  + "</strong></td>                                                                                     "
  + "</tr>                                                                                              "
  + "<tr>                                                                                               "
  + "<td height=\"10\">                                                                                 "
  + "<hr noshade=\"\">                                                                                  "
  + "</td>                                                                                              "
  + "</tr>                                                                                              "
  + "<tr>                                                                                               "
  + "<td>                                                                                               "
  + "<table width=\"96%\" align=\"center\">                                                             "
  + "<tbody>                                                                                            "
  + "<tr>                                                                                               "
  + "<th>                                                                                               "
  + "<div align=\"left\">&nbsp;&nbsp;Tarjeta de Crédito&nbsp;&nbsp; </div>                              "
  + "</th>                                                                                              "
  + "</tr>                                                                                              "
  + "</tbody>                                                                                           "
  + "</table>                                                                                           "
  + "<table width=\"96%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">                         "
  + "<tbody>                                                                                            "
  + "<tr>                                                                                               "
  + "<td width=\"15%\">&nbsp;</td>                                                                      "
  + "<td width=\"23%\">                                                                                 "
  + "<div align=\"left\">&nbsp; Número: </div>                                                          "
  + "</td>                                                                                              "
  + "<td align=\"left\" width=\"58%\">&nbsp; 3770-45**-****-7063 </td>                                  "
  + "</tr>                                                                                              "
  + "<tr>                                                                                               "
  + "<td style=\"height:2\"></td>                                                                       "
  + "</tr>                                                                                              "
  + "<tr>                                                                                               "
  + "<td width=\"15%\">&nbsp;</td>                                                                      "
  + "<td width=\"23%\">                                                                                 "
  + "<div align=\"left\">&nbsp; Nombre: </div>                                                          "
  + "</td>                                                                                              "
  + "<td align=\"left\" width=\"58%\">&nbsp; GUILLERMO CHING </td>                         "
  + "</tr>                                                                                              "
  + "<tr>                                                                                               "
  + "<td style=\"height:2\"></td>                                                                       "
  + "</tr>                                                                                              "
  + "<tr>                                                                                               "
  + "<td width=\"15%\">&nbsp;</td>                                                                      "
  + "<td width=\"23%\">                                                                                 "
  + "<div align=\"left\">&nbsp; Monto del pago: </div>                                                  "
  + "</td>                                                                                              "
  + "<td align=\"left\" width=\"58%\">&nbsp; 154,645.78 CRC </td>                                       "
  + "</tr>                                                                                              "
  + "</tbody>                                                                                           "
  + "</table>                                                                                           "
  + "</td>                                                                                              "
  + "</tr>                                                                                              "
  + "<tr>                                                                                               "
  + "<td height=\"10\"></td>                                                                            "
  + "</tr>                                                                                              "
  + "<tr>                                                                                               "
  + "<td>                                                                                               "
  + "</table>                                                                                           "
  + "</td>                                                                                              "
  + "</tr>                                                                                              "
  + "<tr>                                                                                               "
  + "<td height=\"20\"></td>                                                                            "
  + "</tr>                                                                                              "
  + "<tr>                                                                                               "
  + "<td height=\"10\">                                                                                 "
  + "<hr noshade=\"\">                                                                                  "
  + "</td>                                                                                              "
  + "</tr>                                                                                              "
  + "</tbody>                                                                                           "
  + "</table><div class=\"yj6qo\"></div><div class=\"adL\">                                             "
  + "</div></div>"
  + "<br> Aqui ira el detalle de los articulos con las fotos  lo que se necesite";

            EnviarCorreo.EnviarFactura("FACT04501", "loboporras@gmail.com", "Francisco Lobo Porras", html);
        }
    }
}
