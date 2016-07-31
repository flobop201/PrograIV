using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.IO;
using NotificationModule;
using ProductModule;

namespace EnviarCorreos
{
    class Test
    {
        static void Main(string[] args)
        {          
            var dal = new ProductDAL();            
            //SendMail.SendInvoice("FACT04501", "loboporras@gmail.com", "Francisco Lobo Porras", 165450, "37** **** 6310", dal.RetrieveProductsTop("data source=uam.database.windows.net;initial catalog=UAM;integrated security=false;persist security info=True;User ID=sistemas;Password=ABC123xyz"));
        }
    }
}
