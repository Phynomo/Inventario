<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientesIndex.aspx.cs" Inherits="Inventario.ClientesIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Button ID="btnNuevo" class="btn btn-block btn-primary" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
    
    <table id="example" class="table table-striped" style="width:100%"">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Ciudad</th>
                <th>Direccion</th>
                <th>Telefono</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <asp:PlaceHolder ID="Data_Alunmos" runat="server"></asp:PlaceHolder>
        </tbody>
    </table>


</asp:Content>
