using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_login : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnSignin_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand command = new SqlCommand("SELECT * FROM Admin_Login WHERE Username='" + txtusername.Text + "' AND UserPassword='" + txtuserpassword.Text + "'", con);
        SqlDataReader reader = command.ExecuteReader();
        {
            if (reader.HasRows)
            {
                Session["Username"] = txtusername.Text;
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Incorrect username or password";
            }
        }
    }
}