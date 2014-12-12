using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class RequisitarLivros : BasePage
{
    
    private bool requisitarOk = false;

    private Label lblFalta;
    
    public int Codigo { get; set; }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ProfileCommon profile = Profile.GetProfile(User.Identity.Name);

            String qCodigo = Page.RouteData.Values["codigodolivro"] as string;
            
            if (isAnInteger(qCodigo) && isUserPerfilCompleto(profile))
            {
                Codigo = Convert.ToInt32(qCodigo);
                mostrarInfoDoLivroARequisitar();
                mostrarLivrosRequisitados();
            }
            else if (!isUserPerfilCompleto(profile))
            {
                PanelLivroByCodigo.Visible = false;
                Label1.Text = "Completar o <a href='../Perfil'>perfil</a> para requisitar o livro...";
            }
            else
            {
                Panel p = _("PanelTabelaDetailLivro") as Panel;
                p.Visible = false;
                mostrarLivrosRequisitados();
                //Response.Redirect("./", true);
            }
            

        }
        catch (Exception fe)
        {
            
            //Response.Redirect("./",true);
            //Response.Write(fe.Message);
        }
    }

    private bool isAnInteger(string qCodigo)
    {
        int temp;
        return int.TryParse(qCodigo,out temp);
    }

    public bool isUserPerfilCompleto(ProfileCommon profile)
    {
        bool retorno = profile.Nome != string.Empty && profile.Apelido != string.Empty
            && profile.NumeroContato != string.Empty;
        return retorno;
    }

    private void mostrarInfoDoLivroARequisitar()
    {
        var resultado = Biblioteca.QueryBiblioteca.GetLivro(Codigo);

        if (resultado != null)
        {
            ((Label)_("lblCodigo")).Text = resultado.Código + "";
            ((Label)_("lblISBN")).Text = resultado.ISBN;
            ((Label)_("lblTitulo")).Text = resultado.Titulo;
            ((Label)_("lblDataPub")).Text = (Convert.ToDateTime(resultado.Data_publicação)).ToShortDateString();
            ((Label)_("lblCategoria")).Text = resultado.Nome_Categoria;
            ((Label)_("lblEditora")).Text = resultado.Editora;
            ((Label)_("lblAutor")).Text = resultado.Autor;
            requisitarOk = true;
        }

    }

    private Control _(string name){
        return this.LoginView1.FindControl(name);
    }

    protected void requisitarLivro(int qualLivro)
    {
        String username = User.Identity.Name;
        bool foiRequisitado = Biblioteca.QueryBiblioteca.RequisitarLivro(qualLivro, username);
        if (foiRequisitado)
        {
            Response.Redirect("./RequisitarLivros");
        }
    }

    protected void btnConfirmar_Click(object sender, EventArgs e)
    {
        if (requisitarOk)
        {
            requisitarLivro(Codigo);
            Panel PanelTabelaDetailLivro = (Panel)_("PanelTabelaDetailLivro");
            PanelTabelaDetailLivro.Visible = false;

            Panel PanelMensagem = (Panel)_("PanelMensagem");
            Label lblMensagem = (Label)_("lblMensagem");
            lblMensagem.Text = "<em><h2>Efetuou com sucesso</h3></em>" + User.Identity.Name;
        }
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if ((e.Row.RowType == DataControlRowType.DataRow))
        //{
        //    lblFalta = (Label)e.Row.FindControl("lblFalta");
        //    lblFalta.Text = "Control found!";
        //}
    }
    protected void mostrarLivrosRequisitados()
    {
        string username = User.Identity.Name;
     
        List<view_utilizador_req_livro> livroRequistado = Biblioteca.QueryBiblioteca.GetLivrosEmprestadosPelosUtilizadores(username);
        if (livroRequistado.Count >0)
        {

            ((GridView)_("GridView2")).DataSource = livroRequistado;
            ((GridView)_("GridView2")).DataBind();
        }
        else
        {
            Label lblTituloPanel = (Label)_("lblTituloPanel");
            lblTituloPanel.Text = "Ainda não requisitou nenhum livro";
            lblTituloPanel.CssClass = "alert alert-danger";
        }
        
    }

   
}