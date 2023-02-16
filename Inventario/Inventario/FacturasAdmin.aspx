<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FacturasAdmin.aspx.cs" Inherits="Inventario.FacturasAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container card">
        <div class="row card-header text-center">
            <div class="col">
                <h4><asp:Label Text="Facturas" runat="server" /> </h4> 
            </div>
        </div>
        <div class="card-body">
            <div class="row text-center d-flex justify-content-center">
                <div class="col">
                    <asp:Label ID="lblClinte" runat="server" Text="Cliente"></asp:Label>
                    <asp:DropDownList ID="ddlCliente"  CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <div class="col">
                    <asp:Label ID="lblMetodoPago" runat="server" Text="Metodo de pago"></asp:Label>
                    <asp:DropDownList ID="ddlMetodoPago"  CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col">
                    <asp:Button ID="btnComenzar" runat="server"  CssClass="btn btn-block btn-success" OnClick="btnComenzar_Click" Text="Ingresar Productos" />
                </div>
            </div>
            <div class="row mt-4">
                <div class="col">
                    <asp:Label ID="lblProducto" runat="server" Text="Producto"></asp:Label>
                    <asp:DropDownList ID="ddlProducto"  CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <div class="col">
                    <asp:Label ID="lblCantidad" runat="server" Text="Cantidad"></asp:Label>
                    <asp:TextBox ID="txtCantidad" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row text-center mt-2">
                <div class="col">
                    <asp:Button ID="btnAgregarProducto" CssClass="btn btn-block btn-primary" OnClick="btnAgregarProducto_Click" runat="server" Text="Agregar" />
                </div>
            </div>

            <div class="row mt-3">
                <div class="col">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Proveedor</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Igual</th>
                                <th>Quitar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="Datos_Productos" runat="server"></asp:PlaceHolder>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row text-center mt-2">
                <div class="col">
                    <asp:Button ID="btnFinalizar" CssClass="btn btn-block btn-warning" runat="server" Text="FinalizarCompra" />
                </div>
            </div>

        </div>
    </div>



</asp:Content>
