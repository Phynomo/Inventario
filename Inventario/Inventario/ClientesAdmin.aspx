<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientesAdmin.aspx.cs" Inherits="Inventario.ClientesAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card">
                    <div class="card-headerstyle" >
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
                            <label >Apellido</label>
                            <input type="text" id="txtApellido" placeholder="Apellido" runat="server" class="text-control" >
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
                            <input type="text" id="txtdireccion" placeholder="Dirección" runat="server" class="tex-control">
                          </div>
                             <br />
                          <div class="col-sm-10">
                            <label >Telefono</label>
                              <input type="text" id="txtTelefono" placeholder="Telefono" runat="server" class="tex-control">
                          </div>
                             <br />
                          <div class="col-sm-10">
                            <label >Email</label>
                              <input type="text" id="txtEmail" placeholder="Telefono" runat="server" class="tex-control">
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
                    <div class="card-footer "></div>
                </div>

</asp:Content>
