<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CargosIndex.aspx.cs" Inherits="Inventario.CargosIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


     <div class="container card">
        <div class="row card-header text-center">
            <div class="col">
                <h4><asp:Label Text="Usuarios" runat="server" /> </h4> 
            </div>
            <div class="col d-flex flex-row-reverse">
               <button  type="button" class="btn btn-primary" id="btnNuevo" onclick="ModalGuardar()">Nuevo</button>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Descripcion</th>
                                <th>Editar</th>
                                <th>Borrar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="Datos_Cargos" runat="server"></asp:PlaceHolder>
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
              <h5 class="modal-title">Ingresar Cargo</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col">
                        <asp:Label CssClass="" ID="lblCargo" runat="server" Text="Cargo"></asp:Label>
                        <asp:Label CssClass="" ID="lblCargoGuardarAste" ForeColor="Red" runat="server" Text="*"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtCargoGuardar" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                        <asp:Button CssClass="btn btn-primary" ID="btnGuardar" OnClick="btnGuardar_Click" runat="server" Text="Guardar registro" />
                        <button type="button" class="btn btn-secondary" runat="server" id="btnCerrarG" onserverclick="btnCancelar_ServerClick" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>


    <div class="modal" id="mdlEditar" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Editar Cargo</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col">
                        <asp:Label CssClass="" ID="lblCargoEditar" runat="server" Text="Cargo"></asp:Label>
                        <asp:Label CssClass="" ID="lblCargoEditarAste" ForeColor="Red" runat="server" Text="*"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtCargoEditar" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                        <asp:Button CssClass="btn btn-primary" ID="btnEditar" OnClick="btnEditar_Click" runat="server" Text="Guardar registro" />
                        <button type="button" class="btn btn-secondary" runat="server" id="btnCancelarEditar" onserverclick="btnCancelar_ServerClick" data-dismiss="modal">Close</button>
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
