<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProveedoresIndex.aspx.cs" Inherits="Inventario.ProveedoresIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">




    <div class="container card">
        <div class="row card-header text-center">
            <div class="col">
                <h4><asp:Label Text="Proveedores" runat="server" /> </h4> 
            </div>
            <div class="col-3 d-flex flex-row-reverse">
                <asp:Button ID="btnNuevo" class="btn btn-block btn-primary" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <table id="example" class="table table-striped" >
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Ciudad</th>
                                <th>Direccion</th>
                                <th>Telefono</th>
                                <th>Email</th>
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
