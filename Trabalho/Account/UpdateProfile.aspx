<%@ Page Title="Atualizar perfil" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" 
    AutoEventWireup="true" 
    CodeFile="UpdateProfile.aspx.cs" Inherits="UpdateProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div id="animWrapper">
        <div class="jumbotron">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <asp:LoginView ID="LoginView1" runat="server">
                <AnonymousTemplate>
                    <div class="text-center" style="
                                margin-top: 15%;
                                margin-bottom: 15%;
                            ">
                            <h1 class="text-danger blink" >ANONYMOUS LOL!</h1>
                        </div>
                </AnonymousTemplate>
                <LoggedInTemplate>
                       <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <td colspan="2">
                            <h2>Atualizar o perfil</h2>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <label class="control-label pull-right">Nome:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbNome" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="tbNome" ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator2" runat="server"
                                ControlToValidate="tbNome"
                                ValidationExpression="^[a-zA-Z\s]*$"
                                ForeColor="Red"
                                ErrorMessage="Apenas letras"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label pull-right">Apelido:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbApelido" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="tbApelido" ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator3" runat="server"
                                ControlToValidate="tbApelido"
                                ValidationExpression="^[a-zA-Z\s]*$"
                                ForeColor="Red"
                                ErrorMessage="Apenas letras"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label pull-right">Número contato:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbNumeroContato" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="tbNumeroContato" 
                                ID="RequiredFieldValidator3" runat="server" ForeColor="Red" 
                                ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                runat="server" ErrorMessage="Número contato inválido"
                                ControlToValidate="tbNumeroContato"
                                ForeColor="Red"
                                ValidationExpression="^(9[1236]{1}[0-9]{1})-([0-9]{3})-([0-9]{3})$">
                            </asp:RegularExpressionValidator>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label pull-right">Email:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbEmail" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            
                            <asp:RequiredFieldValidator ControlToValidate="tbEmail" ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                                runat="server" ErrorMessage="Email inválido"
                                ControlToValidate="tbEmail"
                                ForeColor="Red"
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label pull-right">Rua:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbRua" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="tbRua" ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator5" runat="server"
                                ControlToValidate="tbRua"
                                ValidationExpression="^[a-zA-Z\s]*$"
                                ForeColor="Red"
                                ErrorMessage="Apenas letras"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label pull-right">Codigo postal:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbCodigoPostal" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="tbCodigoPostal" ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6"
                                runat="server"
                                ControlToValidate="tbCodigoPostal"
                                ErrorMessage="Código postal inválido"
                                ValidationExpression="^\d{4}-\d{3}$">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label pull-right">Cidade:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbCidade" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="tbCidade" ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator7" runat="server"
                                ControlToValidate="tbCidade"
                                ValidationExpression="^[a-zA-Z\s]*$"
                                ForeColor="Red"
                                ErrorMessage="Apenas letras"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label pull-right">País:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPais" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="tbPais" ID="RequiredFieldValidator8" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator8" runat="server"
                                ControlToValidate="tbPais"
                                ValidationExpression="^[a-zA-Z\s]*$"
                                ForeColor="Red"
                                ErrorMessage="Apenas letras"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>

                        <td></td>
                        <td>
                            <asp:Button ID="btnUpdate" runat="server" Text="Atualizar" OnClick="updateData" CssClass="btn btn-success pull-right" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancelar" OnClick="cancelUpdateData" CssClass="btn btn-success pull-left" />
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
                </LoggedInTemplate>
            </asp:LoginView>
         
        </div>
    </div>
</asp:Content>
