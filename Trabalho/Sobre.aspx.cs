using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sobre : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        OpenPdf("apresentacao.pdf");
    }

    private void OpenPdf(string filepath)
    {
        String path = Server.MapPath(filepath);
        WebClient client = new WebClient();
        Byte[] fileBuffer = client.DownloadData(path);
        if (fileBuffer != null)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-length", fileBuffer.Length.ToString());
            Response.BinaryWrite(fileBuffer);
        }
    }
}