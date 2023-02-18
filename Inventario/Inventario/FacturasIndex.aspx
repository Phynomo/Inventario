<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FacturasIndex.aspx.cs" Inherits="Inventario.FacturasIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container card">
        <div class="row card-header text-center">
            <div class="col">
                <h4><asp:Label Text="Facturas" runat="server" /> </h4> 
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
                                <th>Cliente</th>
                                <th>Empleado</th>
                                <th>Metodo de pago</th>
                                <th>Fecha</th>
                                <th>Detalles</th>
                                <th>Editar</th>
                                <th>Borrar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="Datos_Facturas" runat="server"></asp:PlaceHolder>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
