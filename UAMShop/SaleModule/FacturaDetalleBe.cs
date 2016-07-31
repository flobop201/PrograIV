using System;

namespace SaleModule
{
    public class FacturaDetalleBe
    {
        public Int32 IdFacturaDetalle { get; set; }
        public Int32 IdFactura { get; set; }
        public Int32 Codigo { get; set; }
        public String Descripcion { get; set; }
        public Double Precio { get; set; }
        public Int32 Cantidad { get; set; }
        public String Imagen { get; set; }
    }
}
