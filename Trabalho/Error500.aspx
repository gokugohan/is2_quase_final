<%@ Page Language="C#" Title="Error" AutoEventWireup="true" MasterPageFile="~/MasterPages/MasterPage.master" CodeFile="Error500.aspx.cs" Inherits="Error" %>

<asp:Content ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                <div class="text-center" style="margin-top: 15%; margin-bottom: 15%;">
                    <p class="text-danger blink">Página não encontrada, lol!</p>
                    <h2>
                        Login como admin para visualizar o error log.
                    </h2>
                </div>
            </AnonymousTemplate>
            <LoggedInTemplate>
                <div class="text-center" style="margin-top: 15%; margin-bottom: 15%;">
                    <p class="text-danger blink">Error!</p>
                    <h2>
                        Login como admin para visualizar o error log.
                    </h2>
                </div>
            </LoggedInTemplate>
            <RoleGroups >
                <asp:RoleGroup Roles="Administrator">
                    <ContentTemplate>
                        <div class="text-center" style="margin-top: 15%; margin-bottom: 15%;">
                            <h1 class="text-danger" style="color:red;">Invalid operation, lol!</h1>
                            <h2>
                                <a href="elmah.axd">Mostrar error log</a>
                            </h2>
                        </div>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
        
    </div>
</asp:Content>