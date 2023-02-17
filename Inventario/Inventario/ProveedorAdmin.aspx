<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProveedorAdmin.aspx.cs" Inherits="Inventario.ProveedorAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card">
                    <div class="card-headerstyle" <%--style="background: #fccb90;
                     background: -webkit-linear-gradient(to right, #b2bd99, #d8363a, #dd3675, #b44593);
                    background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593)--%>;">
                     <h3 class="text-control">Proveedor</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">

                          <div class="col-sm-10">
                            <label >Nombre</label>
                            <input type="text" id="txtnombre" placeholder="Nombre" runat="server" class="text-control" >
                          </div>
                             <br />
                            <div class="col-sm-10">
                            <label >Departamento</label>
                            <asp:DropDownList ID="ddlDepartamento" runat="server"  OnSelectedIndexChanged="ddlDepartamento_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                          </div>
                            <br />
                            <div class="col-sm-10">
                            <label >Municipio</label>
                            <asp:DropDownList ID="ddlMunicipio" runat="server"></asp:DropDownList>
                          </div>
                             <br />
                          <div class="col-sm-10">
                            <label >Dirección</label>
                            <input type="text" id="txtdireccion"  runat="server" class="tex-control">
                          </div>
                             <br />
                          <div class="col-sm-10">
                            <label >Telefono</label>
                              <input type="text" id="txtTelefono" runat="server" class="tex-control">
                          </div>
                             <br />
                          <div class="col-sm-10">
                            <label >Email</label>
                              <input type="text" id="txtEmail" runat="server" class="tex-control">
                          </div>
                          <br />
                        </div>
                        <br>
                        <div class="row">
                         
                            <div class="col-sm-2">
                                <button id="btnEditar" onserverclick="btnEditar_ServerClick" runat="server" class="btn btn-primary"> Editar </button>
                                <button id="btnNuevo" onserverclick="btnNuevo_ServerClick" runat="server" class="btn btn-primary"> Nuevo </button>
                                </div>
                            
                        </div>
                    </div>
                    <div class="card-footer " <%--style="background: #95a9e0;"--%>></div>
                </div>



</asp:Content>
