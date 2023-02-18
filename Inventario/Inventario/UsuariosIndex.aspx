<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsuariosIndex.aspx.cs" Inherits="Inventario.UsuariosIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container card">
        <div class="row card-header text-center">
            <div class="col">
                <h4><asp:Label Text="Usuarios" runat="server" /> </h4> 
            </div>
            <div class="col-3 d-flex flex-row-reverse">
                <button  type="button" class="btn btn-block btn-primary" id="btnNuevo" runat="server" onserverclick="btnNuevo_ServerClick">Nuevo</button>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <table class="table" id="example">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Usuario</th>
                                <th>Empleado</th>
                                <th>Editar</th>
                                <th>Borrar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="Datos_Usuarios" runat="server"></asp:PlaceHolder>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>



    <div class="modal" id="mdlGuardar" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Ingresar Usuario</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col">
                        <asp:Label CssClass="" ID="lblUsuarioGuardar" runat="server" Text="Usuario"></asp:Label>
                        <asp:Label CssClass="" ID="lblUsuarioGuardarAste" ForeColor="Red" runat="server" Text="*"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtUsuarioGuardar" runat="server">Hola</asp:TextBox>
                    </div>
                    <div class="col">
                        <asp:Label CssClass="" ID="lblContraseniaGuardar" runat="server" Text="Contraseña"></asp:Label>
                        <asp:Label CssClass="" ID="lblContraseniaGuardarAste" ForeColor="Red" runat="server" Text="*"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtContraseniaGuardar" runat="server">Hola</asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label CssClass="" ID="lblEmpleadoGuardar" runat="server" Text="Empleado"></asp:Label>
                        <asp:Label CssClass="" ID="lblEmpleadoGuardarAste" ForeColor="Red" runat="server" Text="*"></asp:Label><br />
                        <asp:DropDownList CssClass="form-control" ID="ddlEmpleadoGuardar" runat="server"></asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                        <asp:Button CssClass="btn btn-primary" ID="btnGuardar" OnClick="btnGuardar_Click" runat="server" Text="Guardar registro" />
                        <button type="button" class="btn btn-secondary" runat="server" id="btnCerrarG" onserverclick="btnCancelar_ServerClick" data-dismiss="modal">Cerrar</button>
            </div>
          </div>
        </div>
      </div>


    <div class="modal" id="mdlEditar" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Editar Usuario</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col">
                        <asp:Label CssClass="" ID="lblContraseniaEditar" runat="server" Text="Contraseña"></asp:Label>
                        <asp:Label CssClass="" ID="lblContraseniaEditarAste" ForeColor="Red" runat="server" Text="*"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtContraseniaEditar" runat="server">Hola</asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label CssClass="" ID="lblEmpleadoEditar" runat="server" Text="Empleado"></asp:Label>
                        <asp:Label CssClass="" ID="lblEmpleadoEditarAste" ForeColor="Red" runat="server" Text="*"></asp:Label><br />
                        <asp:DropDownList CssClass="form-control" ID="ddlEmpleadoEditar" runat="server"></asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                        <asp:Button CssClass="btn btn-warning" ID="btnEditar" OnClick="btnEditar_Click" runat="server" Text="Guardar registro" />
                        <button type="button" class="btn btn-secondary" runat="server" id="btnCancelarEditar" onserverclick="btnCancelar_ServerClick" data-dismiss="modal">Cerrar</button>
            </div>
          </div>
        </div>
      </div>


     <script>
        function ModalGuardar() {
            //$('#mdlGuardar').modal('show');
            $('#mdlGuardar').modal({ backdrop: 'static', keyboard: false })
        }
        function ModalEditar() {
            //$('#mdlEditar').modal('show');
            $('#mdlEditar').modal({ backdrop: 'static', keyboard: false })
        }
     </script>


</asp:Content>
