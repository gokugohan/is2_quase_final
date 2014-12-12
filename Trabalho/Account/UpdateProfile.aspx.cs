using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateProfile : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MembershipUser user = Membership.GetUser();
            if (user != null & User.Identity.IsAuthenticated)
            {
                if (User.Identity.Name == user.UserName)
                {
                    ProfileCommon profile = Profile.GetProfile(User.Identity.Name);
                    setProfileDataToTable(profile);

                }
            }
        }
        
    }

    protected void updateData(object sender, EventArgs e)
    {
        ProfileCommon profile = Profile.GetProfile(User.Identity.Name);
        MembershipUser user = Membership.GetUser();
        if (profile != null && user !=null && User.Identity.IsAuthenticated)
        {
            UpdateProfileData(profile,user);
        }
        else
        {
            Label1.Text = "Não atualizou";
        }
       
    }

    private void UpdateProfileData(ProfileCommon profile, MembershipUser user)
    {

        Label1.Text = "Atualizou...";
        try
        {
            
            // update profile data
            profile.Nome = getText(_(GetControl("tbNome")));
            profile.Apelido = getText(_(GetControl("tbApelido")));
            profile.NumeroContato = getText(_(GetControl("tbNumeroContato")));
            profile.Email = getText(_(GetControl("tbEmail")));
            profile.Endereco.Rua = getText(_(GetControl("tbRua")));
            profile.Endereco.CodigoPostal = getText(_(GetControl("tbCodigoPostal")));
            profile.Endereco.Cidade = getText(_(GetControl("tbCidade")));
            profile.Endereco.Pais = getText(_(GetControl("tbPais")));


            //save profile
            profile.Save();

            //update user email
            user.Email = getText(_(GetControl("tbEmail")));
            Membership.UpdateUser(user);
        }
        catch (System.Configuration.Provider.ProviderException e)
        {
            Label1.Text = e.Message;
        }
        Response.Redirect("Perfil");
    }

    private string getText(TextBox tb)
    {
        return tb.Text.Trim();
    }

    private TextBox _(Control control)
    {
        return control as TextBox;
    }

    private Control GetControl(string id)
    {
        return LoginView1.FindControl(id);
    }

    private void setProfileDataToTable(ProfileCommon profile)
    {
        _(GetControl("tbNome")).Text = profile.Nome;
        _(GetControl("tbApelido")).Text = profile.Apelido;
        _(GetControl("tbNumeroContato")).Text = profile.NumeroContato;
        _(GetControl("tbEmail")).Text = profile.Email;
        _(GetControl("tbRua")).Text = profile.Endereco.Rua;
        _(GetControl("tbCodigoPostal")).Text = profile.Endereco.CodigoPostal;
        _(GetControl("tbCidade")).Text = profile.Endereco.Cidade;
        _(GetControl("tbPais")).Text = profile.Endereco.Pais;
    }



    protected void cancelUpdateData(object sender, EventArgs e)
    {
        Response.Redirect("Perfil");
    }
}