<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductosAdmin.aspx.cs" Inherits="Inventario.ProductosAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">




    
    <div class="container card text-center">
        <div class="row card-header text-center">
            <div class="col">
                <h4><asp:Label Text="Usuarios" runat="server" /> </h4> 
            </div>
        </div>
        <div class="card-body">
            <div class="row mt-2">
                <div class="col">
                            <label >Nombre</label><asp:Label ID="lblNombreAste" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            <input type="text" id="txtnombre" runat="server" class="form-control" >
                </div>
                <div class="col">
                            <label >Precio</label><asp:Label ID="lblPrecioAste" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            <input type="text" id="txtPrecio"  runat="server" class="form-control">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col">
                            <label >Categoria</label><asp:Label ID="lblCateriaAste" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            <asp:DropDownList ID="ddlCategoria" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <div class="col">
                            <label >Proveedores</label><asp:Label ID="lblProveedoresAste" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            <asp:DropDownList ID="ddlProveedores" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <div class="col">
                            <label >Stock</label><asp:Label ID="lblStockAste" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            <input type="text" id="txtStock"  runat="server" class="form-control">
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
