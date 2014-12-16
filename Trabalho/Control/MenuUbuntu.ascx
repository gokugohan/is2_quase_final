<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuUbuntu.ascx.cs" Inherits="Control_MenuUbuntu" %>
<nav id="myNavbar" runat="server" class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="../">Trabalho I - IS2</a>
        </div>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            
             <ul class="nav navbar-nav">
                
                <li>
                    <asp:HyperLink ID="HomeLink" NavigateUrl="../" runat="server">Home</asp:HyperLink>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Biblioteca <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <asp:HyperLink ID="RequisitarLink" NavigateUrl="~/RequisitarLivros" runat="server">Requisitar livro</asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink ID="ContatoLink" 
                                NavigateUrl="~/Contato" 
                                runat="server">Contato</asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink ID="PerfilLink" 
                                NavigateUrl="~/Perfil" 
                                runat="server">Perfil</asp:HyperLink>
                        </li>
                    </ul>
                </li>
                            
                <li>
                    <div id="LoginStatus-name">
                            <asp:LoginStatus ID="LoginStatus2" runat="server"
                                LogoutAction="Redirect" LogoutPageUrl="~/Default.aspx" /> &nbsp;
                        <asp:LoginName ID="LoginName1" runat="server" />
                    </div>
                </li>
                <li>
                    
                </li>
            </ul>
            <ul class="nav navbar-right top-nav">
                <li>
                    <div id="SobreLink">
                        <a href="~/Sobre.aspx" runat="server">Sobre trabalho</a>
                    </div>
                    
                </li>
            </ul>
        </div>
    </div>
</nav>

