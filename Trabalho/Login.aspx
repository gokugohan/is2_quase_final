<%@ Page Title="Log in" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="login" %>

<%@ Register Src="~/Control/LoginControl.ascx" TagPrefix="LoginForm" TagName="LoginControl" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
   <style>
        
    </style>
    <div id="animWrapper">

        <div class="row">
            <div class="col-md-12">
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <div class="text-center" style="
                                margin-top: 15%;
                                margin-bottom: 15%;
                            ">
                            <h1 class="text-danger blink" >ACCESS DENIED!</h1>
                        </div>
                    </LoggedInTemplate>
                    <AnonymousTemplate>
                        <LoginForm:LoginControl runat="server" ID="LoginControl" />
                    </AnonymousTemplate>
                </asp:LoginView>


            </div>
        </div>
    </div>
</asp:Content>


