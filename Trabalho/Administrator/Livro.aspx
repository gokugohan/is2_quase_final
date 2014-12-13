<%@ Page Title="Gerir livro" Theme="Admin" Language="C#" MasterPageFile="~/Administrator/Admin.master" AutoEventWireup="true" CodeFile="Livro.aspx.cs" Inherits="Administrator_Livro_Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="../Scripts/epoch_classes.js"></script>
    <script>
        /*
            http://www.javascriptkit.com/script/script2/epoch/index.shtml
        */
        var dp_cal;
        window.onload = function () {
            dp_cal = new Epoch('epoch_popup', 'popup', document.getElementById('ContentPlaceHolder1_DetailsView1_TextBox2'));
            var tmp = document.getElementById("ContentPlaceHolder1_DetailsView1_TextBox2");
            console.log(tmp);
        };
    </script>
    <div class="row">
        <div class="col-md-9 col-lg-9">
            <asp:Panel ID="PanelFormLivro" runat="server">
                 <div class="panel panel-green">
                <div class="panel panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i>Formulário inserção do livro</h3>
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DetailsView
                                ID="DetailsView1" runat="server"
                                CssClass="table table-bordered"
                                AutoGenerateRows="False"
                                DataKeyNames="ID_Livro"
                                OnItemInserted="DetailsView1_ItemInserted"
                                
                                DataSourceID="SqlDataSource1"
                                DefaultMode="Insert">
                                <Fields>
                                    <asp:BoundField DataField="ID_Livro" HeaderText="ID_Livro" ReadOnly="True" InsertVisible="False" SortExpression="ID_Livro"></asp:BoundField>
                                    <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                                        
                                        <InsertItemTemplate>
                                            <asp:TextBox runat="server" 
                                                CssClass="form-control" 
                                                placeholder="ddd-ddd-ddd-ddd-d"
                                                Text='<%# Bind("ISBN") %>' ID="TextBox5"></asp:TextBox>
                                            <asp:RegularExpressionValidator 
                                                ID="RegularExpressionValidator1" 
                                                runat="server" 
                                                ControlToValidate="TextBox5"
                                                ValidationExpression="\d{3}-\d{3}-\d{3}-\d{3}-[0-9]{1}"
                                                ForeColor="Red"
                                                ErrorMessage="Inválido"></asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                       
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Titulo" SortExpression="Titulo">
                                       
                                        <InsertItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("Titulo") %>' 
                                                ID="TextBox1"></asp:TextBox>

                                        </InsertItemTemplate>
                                       
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Data Publicação" SortExpression="Data_Publicacao">
                                       
                                        <InsertItemTemplate>

                                            <asp:TextBox runat="server"  CssClass="form-control" placeholder="DD/MM/YYYY" Text='<%# Bind("Data_Publicacao") %>' ID="TextBox2"></asp:TextBox>
                                            
                                            <%--http://regexlib.com/DisplayPatterns.aspx?cattabindex=4&categoryId=5&AspxAutoDetectCookieSupport=1--%>
                                            <asp:RegularExpressionValidator 
                                                ID="RegularExpressionValidator2" 
                                                runat="server" 
                                                ControlToValidate="TextBox2"
                                                ForeColor="Red"
                                                ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$"
                                                ErrorMessage="Data inválida"></asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                        
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Categoria" SortExpression="Categoria">
                                       
                                        <InsertItemTemplate>
                                            <%--<asp:TextBox runat="server" Text='<%# Bind("Categoria") %>' ID="TextBox3"></asp:TextBox>--%>
                                            <asp:DropDownList ID="DropDownList1"
                                                runat="server" DataSourceID="Categoria"
                                                CssClass="form-control"
                                                SelectedValue='<%# Bind("Categoria") %>'
                                                AppendDataBoundItems="true"
                                                DataTextField="Nome_Categoria" DataValueField="ID_Categoria">
                                                <asp:ListItem Value="-1">Selecionar categoria</asp:ListItem>
                                            </asp:DropDownList>

                                        </InsertItemTemplate>
                                        
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Editora" SortExpression="Editora">
                                        
                                        <InsertItemTemplate>
                                            <%--<asp:TextBox runat="server" Text='<%# Bind("Editora") %>' ID="TextBox4"></asp:TextBox>--%>
                                            <asp:DropDownList ID="DropDownList3" runat="server"
                                                DataSourceID="Editora"
                                                DataTextField="Nome"
                                                CssClass="form-control"
                                                AppendDataBoundItems="true"
                                                SelectedValue='<%# Bind("Editora") %>'
                                                DataValueField="ID_Editora">
                                                <asp:ListItem Value="-1">Selecionar editora</asp:ListItem>
                                            </asp:DropDownList>


                                        </InsertItemTemplate>
                                        
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Autor" SortExpression="Autor">
                                        
                                        <InsertItemTemplate>
                                            <asp:DropDownList
                                                ID="DropDownList2"
                                                runat="server"
                                                DataSourceID="Autor"
                                                CssClass="form-control"
                                                SelectedValue='<%# Bind("Autor") %>'
                                                AppendDataBoundItems="true"
                                                DataTextField="Nome" DataValueField="ID_Autor">
                                                <asp:ListItem Value="-1">Selecionar autor</asp:ListItem>
                                            </asp:DropDownList>

                                        </InsertItemTemplate>
                                       
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Descrição">
                                        <InsertItemTemplate>
                                            <asp:TextBox runat="server" 
                                                CssClass="form-control"
                                                TextMode="MultiLine"
                                                Text='<%# Bind("Descricao") %>' 
                                                ID="TextBoxD" Rows="10" 
                                                EnableViewState="False"></asp:TextBox>
                                        </InsertItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ShowHeader="False">
                                        <InsertItemTemplate>

                                            <asp:LinkButton
                                                runat="server"
                                                CssClass="btn btn-default" Text="Inserir"
                                                CommandName="Insert"
                                                CausesValidation="True" ID="LinkButton1"> </asp:LinkButton>
                                            <asp:LinkButton
                                                CssClass="btn btn-default"
                                                runat="server" Text="Cancelar"
                                                CommandName="Cancel"
                                                CausesValidation="False" ID="LinkButton2"></asp:LinkButton>

                                        </InsertItemTemplate>
                                        
                                    </asp:TemplateField>
                                    
                                </Fields>
                            </asp:DetailsView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                
            </div>
          
            </asp:Panel>
        </div>

        <div class="col-md-3 col-lg-3">
            <asp:Button ID="btnMostrarLivros" OnClick="btnMostrarLivros_Click" 
                CssClass="btn btn-link" runat="server" Text="Mostrar livros" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-lg-12">
            
            <asp:Panel ID="PanelLivro" Visible="false" runat="server">
                 <div class="panel panel-green">
                <div class="panel panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i>Lista dos livros</h3>
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <%--<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>--%>
                            <asp:GridView ID="GridView2" runat="server" 
                                AutoGenerateColumns="False" 
                                DataKeyNames="ID_Livro"
                                
                                CssClass="table table-hover" 
                                DataSourceID="SqlDataSource2" 
                                AllowSorting="True" 
                                AllowPaging="False">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Eliminar" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="success" HeaderText="Código" InsertVisible="False" SortExpression="ID_Livro">
                                        <EditItemTemplate>
                                            <asp:Label runat="server" CssClass="form-control" Text='<%# Eval("ID_Livro") %>' ID="Label1"></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("ID_Livro") %>' ID="Label1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="success" HeaderText="ISBN" SortExpression="ISBN">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("ISBN") %>' ID="TextBox1"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("ISBN") %>' ID="Label2"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="success" HeaderText="Titulo" SortExpression="Titulo">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("Titulo") %>' ID="TextBox2"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Titulo") %>' ID="Label3"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="success" HeaderText="Data Publicação" SortExpression="Data_Publicacao">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("Data_Publicacao") %>' ID="TextBox3"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Data_Publicacao","{0:dd MMM yyyy}") %>' ID="Label4"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="success" HeaderText="Categoria" SortExpression="Categoria">
                                        <EditItemTemplate>
                                            <%--<asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("Categoria") %>' ID="TextBox4"></asp:TextBox>--%>

                                            <asp:DropDownList ID="DropDownList4" 
                                                CssClass="form-control"
                                                DataSourceID="Categoria"
                                                DataTextField="Nome_Categoria"
                                                DataValueField="ID_Categoria"
                                                SelectedValue='<%# Bind("Categoria") %>'
                                                 runat="server">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getCategoria(Eval("Categoria")) %>' ID="Label5"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="success" HeaderText="Editora" SortExpression="Editora">
                                        <EditItemTemplate>
                                            <%--<asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("Editora") %>' ID="TextBox5"></asp:TextBox>--%>
                                            <asp:DropDownList ID="DropDownList5" 
                                                DataSourceID="Editora"
                                                DataTextField="Nome"
                                                DataValueField="ID_Editora"
                                                SelectedValue='<%# Bind("Editora") %>'
                                                CssClass="form-control"
                                                runat="server"></asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getEditora(Eval("Editora")) %>' ID="Label6"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="success" HeaderText="Autor" SortExpression="Autor">
                                        <EditItemTemplate>
                                            <%--<asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("Autor") %>' ID="TextBox6"></asp:TextBox>--%>
                                            <asp:DropDownList 
                                                ID="DropDownList6" 
                                                runat="server"
                                                DataSourceID="Autor"
                                                DataTextField="Nome"
                                                DataValueField="ID_Autor"
                                                SelectedValue='<%# Bind("Autor") %>'
                                                CssClass="form-control"
                                                ></asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getAutor(Eval("Autor")) %>' ID="Label7"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="success" HeaderText="Descrição" SortExpression="Descricao">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" Text='<%# Bind("Descricao") %>' ID="TextBox7"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Descricao") %>' ID="Label8"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>

            </asp:Panel>
        </div>
    </div>

    <!-- Data sources -->

    <asp:SqlDataSource runat="server" 
        ID="Categoria" 
        ConnectionString='<%$ ConnectionStrings:OMeuBD %>' 
        SelectCommand="SELECT * FROM [Table_Categoria] ORDER BY [Nome_Categoria]"></asp:SqlDataSource>

    <asp:SqlDataSource runat="server"
        ID="Editora"
        ConnectionString='<%$ ConnectionStrings:OMeuBD %>'
        SelectCommand="SELECT ID_Editora,Nome FROM [Table_Editora] ORDER BY [Nome]"></asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="Autor"
        ConnectionString='<%$ ConnectionStrings:OMeuBD %>'
        SelectCommand="select ID_Autor, Nome+' '+Apelido as 'Nome' from Table_Autor"></asp:SqlDataSource>


    <asp:SqlDataSource runat="server"
        ID="SqlDataSource2"
        ConnectionString='<%$ ConnectionStrings:OMeuBD %>'
        DeleteCommand="DELETE FROM [Table_Livro] WHERE [ID_Livro] = @ID_Livro"
        InsertCommand="INSERT INTO [Table_Livro] ([ISBN], [Titulo], [Data_Publicacao], [Categoria], [Editora], [Autor], [Descricao]) VALUES (@ISBN, @Titulo, @Data_Publicacao, @Categoria, @Editora, @Autor, @Descricao)"
        SelectCommand="SELECT * FROM [Table_Livro]"
        UpdateCommand="UPDATE [Table_Livro] SET [ISBN] = @ISBN, [Titulo] = @Titulo, [Data_Publicacao] = @Data_Publicacao, [Categoria] = @Categoria, [Editora] = @Editora, [Autor] = @Autor, [Descricao] = @Descricao WHERE [ID_Livro] = @ID_Livro">
        <DeleteParameters>
            <asp:Parameter Name="ID_Livro" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ISBN" Type="String"></asp:Parameter>
            <asp:Parameter Name="Titulo" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Data_Publicacao"></asp:Parameter>
            <asp:Parameter Name="Categoria" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Editora" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Autor" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Descricao" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ISBN" Type="String"></asp:Parameter>
            <asp:Parameter Name="Titulo" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Data_Publicacao"></asp:Parameter>
            <asp:Parameter Name="Categoria" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Editora" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Autor" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Descricao" Type="String"></asp:Parameter>
            <asp:Parameter Name="ID_Livro" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" 
        ID="SqlDataSource1" 
        ConnectionString='<%$ ConnectionStrings:OMeuBD %>' 
        DeleteCommand="DELETE FROM [Table_Livro] WHERE [ID_Livro] = @ID_Livro" 
        InsertCommand="INSERT INTO [Table_Livro] ([ISBN], [Titulo], [Data_Publicacao], [Categoria], [Editora], [Autor],[Descricao]) VALUES (@ISBN, @Titulo, @Data_Publicacao, @Categoria, @Editora, @Autor,@Descricao)" 
        SelectCommand="SELECT * FROM [Table_Livro]" 
        UpdateCommand="UPDATE [Table_Livro] SET [ISBN] = @ISBN, [Titulo] = @Titulo, [Data_Publicacao] = @Data_Publicacao, [Categoria] = @Categoria, [Editora] = @Editora, [Autor] = @Autor, [Descricao]=@Descricao WHERE [ID_Livro] = @ID_Livro">
        <DeleteParameters>
            <asp:Parameter Name="ID_Livro" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ISBN" Type="String"></asp:Parameter>
            <asp:Parameter Name="Titulo" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Data_Publicacao"></asp:Parameter>
            <asp:Parameter Name="Categoria" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Editora" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Autor" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Descricao" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ISBN" Type="String"></asp:Parameter>
            <asp:Parameter Name="Titulo" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Data_Publicacao"></asp:Parameter>
            <asp:Parameter Name="Categoria" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Editora" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Autor" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ID_Livro" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Descricao" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server"
        ID="ViewLivro"
        ConnectionString='<%$ ConnectionStrings:OMeuBD %>'
        SelectCommand="SELECT * FROM [View_Livro] ORDER BY [Titulo]"></asp:SqlDataSource>
    <script>

        //$(function () {
        $('.search_textbox').each(function (i) {
            $(this).quicksearch("[id*=GridView2] tr:not(:has(th))", {
                'testQuery': function (query, txt, row) {
                    var indice = i + 1;
                    var stringQuery = query[0].toLowerCase();

                    // The :eq() selector selects an element with a specific index number.
                    var dadoAComparar = $(row).children(":eq(" + indice + ")").text().toLowerCase();
                    return dadoAComparar.indexOf(stringQuery) != -1;
                }
            });
        });

        //});
    </script>
</asp:Content>

