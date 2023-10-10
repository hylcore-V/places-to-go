using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;


public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnLogIn_Click(object sender, EventArgs e)
    {
        string salt = "";
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT usalt FROM UserTable WHERE uname = '" + txtusername.Text + "' or uemail = '" + txtusername.Text + "'", con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
            salt = reader.GetString(0);
        con.Close();

        if (!string.IsNullOrEmpty(salt))
        {
            string hashedPassword = HashPassword(txtpassword.Text, salt);
            con.Open();
            SqlCommand command = new SqlCommand("SELECT * FROM UserTable WHERE uname = '" + txtusername.Text + "' or uemail = '" + txtusername.Text + "' AND upassword = '" + hashedPassword + "'", con);
            SqlDataReader reader2 = command.ExecuteReader();
            if (reader2.Read())
            {
                int userId = reader2.GetInt32(0);
                Session["UserId"] = userId;
                Session["Username"] = reader2["uname"].ToString() ;
                string returnUrl = Request.QueryString["returnUrl"];
                if (!string.IsNullOrEmpty(returnUrl))
                {
                    Response.Redirect(returnUrl);
                }
                else
                {
                    Response.Redirect("index.aspx");
                }
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Invalid username or password.";
            }
        }
        else
        {
            lblmsg.Visible = true;
            lblmsg.Text = "User does not exist";
        }
        con.Close();
    }
    private string HashPassword(string password, string salt)
    {
        string combinedString = string.Concat(password, salt);
        byte[] saltedBytes = Encoding.UTF8.GetBytes(combinedString);
        SHA256 sha256 = SHA256.Create();
        byte[] hashedBytes = sha256.ComputeHash(saltedBytes);
        return Convert.ToBase64String(hashedBytes);
    }
}