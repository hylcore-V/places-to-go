using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlacesToGo : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);
    public static string uimage = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserId"] != null && HttpContext.Current.Session["UserName"] != null)
        {
            string UserId = Session["UserId"].ToString();
            string UserName = Session["UserName"].ToString();
            con.Open();
            SqlCommand cmdimg = new SqlCommand("select uimage from UserTable where uid = '" + Session["UserId"] + "'", con);
            uimage = "<img src='assets/Images/User/" + cmdimg.ExecuteScalar().ToString() + "' class='avater-img' style=''>";
            con.Close();
            BindListView();
            logoutdiv.Visible = false;
            logoutdiv2.Visible = false;
        }
        else
        {
            logindiv.Visible = false;
            logindiv2.Visible = false;
        }
        BindListView();
    }

    public void BindListView()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select top 7 id, categoryName from MainCategory", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_submenu.DataSource = dt;
            lv_submenu.DataBind();
            lv_submenu2.DataSource = dt;
            lv_submenu2.DataBind();
        }
        int GetcurrentYear = DateTime.Now.Year;
        currentYear.InnerHtml = GetcurrentYear.ToString();
        con.Close();
    }
    protected void BtnLogIn_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtusername.Text) || !string.IsNullOrEmpty(txtpassword.Text))
        {
            string salt = "";
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT usalt FROM UserTable WHERE uname = '" + txtusername.Text + "' or uemail = '" + txtusername.Text + "'", con);
            salt = cmd.ExecuteScalar().ToString();
            string hashedPassword = HashPassword(txtpassword.Text, salt);
            SqlCommand command = new SqlCommand("SELECT uid ,uname FROM UserTable WHERE uname = '" + txtusername.Text + "' or uemail = '" + txtusername.Text + "' AND upassword = '" + hashedPassword + "'", con);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                Session["UserId"] = reader[0].ToString();
                Session["Username"] = reader[1].ToString();
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
            lblmsg.Text = "please enter valid credentials !";
        }
    }
    private string HashPassword(string password, string salt)
    {
        string combinedString = string.Concat(password, salt);
        byte[] saltedBytes = Encoding.UTF8.GetBytes(combinedString);
        SHA256 sha256 = SHA256.Create();
        byte[] hashedBytes = sha256.ComputeHash(saltedBytes);
        return Convert.ToBase64String(hashedBytes);
    }
    protected void BtnSendOTP_Click(object sender, EventArgs e)
    {
        string emailOtp = "";
        con.Open();
        SqlCommand command = new SqlCommand("SELECT uid,uname,uemail FROM UserTable WHERE uemail = '" + txtEmailOTP.Text + "'", con);
        SqlDataReader reader = command.ExecuteReader();
        if (reader.Read())
        {
            emailOtp = reader[2].ToString();
            if (!string.IsNullOrEmpty(txtEmailOTP.Text) && !string.IsNullOrEmpty(emailOtp))
            {
                string otp = GenerateOTP();
                Session["OTP"] = otp;
                string email = txtEmailOTP.Text;
                SendOTP(email, otp);
                lblSendOTP.Visible = true;
                lblSendOTP.Text = "OTP has been sent to your email.";
            }
        }
        else
        {
            lblSendOTP.Visible = true;
            lblSendOTP.Text = "This email doesn't found / registered.";
        }
        con.Close();
    }

    private string GenerateOTP()
    {
        Random random = new Random();
        return random.Next(100000, 999999).ToString();
    }

    private void SendOTP(string email, string otp)
    {
        string changepwdURL = "http://placestogoto.com/forgot-password.aspx";
        MailMessage mailMessage = new MailMessage();
        mailMessage.From = new MailAddress("omopyt2020@gmail.com");
        mailMessage.To.Add(email);
        mailMessage.Subject = "Places To Go";
        mailMessage.Body = "Your OTP for password reset is: " + otp + "\nClick on the link to change password: " + changepwdURL;

        SmtpClient smtpClient = new SmtpClient();
        smtpClient.Host = "smtp.gmail.com";
        smtpClient.Port = 587;
        smtpClient.EnableSsl = true;
        smtpClient.Credentials = new NetworkCredential("omopyt2020@gmail.com", "jjkhsulyfsbgdvks");
        smtpClient.Send(mailMessage);
        lblSendOTP.Visible = true;
        lblSendOTP.Text = "OTP has been sent to your email.";
    }

    protected void AddBlog_Click(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserId"] != null && HttpContext.Current.Session["UserName"] != null)
        {
            Response.Redirect("add-blogs.aspx");
        }
        else
        {
            string returnUrl = HttpUtility.UrlEncode(Request.Url.PathAndQuery);
            Response.Redirect("login.aspx?returnUrl=" + returnUrl);
        }
    }
    protected void btnDashboard_Click(object sender, EventArgs e)
    {
        Response.Redirect("dashboard.aspx");
    }
}
