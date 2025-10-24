using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data.SqlClient;

namespace tienda_examen.login
{
    public partial class login : System.Web.UI.Page
    {
        MySqlConnection c;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            MySqlConnection c = new MySqlConnection(connectionString);
            try
            {
                string correo = txtcorreo.Text.Trim();
                string clave = txtclave.Text.Trim();

                c.Open();

                string sql = @"
                    SELECT 
                        u.idusuario,
                        u.nombre,
                        c.idcliente,
                        e.idempleado
                    FROM usuario u
                    LEFT JOIN cliente c ON c.idusuario = u.idusuario
                    LEFT JOIN empleado e ON e.idusuario = u.idusuario
                    WHERE u.correo = @correo 
                    AND u.clave = @clave 
                    AND u.estado = 1"
                ;

                MySqlCommand cmd = new MySqlCommand(sql, c);
                cmd.Parameters.AddWithValue("@correo", correo);
                cmd.Parameters.AddWithValue("@clave", clave);

                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        Session["nombre_usuario"] = reader["nombre"].ToString();
                        bool isCliente = !reader.IsDBNull(reader.GetOrdinal("idcliente"));
                        bool isEmpleado = !reader.IsDBNull(reader.GetOrdinal("idempleado"));

                        
                        if (isCliente)
                        {
                            Session["idcliente"] = reader["idcliente"].ToString();
                            LimpiarSesionesEmpleado();
                            Response.Redirect("~/index.aspx");
                        }
                        else if (isEmpleado)
                        {
                            Session["idempleado"] = reader["idempleado"].ToString();
                            LimpiarSesionesCliente();
                            Response.Redirect("~/Default.aspx");
                        }
                        else
                        {
                            MostrarAlerta("Información", "No tienes un rol asignado.", "info");
                        }
                    }
                    else
                    {
                        MostrarAlerta("Error", "Credenciales incorrectas.", "error");
                    }
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", $"Ocurrió un error: {ex.Message}", "error");
            }
            finally
            {
                if (c.State == ConnectionState.Open) c.Close();
            }
        }

        private void LimpiarSesionesCliente()
        {
            Session.Remove("idcliente");
        }

        private void LimpiarSesionesEmpleado()
        {
            Session.Remove("idempleado");
            Session.Remove("idrol");
        }

        protected void btnRolCliente_Click(object sender, EventArgs e)
        {
            LimpiarSesionesEmpleado();
            Response.Redirect("~/index.aspx");
        }

        protected void btnRolEmpleado_Click(object sender, EventArgs e)
        {
            LimpiarSesionesCliente();
            Response.Redirect("~/Default.aspx");
        }

        private void MostrarAlerta(string titulo, string mensaje, string tipo)
        {
            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "SweetAlert",
                $"Swal.fire('{titulo}', '{mensaje.Replace("'", "\\'")}', '{tipo}');",
                true
            );
        }
    }
}