using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Tablero
    {
        public int IDTablero;
        public int IDUsuario;
        public string CodigoARS;
        public string LinkSharepoint;
        public string NombreTablero;
        public DateTime FechaCreacion;

        public Autenticacion Creador;

        public List<Autenticacion> ListInvitados;
    }
}
