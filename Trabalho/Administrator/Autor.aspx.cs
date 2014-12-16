using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Xml.Linq;
using System.Xml;
using System.Data.Entity.Validation;

public partial class Administrator_AdminAutor : System.Web.UI.Page
{
    
    private string mBaseUrl;
    private string mFileName;
    private string mDestinationFolder;
    
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
        GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Footer, DataControlRowState.Normal);

        for (int i = 0; i < GridViewAutor.Columns.Count; i++)
        {
            TableHeaderCell cell = new TableHeaderCell();
            if (i != 0)
            {
                TextBox txtSearch = new TextBox();
                txtSearch.Attributes["placeholder"] = "Pesquisar por " + GridViewAutor.Columns[i].HeaderText;
                txtSearch.CssClass = "search_textbox form-control";
                cell.Controls.Add(txtSearch);
                row.Controls.Add(cell);
            }
            else
            {
                Label lbl = new Label();
                lbl.Text = "Pesquisar autor";
                lbl.CssClass = "control-label pull-left";
                cell.Controls.Add(lbl);
                row.Controls.Add(cell);
            }

        }


        if (GridViewAutor.HeaderRow != null)
        {
            GridViewAutor.HeaderRow.Parent.Controls.AddAt(0, row);

        }
    }
    protected void btnImportar_Click(object sender, EventArgs e)
    {
        String horaUpload = (DateTime.Now.Year + "" + DateTime.Now.Month + "" + DateTime.Now.Day+"_"+
            DateTime.Now.Hour+""+DateTime.Now.Minute+""+DateTime.Now.Second);

        if (FileUpload1.HasFile)
        {
            
            string ext = System.IO.Path.GetExtension(FileUpload1.FileName);
            Label4.Text = ext;
            if (ext.ToLower() == ".xml")
            {
                mFileName = FileUpload1.FileName;
                mDestinationFolder = Server.MapPath("~/Uploads/" + mFileName);

                bool uploadSucesso = false;
                try
                {
                    FileUpload1.SaveAs(mDestinationFolder);
                    uploadSucesso = true;
                }
                catch (Exception ex)
                {
                    uploadSucesso = false;
                    Label4.Text = ex.Message;

                }

                if (uploadSucesso)
                {
                    //Processar XML
                    Label4.Text += "<br> Upload sucessfully!";

                    XDocument xDocument = XDocument.Load(mDestinationFolder);
                    IEnumerable<XElement> autores = xDocument.Root.Elements();
                    
                    using (var entidade = new BibliotecaEntity())
                    {
                                              
                        foreach (var autor in autores)
                        {
                            
                            string nome = autor.Element("nome").Value;
                            string apelido = autor.Element("apelido").Value;

                            Autor autorExistente = (from ae in entidade.Autores
                                                    where ae.Nome == nome && ae.Apelido == apelido
                                                    select ae).SingleOrDefault();

                            if (autorExistente == null)
                            {
                                Autor mAutor = new Autor();
                                mAutor.Nome = nome;
                                mAutor.Apelido = apelido;
                                entidade.Autores.Add(mAutor);
                            }                                                 
                        }

                        try
                        {
                            entidade.SaveChanges();
                            Response.Redirect("Autor");
                        }
                        catch (Exception ex)
                        {
                            Label4.Text = ex.Message;
                        }
                       
                    }
                    
                    
                }
                
                
            }
            else
            {
                Label4.Text = "O ficheiro importado é incorreto";
            }
        }
        else
        {
            Label4.Text = "Ainda não importar nenhum ficheiro!";
        }
        //Response.Redirect("Autor");
    }

    private bool isAutorExiste(List<Autor> autorExistentes, string nome, string apelido)
    {
        return false;
    }
}