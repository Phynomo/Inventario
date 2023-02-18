<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProveedorAdmin.aspx.cs" Inherits="Inventario.ProveedorAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">




    <div class="container card text-center">
        <div class="row card-header text-center">
            <div class="col">
                <h4><asp:Label Text="Proveedor" runat="server" /> </h4> 
            </div>
        </div>
        <div class="card-body">
            <div class="row mt-2">
                <div class="col">
                            <label >Nombre</label><asp:Label ID="lblNombreAste" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            <input type="text" id="txtnombre" placeholder="Nombre" runat="server" class="form-control" >
                </div>
                <div class="col">
                            <label >Departamento</label><asp:Label ID="lblDepartamentoAste" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            <asp:DropDownList ID="ddlDepartamento" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlDepartamento_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <div class="col">
                            <label >Municipio</label><asp:Label ID="lblMunicipioAste" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            <asp:DropDownList ID="ddlMunicipio"  CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col">
                            <label >Dirección</label><asp:Label ID="lblDireccionAste" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            <input type="text" id="txtdireccion"  runat="server" class="form-control">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col">
                            <label >Telefono</label><asp:Label ID="lblTelefonoAste" runat="server" ForeColor="Red" Text="*"></asp:Label>
                              <input type="text" id="txtTelefono" runat="server" class="form-control">
                </div>
                <div class="col">
                            <label >Email</label><asp:Label ID="lblEmailAste" runat="server" ForeColor="Red" Text="*"></asp:Label>
                              <input type="text" id="txtEmail" runat="server" class="form-control">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                        <button id="btnEditar" onserverclick="btnEditar_ServerClick" runat="server" class="btn btn-primary"> Editar </button>
                        <button id="btnNuevo" onserverclick="btnNuevo_ServerClick" runat="server" class="btn btn-primary"> Nuevo </button>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
