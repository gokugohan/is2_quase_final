using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Core.Objects;
using Biblioteca;

public partial class Administrator_Livro_Default : System.Web.UI.Page
{
    private string mBaseUrl;
    private string[] meses = {"Janeiro","Fevereiro",
                                 "Março","Abril","Maio",
                                 "Junho","Julho","Agosto",
                                 "Setembro","Outubro",
                                 "Novembro","Dezembro"};
    private IQueryable<View_Livro> livros;

    

    protected void Page_Load(object sender, EventArgs e)
    {
        mBaseUrl = Request.Url.GetLeftPart(UriPartial.Authority);

        if (!string.IsNullOrEmpty(mBaseUrl))
        {
            //this.Master.getHiperLinkControl.NavigateUrl = mBaseUrl;
        }

    }

    protected string getAutor(object idAutor)
    {
        int id = Convert.ToInt32(idAutor);
        return QueryBiblioteca.GetAutor(id);
    }

    protected string getCategoria(object idCategoria)
    {
        int id = Convert.ToInt32(idCategoria);
        return QueryBiblioteca.GetCategoria(id);
    }

    protected string getEditora(object idEditora)
    {
        int id = Convert.ToInt32(idEditora);
        return QueryBiblioteca.GetEditora(id);
    }

    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        Response.Redirect("./Livro");
    }

    protected void OnDataBound(object sender, EventArgs e)
    {

        addTexBoxSearch();

    }

    private void addTexBoxSearch()
    {
        GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Footer, DataControlRowState.Normal);

        for (int i = 0; i < GridView2.Columns.Count; i++)
        {
            TableHeaderCell cell = new TableHeaderCell();
            if (i != 0)
            {
                TextBox txtSearch = new TextBox();
                txtSearch.Attributes["placeholder"] = "por " + GridView2.Columns[i].HeaderText;
                txtSearch.CssClass = "search_textbox form-control";
                cell.Controls.Add(txtSearch);
                row.Controls.Add(cell);
            }
            else
            {
                Label lbl = new Label();
                lbl.Text = "Pesquisar livro";
                lbl.CssClass = "control-label pull-left";
                cell.Controls.Add(lbl);
                row.Controls.Add(cell);
            }

        }


        if (GridView2.HeaderRow != null)
        {
            GridView2.HeaderRow.Parent.Controls.AddAt(0, row);

        }
    }
    protected void btnMostrarLivros_Click(object sender, EventArgs e)
    {
        PanelLivro.Visible = PanelFormLivro.Visible;
        PanelFormLivro.Visible = !PanelLivro.Visible;
        if (PanelLivro.Visible)
        {
            btnMostrarLivros.Text = "Ocultar livros";
        }
        else
        {
            btnMostrarLivros.Text = "Mostrar livros";
        }
        
    }
  
}