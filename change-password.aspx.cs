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
using System.Web.Security;

public partial class change_password : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);
    public static string toemail = "";
    public static string uimage = "";
    public static string uaddress = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserId"] != null && HttpContext.Current.Session["UserName"] != null)
        {
            string UserId = Session["UserId"].ToString();
            string UserName = Session["UserName"].ToString();

            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmdimg = new SqlCommand("select uimage from UserTable where uid = '" + Session["UserId"] + "'", con);
                uimage = "<img src='assets/Images/User/" + cmdimg.ExecuteScalar().ToString() + "' class='img-fluid avater' style=''>";

                SqlCommand cmdaddress = new SqlCommand("select ucity, ucountry from UserTable where uid = '" + Session["UserId"] + "'", con);
                uaddress = cmdaddress.ExecuteScalar().ToString();

                SqlCommand cmd = new SqlCommand("SELECT uemail FROM UserTable WHERE uid = '" + Session["UserId"] + "'", con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    toemail = reader.GetString(0);
                }
                con.Close();
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtpassword.Text) && string.IsNullOrEmpty(txtconfirmpassword.Text))
        {
            lblbtn.Visible = true;
            lblbtn.Text = "Please enter a values.";
            return;
        }
        else
        {
            string salt = GenerateSalt();
            string hashedPassword = HashPassword(txtconfirmpassword.Text, salt);
            con.Open();
            SqlCommand cmd = new SqlCommand("update UserTable set upassword = '" + hashedPassword + "', usalt = '" + salt + "'", con);
            cmd.ExecuteNonQuery();
            send_mail(txtconfirmpassword.Text);
            clear();
            con.Close();
            lblbtn.Visible = true;
            lblbtn.Text = "Password has been updated !";
        }
    }

    private string GenerateSalt()
    {
        byte[] saltBytes = new byte[16];
        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
        rng.GetBytes(saltBytes);
        return Convert.ToBase64String(saltBytes);
    }

    private string HashPassword(string password, string salt)
    {
        string combinedString = string.Concat(password, salt);
        byte[] saltedBytes = Encoding.UTF8.GetBytes(combinedString);
        SHA256 sha256 = SHA256.Create();
        byte[] hashedBytes = sha256.ComputeHash(saltedBytes);
        return Convert.ToBase64String(hashedBytes);
    }

    public void send_mail(string password)
    {
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("Password :- " + password + "<br>");
        MailMessage message = new MailMessage("omopyt2020@gmail.com", toemail);
        message.Subject = "Your Changed Password for places to go is : ";
        message.Body = sb.ToString();
        message.BodyEncoding = Encoding.UTF8;
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("smtp.gmail.com", 587); 
        System.Net.NetworkCredential basicCredential1 = new
        System.Net.NetworkCredential("omopyt2020@gmail.com", "jjkhsulyfsbgdvks");
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = basicCredential1;
        client.Send(message);
    }

    public void clear()
    {
        txtpassword.Text = "";
        txtconfirmpassword.Text = "";
    }

    private bool IsValidEmail(string email)
    {
        var regex = new Regex(@"^[\w!#$%&'*+\-/=?\^_`{|}~]+(\.[\w!#$%&'*+\-/=?\^_`{|}~]+)*" + "@" + @"((([\-\w]+\.)+[a-zA-Z]{2,4})|(([0-9]{1,3}\.){3}[0-9]{1,3}))$");
        return regex.IsMatch(email);
    }
    private bool IsValidPassword(string password)
    {
        var regex = new Regex(@"^\d{4}$");
        return regex.IsMatch(password);
    }
    protected void txtpassword_TextChanged(object sender, EventArgs e)
    {
        if (IsValidPassword(txtpassword.Text) && txtpassword.Text.Length >= 4)
        {
            lblpassword.Text = "";
        }
        else
        {
            lblpassword.Visible = true;
            lblpassword.Text = "Password must be at least 4 character/digit length";
        }

        bool hasLetter = false;
        bool hasDigit = false;

        foreach (char c in txtpassword.Text)
        {
            if (char.IsLetter(c))
            {
                hasLetter = true;
            }
            if (char.IsDigit(c))
            {
                hasDigit = true;
            }
            if (hasLetter && hasDigit)
            {
                break;
            }
        }

        if (hasLetter && hasDigit)
        {
            lblpassword.Text = "";
        }
        else
        {
            lblpassword.Visible = true;
            lblpassword.Text = "Invalid password. Password must contain at least one letter and one number.";
        }
    }
    protected void txtconfirmpassword_TextChanged(object sender, EventArgs e)
    {
        if (txtpassword.Text != txtconfirmpassword.Text)
        {
            lblconfirmpassword.Visible = true;
            lblconfirmpassword.Text = "Passwords do not match.";
            return;
        }
    }
    
    protected void BtnLogOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Abandon();
        HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
        cookie1.Expires = DateTime.Now.AddYears(-1);
        Response.Cookies.Add(cookie1);
        HttpCookie cookie2 = new HttpCookie("ASP.NET_SessionId", "");
        cookie2.Expires = DateTime.Now.AddYears(-1);
        Response.Cookies.Add(cookie2);
        Response.Redirect("index.aspx");
    }
}