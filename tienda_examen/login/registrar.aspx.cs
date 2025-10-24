using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace tienda_examen.login
{
    public partial class registrar : System.Web.UI.Page
    {
        MySqlConnection c;
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            c = new MySqlConnection(connectionString);
        }

        protected void btncrearusuario_Click(object sender, EventArgs e)
        {
            try
            {
                if (c.State != System.Data.ConnectionState.Open)
                    c.Open();

                string sqlUsuario = @"
                    INSERT INTO usuario(nombre, apellido_p, apellido_m, telefono, documento, correo, clave)
                    VALUES(@nombre, @apellido, @telefono, @documento, @correo, @clave);
                    SELECT LAST_INSERT_ID();";

                MySqlCommand cmdUsuario = new MySqlCommand(sqlUsuario, c);
                cmdUsuario.Parameters.AddWithValue("@nombre", txtnombre.Text);
                cmdUsuario.Parameters.AddWithValue("@apellido_p", txtapellido_p.Text);
                cmdUsuario.Parameters.AddWithValue("@apellido_m", txtapellido_m.Text);
                cmdUsuario.Parameters.AddWithValue("@telefono", txttelefono.Text);
                cmdUsuario.Parameters.AddWithValue("@documento", txtdocumento.Text);
                cmdUsuario.Parameters.AddWithValue("@correo", txtcorreo.Text);
                cmdUsuario.Parameters.AddWithValue("@clave", txtclave.Text);

                int idusuario = Convert.ToInt32(cmdUsuario.ExecuteScalar());

                string sqlCliente = "INSERT INTO cliente(idusuario) VALUES(@idusuario)";

                MySqlCommand cmdCliente = new MySqlCommand(sqlCliente, c);
                cmdCliente.Parameters.AddWithValue("@idusuario", idusuario);
                cmdCliente.ExecuteNonQuery();

                MostrarAlerta("Éxito", "Cuenta creada exitosamente.", "success");
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error", $"Ocurrió un error: {ex.Message}", "error");
                return;
            }
            finally
            {
                if (c.State == System.Data.ConnectionState.Open)
                    c.Close();
            }

            Response.Redirect("login.aspx?id=formulario");
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