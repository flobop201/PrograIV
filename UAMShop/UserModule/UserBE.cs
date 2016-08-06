using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UserModule
{
    public class UserBE
    {
        private string nombre;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        private string usuario;

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }
        private string idUsuario;

        public string IdUsuario
        {
            get { return idUsuario; }
            set { idUsuario = value; }
        }

        private string idRol;

        public string IdRol
        {
            get { return idRol; }
            set { idRol = value; }
        }

        private string estado;

        public string Estado
        {
            get { return estado; }
            set { estado = value; }
        }

        private DateTime fechaSuscripcion;

        public DateTime FechaSuscripcion
        {
            get { return fechaSuscripcion; }
            set { fechaSuscripcion = value; }
        }
    }
}
