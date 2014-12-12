<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div id="animWrapper">
        <div class="row">
            <div class="col-md-12 col-lg-12">
                <%--"{0:d MMMM yyyy}"--%>
                <table style="margin-bottom: 10px;">
                    <tr>
                        <td>
                            <asp:Label ID="lblSearchCounter" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox
                                ID="tbSearch"
                                placeholder="Pesquisar livro por título"
                                CssClass="form-control search_textbox"
                                runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button
                                ID="btnSearch"
                                CssClass="btn btn-default"
                                runat="server"
                                OnClick="btnSearch_Click"
                                Text="Submit" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        
        <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-md-6 col-lg-6">

                        <asp:GridView ID="GridView1"
                            runat="server"
                            CssClass="table"
                            AutoGenerateColumns="false"
                            OnPageIndexChanging="GridView1_PageIndexChanging"
                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                            AllowSorting="true"
                            DataKeyNames="ID_Livro"
                            AllowPaging="True">
                            <Columns>
                                
                                <asp:TemplateField HeaderText="Título" SortExpression="Titulo">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("Titulo") %>' ID="Label3"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%--<asp:TemplateField HeaderText="Requisitar">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1"
                                            NavigateUrl='<%# string.Format("~/Requisitar/{0}",
                            HttpUtility.UrlEncode(Eval("ID_Livro").ToString())) %>'
                                            runat="server">Requisitar</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server"
                                            Text="Selecione o livro"
                                            CommandName="Select"
                                            CausesValidation="False"
                                            ID="LinkButton1"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>

                    <div class="col-md-6 col-lg-6">
                        <asp:DetailsView
                            ID="DetailsView1"
                            runat="server"
                            HeaderStyle-CssClass="text-center"
                            HeaderText="Detalho do livro"
                            HeaderStyle-Font-Size="Large"
                            DefaultMode="ReadOnly"
                            AutoGenerateRows="false"
                            CssClass="table">

                            <Fields>
                                <asp:BoundField DataField="Código" HeaderText="Código" ReadOnly="true" />
                                <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="true" />
                                <asp:BoundField DataField="Titulo" HeaderText="Titulo" ReadOnly="true" />
                                <asp:TemplateField HeaderText="Data publicação">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("Data_publicação","{0:dd MMMM yyyy}") %>' ID="Label3"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Nome_Categoria" HeaderText="Categoria" ReadOnly="true" />
                                <asp:BoundField DataField="Autor" HeaderText="Autor" ReadOnly="true" />
                                <asp:BoundField DataField="Editora" HeaderText="Editora" ReadOnly="true" />
                                <asp:BoundField DataField="Descrição" HeaderText="Descrição" ReadOnly="true" />
                                <asp:TemplateField ControlStyle-Font-Size="Large" HeaderText="Requisitar">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1"
                                            CssClass="btn btn-info"
                                            NavigateUrl='<%# string.Format("~/Requisitar/{0}",
                            HttpUtility.UrlEncode(Eval("Código").ToString())) %>'
                                            runat="server">Requisitar</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 
                            </Fields>
                        </asp:DetailsView>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

