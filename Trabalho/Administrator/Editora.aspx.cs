using CsvHelper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Editora_Default : System.Web.UI.Page
{
    private string mFileName;
    private string mExtension;
    private string mDestinationFolder;

    private string mBaseUrl;

    protected void Page_Load(object sender, EventArgs e)
    {
        mBaseUrl = Request.Url.GetLeftPart(UriPartial.Authority);

        if (!string.IsNullOrEmpty(mBaseUrl))
        {
            //this.Master.getHiperLinkControl.NavigateUrl = mBaseUrl;
        }
    }

    protected void OnDataBound(object sender, EventArgs e)
    {

        addTexBoxSearch();
    }

    private void addTexBoxSearch()
    {
        Label lblSearch = new Label();
        lblSearch.Text = "<br/><br/>Pesquisar editora";
        lblSearch.CssClass = "control-label";

        TextBox txtSearch = new TextBox();
        txtSearch.Attributes["placeholder"] = "Pesquisar editora";
        txtSearch.CssClass = "search_textbox form-control";

        ListView1.Controls.AddAt(0, txtSearch);
        ListView1.Controls.AddAt(0, lblSearch);
    }


    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            this.mExtension = System.IO.Path.GetExtension(FileUpload1.FileName);
            Label1.Text = this.mExtension;
            if (this.mExtension.ToLower() == ".csv")
            {
                this.mFileName = FileUpload1.FileName;
                this.mDestinationFolder = Server.MapPath("~/Uploads/" + this.mFileName);
                FileUpload1.SaveAs(this.mDestinationFolder);

                processingCSVFile(mDestinationFolder);
            }
            else
            {
                String scriptText = "alert ('Erro. O ficheiro tem de ser do tipo .csv')";
                ClientScript.RegisterOnSubmitStatement(this.GetType(),
                    "ConfirmSubmit", scriptText);
            }
        }
        else
        {
            String scriptText ="return confirm('Do you want to submit the page?')";
            ClientScript.RegisterOnSubmitStatement(this.GetType(),
                "ConfirmSubmit", scriptText);
        }

        Response.Redirect("Editora");
    }

    private void processingCSVFile(string file)
    {
        try
        {


            string csvData = File.ReadAllText(file);
            foreach (string row in csvData.Split('\n'))
            {
                if (!string.IsNullOrEmpty(row))
                {

                    using (var entidade = new BibliotecaEntity())
                    {
                        string[] temp = row.Split(',');

                        if (temp.Length == 2)
                        {
                            Editora editora = new Editora();
                            editora.Nome = temp[0];
                            editora.Descricao = temp[1];
                            entidade.Editoras.Add(editora);
                            entidade.SaveChanges();
                        }
                        else
                        {
                            Label1.Text = "Occoreu erro ao importar dados!";
                        }

                    }
                }
            }
        }
        catch (Exception e)
        {
            Label1.Text = "Occoreu erro ao importar dados!";
        }


    }  
}