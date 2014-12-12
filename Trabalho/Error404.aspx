<%@ Page Language="C#" Title="Error" AutoEventWireup="true" MasterPageFile="~/MasterPages/MasterPage.master" CodeFile="Error404.aspx.cs" Inherits="Error" %>

<asp:Content ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <div class="text-center" style="margin-top: 15%; margin-bottom: 15%;">
            <p class="text-danger blink">Error!</p>
        </div>
        <asp:LoginView ID="LoginView1" runat="server">
            <RoleGroups >
                <asp:RoleGroup Roles="Administrator">
                    <ContentTemplate>
                        <div class="text-center" style="margin-top: 15%; margin-bottom: 15%;">
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