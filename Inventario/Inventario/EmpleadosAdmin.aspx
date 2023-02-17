<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpleadosAdmin.aspx.cs" Inherits="Inventario.EmpleadosAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container card text-center">
        <div class="row card-header text-center">
            <div class="col">
                <h4><asp:Label Text="Usuarios" runat="server" /> </h4> 
            </div>
        </div>
        <div class="card-body">
            <div class="row mt-2">
                <div class="col">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label><asp:Label ID="lblNombreAste" ForeColor="Red" runat="server" Text="*"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtNombre" runat="server"></asp:TextBox>
                </div>
                <div class="col">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label><asp:Label ID="lblApellidoAste" ForeColor="Red" runat="server" Text="*"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtApellido" runat="server"></asp:TextBox>
                </div>
                <div class="col">
                    <asp:Label ID="lblSexo" runat="server" Text="Sexo"></asp:Label><asp:Label ID="lblSexoAste" ForeColor="Red" runat="server" Text="*"></asp:Label><br />
                    <asp:RadioButton CssClass="mx-2" GroupName="rbSexo" ID="rbM" runat="server" />Masculino
                    <asp:RadioButton CssClass="mx-2" GroupName="rbSexo" ID="rbF" runat="server" />Femenino
                </div>
            </div>
            <div class="row mt-2">
                <div class="col">
                    <asp:Label ID="lblEstadoCivil" runat="server" Text="Estado Civil"></asp:Label><asp:Label ID="lblEstadoCivilAste" ForeColor="Red" runat="server" Text="*"></asp:Label><br />
                    <asp:DropDownList CssClass="form-control" ID="ddlEstadoCivil" runat="server"></asp:DropDownList>
                </div>
                <div class="col">
                    <asp:Label ID="lblDepartamento" runat="server" Text="Depertamento"></asp:Label><asp:Label ID="lblDepartamentoAste" ForeColor="Red" runat="server" Text="*"></asp:Label><br />
                    <asp:DropDownList CssClass="form-control" ID="ddlDepartamento" OnSelectedIndexChanged="ddlDepartamento_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                </div>
                <div class="col">
                    <asp:Label ID="lblMunicipio" runat="server" Text="Municipio"></asp:Label><asp:Label ID="lblMunicipioAste" ForeColor="Red" runat="server" Text="*"></asp:Label><br />
                    <asp:DropDownList CssClass="form-control" ID="ddlMunicipio" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col">
                    <asp:Label ID="lblDireccionExacta" runat="server" Text="Direccion Exacta"></asp:Label><asp:Label ID="lblDireccionExactaAste" ForeColor="Red" runat="server" Text="*"></asp:Label><br />
                    <textarea id="txtDireccionExacata" runat="server" class="form-control" cols="20" rows="2"></textarea>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col">
                    <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha Nacimiento"></asp:Label><asp:Label ID="lblFechaNacimientoAste" ForeColor="Red" runat="server" Text="*"></asp:Label><br />
                    <asp:TextBox ID="txtFechaNacimentoEditar" class="form-control" runat="server"></asp:TextBox>
                    <input type="date" id="txtFechaNacimiento" runat="server" class="form-control" />
                </div>
                <div class="col">
                    <asp:Label ID="lblCargo" runat="server" Text="Cargo"></asp:Label><asp:Label ID="lblCargoAste" ForeColor="Red" runat="server" Text="*"></asp:Label><br />
                    <asp:DropDownList CssClass="form-control" ID="ddlCargo" runat="server"></asp:DropDownList>
                </div>
                <div class="col">
                    <asp:Label ID="lblFechaContratacion" runat="server" Text="Fecha Contratacion"></asp:Label><asp:Label ID="lblFechaContratacionAste" ForeColor="Red" runat="server" Text="*"></asp:Label><br />
                    <asp:TextBox ID="txtFechaContratacionEditar" class="form-control" runat="server"></asp:TextBox>
                    <input type="date" id="txtFechaContratacion" runat="server" class="form-control" />
                </div>
            </div>
            <div class="row mt-2">
                <div class="col">
                    <asp:Label ID="lblTelefono" runat="server" Text="Telefono"></asp:Label><asp:Label ID="lblTelefonoAste" ForeColor="Red" runat="server" Text="*"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtTelefono" runat="server"></asp:TextBox>
                </div>
                <div class="col">
                    <asp:Label ID="lblCorreo" runat="server" Text="Correo"></asp:Label><asp:Label ID="lblCorreoAste" ForeColor="Red" runat="server" Text="*"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtCorreo" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                        <asp:Button ID="btnGuardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" runat="server" Text="Guardar" />
                        <asp:Button ID="btnEditar" CssClass="btn btn-warning" OnClick="btnEditar_Click" runat="server" Text="Editar" />
                        <asp:Button ID="btnCancelar" CssClass="btn btn-danger" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" />
                </div>
            </div>
        </div>
    </div>




</asp:Content>
