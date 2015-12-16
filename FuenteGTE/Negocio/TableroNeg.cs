using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entidades;

namespace Negocio
{
    public class TableroNeg
    {
        public static bool crearTablero(Tablero tablero)
        {
            int ret = 0;
            using (SqlConnection con = Conexion.Conectar(Conexion.BD_GTE))
            {

                SqlCommand cmd = new SqlCommand("dbo.Agregar_Tablero", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IDUsuario", tablero.IDUsuario);
                cmd.Parameters.AddWithValue("@CodigoARS", tablero.CodigoARS);
                cmd.Parameters.AddWithValue("@LinkSharepoint", tablero.LinkSharepoint);
                cmd.Parameters.AddWithValue("@NombreTablero", tablero.NombreTablero);

                try
                {
                    con.Open();
                    ret = cmd.ExecuteNonQuery();                                      
                }
                catch (SqlException e)
                {
                    Console.WriteLine(e.Message);
                }
                finally
                {
                    con.Close();
                }



            }
            return true;
        }

        public static List<Tablero> ObtenerMisTableros(int id)
        {
            List<Tablero> lista = null;
            using (SqlConnection con = Conexion.Conectar(Conexion.BD_GTE))
            {

                SqlCommand cmd = new SqlCommand("dbo.Buscar_MisTableros", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IDUsuario", id);

                try
                {
                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        lista = new List<Tablero>();
                        Tablero tableObj = null;
                        while (reader.Read())
                        {
                            tableObj = new Tablero();
                            tableObj.IDTablero = Convert.ToInt32(reader[0] != null ? reader[0] : 0);
                            tableObj.IDUsuario = Convert.ToInt32(reader[1] != null ? reader[1] : 0);
                            tableObj.CodigoARS = Convert.ToString(reader[2] != null ? reader[2] : string.Empty);
                            tableObj.LinkSharepoint = Convert.ToString(reader[3] != null ? reader[3] : string.Empty);
                            tableObj.NombreTablero = Convert.ToString(reader[4] != null ? reader[4] : string.Empty);
                            tableObj.FechaCreacion = Convert.ToDateTime(reader[5] != null ? reader[5] : string.Empty);
                            lista.Add(tableObj);
                        }
                    }
                }
                catch (SqlException e)
                {
                    Console.WriteLine(e.Message);
                }
                finally
                {
                    con.Close();
                }

                return lista;
            }
        }

        public static List<Tablero> ObtenerMisTablerosComoInvitado(int id)
        {
            List<Tablero> lista = null;
            using (SqlConnection con = Conexion.Conectar(Conexion.BD_GTE))
            {

                SqlCommand cmd = new SqlCommand("dbo.Buscar_MisTablerosComoInvitado", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IDUsuario", id);

                try
                {
                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        lista = new List<Tablero>();
                        Tablero tableObj = null;
                        while (reader.Read())
                        {
                            tableObj = new Tablero();
                            tableObj.IDTablero = Convert.ToInt32(reader[0] != null ? reader[0] : 0);
                            tableObj.IDUsuario = Convert.ToInt32(reader[1] != null ? reader[1] : 0);
                            tableObj.CodigoARS = Convert.ToString(reader[2] != null ? reader[2] : string.Empty);
                            tableObj.LinkSharepoint = Convert.ToString(reader[3] != null ? reader[3] : string.Empty);
                            tableObj.NombreTablero = Convert.ToString(reader[4] != null ? reader[4] : string.Empty);
                            tableObj.FechaCreacion = Convert.ToDateTime(reader[5] != null ? reader[5] : string.Empty);
                            lista.Add(tableObj);
                        }
                    }
                }
                catch (SqlException e)
                {
                    Console.WriteLine(e.Message);
                }
                finally
                {
                    con.Close();
                }

                return lista;
            }
        }

    }
}
