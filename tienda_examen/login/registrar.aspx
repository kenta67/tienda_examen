<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrar.aspx.cs" Inherits="tienda_examen.login.registrar" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register - SB Admin</title>
        <link href='<%= ResolveUrl("~/Content/styles.css") %>' rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            body {
              background-image: url('/fondo/143788648_ede90800-3eb2-48d2-96f2-8cf04effd44c.jpg');
              background-size: cover;        
              background-position: center;   
              background-repeat: no-repeat; 
            }
        </style>
    </head>
    <body class="bg-primary">
        <form id="form2" runat="server">
            <div id="layoutAuthentication">
                <div id="layoutAuthentication_content">
                    <main>
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-7">
                                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                                        <div class="card-header"><h3 class="text-center font-weight-light my-4">CREAR CUENTA</h3></div>
                                        <div class="card-body">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">



                                                    <asp:TextBox class="form-control" ID="txtnombre" type="text" placeholder="name@example.com" runat="server" required=""></asp:TextBox>
        
                                                    <label for="inputFirstName">NOMBRE</label>
                                                </div>
                                            </div>
                                           




                                                <div class="row mb-3">
                                                    <div class="col-md-6">
                                                        <div class="form-floating mb-3 mb-md-0">



                                                            <asp:TextBox class="form-control" ID="txtapellido_p" type="text" placeholder="name@example.com" runat="server" required=""></asp:TextBox>
                                                            
                                                            <label for="inputFirstName">APELLIDO PATERNO</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-floating">


                                                            <asp:TextBox class="form-control" ID="txtapellido_m" type="text" placeholder="name@example.com" runat="server" required=""></asp:TextBox>
                                                            
                                                            <label for="inputLastName">APELLIDO MATERNO</label>
                                                        </div>
                                                    </div>
                                                </div>




                                                <div class="row mb-3">
                                                    <div class="col-md-6">
                                                        <div class="form-floating mb-3 mb-md-0">


                                                            <asp:TextBox class="form-control" ID="txttelefono" type="text" placeholder="name@example.com" runat="server" required=""></asp:TextBox>
                                                            
                                                            <label for="inputFirstName">TELEFONO</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-floating">


                                                            <asp:TextBox class="form-control" ID="txtdocumento" type="text" placeholder="name@example.com" runat="server" required=""></asp:TextBox>
                                                            
                                                            <label for="inputLastName">DOCUMENTO(NIT/CI)</label>
                                                        </div>
                                                    </div>
                                                </div>




                                                <div class="form-floating mb-3">


                                                    <asp:TextBox class="form-control" ID="txtcorreo" type="text" placeholder="name@example.com" runat="server" required=""></asp:TextBox>
                                                   
                                                    <label for="inputEmail">CORREO</label>
                                                </div>




                                                <div class="row mb-3">
                                                    <div class="col-md-6">
                                                        <div class="form-floating mb-3 mb-md-0">



                                                            <asp:TextBox class="form-control" ID="txtclave" type="password" placeholder="name@example.com" runat="server" required=""></asp:TextBox>
                                                            
                                                            <label for="inputPassword">CONTRACEÑA</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-floating mb-3 mb-md-0">


                                                            <asp:TextBox class="form-control" ID="Textno" type="password" placeholder="name@example.com" runat="server" required=""></asp:TextBox>

                                                            <label for="inputPassword">CONFIRMAR CONTRACEÑA</label>
                                                        </div>
                                                    </div>
                                                </div>



                                                <div class="mt-4 mb-0">

                                                    
                                                    

                                                    <asp:Button class="btn btn-primary btn-block" id="btncrearusuario" type="submit" runat="server" Text="CREAR CUENTA" OnClick="btncrearusuario_Click" />
                                                    


                                                </div>
                                          
                                        </div>
                                        <div class="card-footer text-center py-3">
                                            <div class="small"><a href="login.aspx">Tienes una cuenta ve? ve a iniciar sesion</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
           <script src='<%= ResolveUrl("~/Scripts/scripts.js") %>'></script>
        </form>
    </body>
</html>


