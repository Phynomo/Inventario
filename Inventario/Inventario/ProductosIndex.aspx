<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductosIndex.aspx.cs" Inherits="Inventario.ProductosIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row mt-3 d-flex justify-content-end">
         <div class="col-3">
           <button  type="button" class="btn btn-primary" runat="server" onserverclick="btnNuevo_ServerClick" id="btnNuevo">Nuevo</button>
         </div>
         </div>
     <table id="example" class="table table-striped" style="width:100%"">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Categoria</th>
                <th>Proveedor</th>
                <th>Stock</th>
            </tr>
        </thead>
        <tbody>
            <asp:PlaceHolder ID="Data_Alunmos" runat="server"></asp:PlaceHolder>
        </tbody>
    </table>



</asp:Content>
