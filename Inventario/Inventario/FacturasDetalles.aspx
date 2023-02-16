<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FacturasDetalles.aspx.cs" Inherits="Inventario.FacturasDetalles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container card">
        <div class="row card-header text-center">
            <div class="col">
                <h4><asp:Label Text="Facturas" runat="server" /> </h4> 
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <asp:Label ID="lblIdFeactura" runat="server" Text="N de Factura"></asp:Label>
                    <asp:TextBox ID="txtFacturaId" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>
                <div class="col">
                    <asp:Label ID="lblFechaFactura" runat="server" Text="Facturado el"></asp:Label>
                    <asp:TextBox ID="txtFechaFactura" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <asp:Label ID="lblCliente" runat="server" Text="Cliente"></asp:Label>
                    <asp:TextBox ID="txtCliente" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>
                <div class="col">
                    <asp:Label ID="lblMetodoPago" runat="server" Text="Metodo de pago"></asp:Label>
                    <asp:TextBox ID="txtMetodo" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>
                <div class="col">
                    <asp:Label ID="lblEmpleado" runat="server" Text="Atendido por"></asp:Label>
                    <asp:TextBox ID="txtEmpleado" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
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
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="Datos_FacturaDetalles" runat="server"></asp:PlaceHolder>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row ">
                <div class="col d-flex justify-content-end">
                    <asp:Label ID="lblSubtotal" runat="server" Text="Subtotal:"></asp:Label>
                </div>
                <div class="col-1 d-flex justify-content-end">
                    <asp:Label ID="txtSubTotal" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-1 d-flex justify-content-end">
                </div>
            </div>
            <div class="row">
                <div class="col d-flex justify-content-end">
                    <asp:Label ID="lblIva" runat="server" Text="Impuestos:"></asp:Label>
                </div>
                <div class="col-1 d-flex justify-content-end">
                    <asp:Label ID="txtIva" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-1 d-flex justify-content-end">
                </div>
            </div>
            <div class="row">
                <div class="col d-flex justify-content-end">
                    <asp:Label ID="lblTotal" runat="server" Text="Total:"></asp:Label>
                </div>
                <div class="col-1 d-flex justify-content-end">
                    <asp:Label ID="txtTotal" runat="server" Text=""></asp:Label>
                </div>
                <div class="col-1 d-flex justify-content-end">
                </div>
            </div>
        </div>
    </div>




</asp:Content>
