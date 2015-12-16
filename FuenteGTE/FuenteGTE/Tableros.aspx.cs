using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Negocio;
using Entidades;


namespace FuenteGTE
{
    public partial class Tableros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string CrearTablero(Tablero tablero)
        {
            tablero.IDUsuario = 1;;
            TableroNeg.crearTablero(tablero);
            return "ok";
        }

        [WebMethod]
        public static List<Tablero> ObtenerMisTableros(int idUsuario)
        {
            return TableroNeg.ObtenerMisTableros(idUsuario);
        }

        [WebMethod]
        public static List<Tablero> ObtenerMisTablerosComoInvitado(int idUsuario)
        {
            return TableroNeg.ObtenerMisTablerosComoInvitado(idUsuario);
        }

    }
}