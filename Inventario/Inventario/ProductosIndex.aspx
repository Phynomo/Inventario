<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductosIndex.aspx.cs" Inherits="Inventario.ProductosIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">





     <div class="container card">
        <div class="row card-header text-center">
            <div class="col">
                <h4><asp:Label Text="Productos" runat="server" /> </h4> 
            </div>
            <div class="col-3 d-flex flex-row-reverse">
                <button  type="button" class="btn btn-block btn-primary" runat="server" onserverclick="btnNuevo_ServerClick" id="btnNuevo">Nuevo</button>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <table id="example">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Categoria</th>
                                <th>Proveedor</th>
                                <th>Stock</th>
                                <th>Editar</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="Data_Alunmos" runat="server"></asp:PlaceHolder>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>






</asp:Content>
