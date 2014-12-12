using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data.OleDb;


public partial class Administrator_Default : System.Web.UI.Page
{

    private string mBaseUrl;
    private List<view_utilizador_req_livro> cData;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
        //else
        //{

        //    if (Cache["livrosEmprestados"] != null)
        //    {
        //        cData = (List<view_utilizador_req_livro>)Cache["livrosEmprestados"];
        //    }
        //    else
        //    {
        //        cData = Biblioteca.QueryBiblioteca.GetLivrosEmprestadosPelosUtilizadores();
        //        Cache["livrosEmprestados"] = cData;
        //    }
        //}

        GridView1.DataSource = Biblioteca.QueryBiblioteca.GetLivrosEmprestadosPelosUtilizadores();
        GridView1.DataBind();
    }


    protected void btnExportCSV_Click(object sender, EventArgs e)
    {
        PanelExport.Visible = !PanelExport.Visible;
        btnExport.Visible = false;
    }


    private void GenerateCSVFile(string qualTabela)
    {

        string csv = string.Empty;
        switch (qualTabela)
        {
            case "autor":
                Util.CriarCSVAutor(Response);
                break;
            case "livro":
                Util.CriarCSVLivro(Response);
                break;
            case "editora":
                Util.CriarCSVEditora(Response);
                break;
            case "categoria":
                Util.CriarCSVCategorias(Response);
                break;
            case "utilizador":
                Util.CriarCSVUtilizador(Response);
                break;
        }
    }

    protected void btnDownload_Click(object sender, EventArgs e)
    {

        int qualTabela = Convert.ToInt32(ddlCSV.SelectedValue);
        ProcessarCSVData(qualTabela);
    }

    private void ProcessarCSVData(int qualTabela)
    {
        switch (qualTabela)
        {
            case 0:
                GenerateCSVFile("autor");
                break;
            case 1: GenerateCSVFile("livro"); break;
            case 2: GenerateCSVFile("editora"); break;
            case 3: GenerateCSVFile("categoria"); break;
            case 4: GenerateCSVFile("utilizador"); break;
            default: break;
        }
    }

  
    protected void btnGenerateXML_Click(object sender, EventArgs e)
    {

        Util.criarXMLLivrosEmprestados(downloadLink,Server);
    }
}
