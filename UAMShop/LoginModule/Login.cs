using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LoginModule
{
    public class Login
    {
        public static IDictionary<string, string> Autenticar(string correo, string password)
        {
            var usuarioDatos = new Dictionary<string, string>();
            usuarioDatos["usuario_id"] = "1231321";
            usuarioDatos["usuario_nombre"] = "Clark";
            usuarioDatos["usuario_apellido1"] = "El";
            usuarioDatos["usuario_apellido2"] = "Kent";
            return usuarioDatos;
        }
    }
}
