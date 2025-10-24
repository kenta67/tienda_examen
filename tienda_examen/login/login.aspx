
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="tienda_examen.login.login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login - SB Admin</title>
    <link href='<%= ResolveUrl("~/Content/styles.css") %>' rel="stylesheet" />

    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>    <%-- link mensaje--%>



     <style>
         body {
           background-image: url('');
           background-size: cover;        
           background-position: center;   
           background-repeat: no-repeat; 
         }
     </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">


                                <asp:Panel ID="pnlLogin" runat="server" CssClass="card shadow-lg border-0 rounded-lg mt-5" Visible="true">

                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">SESION STORE</h3></div>

                                    <div class="card-body">
                                        <div class="form-floating mb-3">                                          
                                            <asp:TextBox class="form-control" ID="txtcorreo" type="text" placeholder="name@example.com" runat="server" required=""></asp:TextBox>                                                   
                                            <label for="inputEmail">CORREO</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <asp:TextBox class="form-control" ID="txtclave" type="password" placeholder="name@example.com" runat="server" required=""></asp:TextBox>
                                            <label for="inputPassword">CONTRACEÑA</label>
                                        </div>
                                        <div class="form-check mb-3">
                                            <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                            <label class="form-check-label" for="inputRememberPassword">Recordar contaceña</label>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            <asp:HyperLink ID="lnkForgotPassword" runat="server" CssClass="small" NavigateUrl="recuperar.aspx">Olvidaste tu contraceña?</asp:HyperLink>
                                            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Iniciar sesion" OnClick="btnLogin_Click" />
                                        </div>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small">
                                            <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="registrar.aspx">No tienes una cuenta? Crea una!</asp:HyperLink>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="pnlSeleccionRol" runat="server" CssClass="card shadow-lg border-0 rounded-lg mt-5" Visible="false">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">SELECCIONE COMO QUIERE ACCEDER</h3></div>
                                    <div class="card-body text-center">
                                        <asp:Button ID="btnRolCliente" runat="server" 
                                            CssClass="btn btn-primary btn-lg" 
                                            Text="Acceder como Cliente" 
                                            OnClick="btnRolCliente_Click" />
                                            
                                        <asp:Button ID="btnRolEmpleado" runat="server" 
                                            CssClass="btn btn-secondary btn-lg" 
                                            Text="Acceder como Empleado" 
                                            OnClick="btnRolEmpleado_Click" />
                                    </div>
                                </asp:Panel>
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


