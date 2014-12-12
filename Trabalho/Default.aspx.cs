using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Caching;
using System.Web.ModelBinding;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : BasePage
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            bindLivro("");
        }
        
        
    }

    private void bindLivro(string txtSearch)
    {
        object resultado = Biblioteca.QueryBiblioteca.GetLivro(txtSearch);
        GridView1.DataSource = resultado;
        GridView1.DataBind();

    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindLivro("");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

        GridView1.SelectedRowStyle.CssClass = "none";
        DetailsView1.Visible = false;


        string txtSearch = tbSearch.Text.Trim();
        bindLivro(txtSearch);
        tbSearch.Text = "";
        //ViewState - 
        if (ViewState["contador"] == null)
        {
            ViewState["contador"] = 1;
            lblSearchCounter.Text = "Pesquisou: "+1+" vez (" + txtSearch +")";
        }
        else
        {
            int contador = (int)ViewState["contador"];
            contador += 1;
            ViewState["contador"] = contador;
            lblSearchCounter.Text = "Pesquisou: " + contador+" vezes (" + txtSearch +")";
        }
    }

    private void bindLivroDetalho(int id)
    {
        List<View_Livro> resultado = Biblioteca.QueryBiblioteca.GetDetalhoLivro(id);
        DetailsView1.DataSource = resultado;
        DetailsView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DetailsView1.Visible = true;
        int ID_Livro = Convert.ToInt32(GridView1.SelectedValue);
        bindLivroDetalho(ID_Livro);
        GridView1.SelectedRowStyle.CssClass = "alert alert-danger";
    }
   
}