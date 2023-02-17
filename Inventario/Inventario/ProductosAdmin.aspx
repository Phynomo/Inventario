<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductosAdmin.aspx.cs" Inherits="Inventario.ProductosAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card">
                    <div class="card-headerstyle" <%--style="background: #fccb90;
                     background: -webkit-linear-gradient(to right, #b2bd99, #d8363a, #dd3675, #b44593);
                    background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593)--%>;">
                     <h3 class="text-control">Producto</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">

                          <div class="col-sm-10">
                            <label >Nombre</label>
                            <input type="text" id="txtnombre" placeholder="Nombre" runat="server" class="text-control" >
                          </div>
                             <br />
                            
                          <div class="col-sm-10">
                            <label >Precio</label>
                            <input type="text" id="txtPrecio"  runat="server" class="tex-control">
                          </div>
                            <br />
                            <div class="col-sm-10">
                            <label >Categoria</label>
                            <asp:DropDownList ID="ddlCategoria" runat="server"></asp:DropDownList>
                          </div>
                            <br />
                            <div class="col-sm-10">
                            <label >Proveedores</label>
                            <asp:DropDownList ID="ddlProveedores" runat="server"></asp:DropDownList>
                          </div>
                             <br />
                          <div class="col-sm-10">
                            <label >Stock</label>
                            <input type="text" id="txtStock"  runat="server" class="tex-control">
                          </div>
                            
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
