using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductModule
{
    public class ProductBE
    {
        private string codigo;

        public string Codigo
        {
            get { return codigo; }
            set { codigo = value; }
        }
        private string producto;

        public string Producto
        {
            get { return producto; }
            set { producto = value; }
        }
        private int existencia;

        public int Existencia
        {
            get { return existencia; }
            set { existencia = value; }
        }
        private double precio;

        public double Precio
        {
            get { return precio; }
            set { precio = value; }
        }
        private int idCategoria;

        public int IdCategoria
        {
            get { return idCategoria; }
            set { idCategoria = value; }
        }
        private string imagen;

        public string Imagen
        {
            get { return imagen; }
            set { imagen = value; }
        }


    }
}
