<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpleadosIndex.aspx.cs" Inherits="Inventario.EmpleadosIndex" %>
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
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Edad</th>
                                <th>Sexo</th>
                                <th>Cargo</th>
                                <th>Fecha Contratacion</th>
                                <th>Ciudad</th>
                                <th>Direccion Exacta</th>
                                <th>Estado Civil</th>
                                <th>Telefono</th>
                                <th>Correo</th>
                                <th>Editar</th>
                                <th>Borrar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="Datos_Empleados" runat="server"></asp:PlaceHolder>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
