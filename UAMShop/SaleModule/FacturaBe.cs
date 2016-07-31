using System;

namespace SaleModule
{
    public class FacturaBe
    {
        public Int32 IdFactura { get; set; }
        public Int32 IdUsuario { get; set; }
        public DateTime Fecha { get; set; }
        public Double Monto { get; set; }
        public String Tarjeta { get; set; }
        public String Titular { get; set; }
    }
}
