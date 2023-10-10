using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        string emailOtp = "";
        con.Open();
        SqlCommand command = new SqlCommand("SELECT uid,uname,uemail FROM UserTable WHERE uname = '" + txtusername.Text + "' or uemail = '" + txtusername.Text + "'", con);
        SqlDataReader reader = command.ExecuteReader();
        if (reader.Read())
        {
            emailOtp = reader[2].ToString();
            if (HttpContext.Current.Session["OTP"].ToString() == txtotp.Text && !string.IsNullOrEmpty(emailOtp))
            {
                Session["UserId"] = reader[0].ToString();
                Session["UserName"] = reader[1].ToString();
                Response.Redirect("http://localhost:24340/change-password.aspx");
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "This entered OTP is incorrect or expired.";
            }
        }
        else
        {
            lblmsg.Visible = true;
            lblmsg.Text = "This email / username isn't available.";
        }
    }
}