using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;

namespace Negocio
{
    public class Conexion
    {

        public static string BD_GTE = "server=200.14.166.186;database=GTE;User ID=usu_sod;Password=usu_sod;"; // System.Configuration.ConfigurationManager.AppSettings["BDGTE"];
                
        public static SqlConnection Conectar(string conString)
        {
            try
            {
                SqlConnection cn = new SqlConnection(conString);
                return cn;
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Error al conectar", ex);
            }

        }

    }
}
