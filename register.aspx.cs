using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

public partial class register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private Image GenerateProfileImage(string username)
    {
        int width = 200;
        int height = 200;
        Bitmap bmp = new Bitmap(width, height);
        using (Graphics g = Graphics.FromImage(bmp))
        {
            g.Clear(Color.GreenYellow);
            using (Font font = new Font("Arial", 72, FontStyle.Bold))
            {
                using (Brush brush = new SolidBrush(Color.White))
                {
                    g.TextRenderingHint = TextRenderingHint.AntiAliasGridFit;
                    string initials = GetInitials(username);
                    SizeF initialsSize = g.MeasureString(initials, font);
                    PointF initialsPosition = new PointF((bmp.Width - initialsSize.Width) / 2, (bmp.Height - initialsSize.Height) / 2);
                    g.DrawString(initials, font, brush, initialsPosition);
                }
            }
        }
        bmp.Save(Server.MapPath("~/assets/Images/User/" + username + ".jpeg"));
        return bmp;
    }

    public string GetInitials(string username)
    {
        username = txtusername.Text;
        string[] parts = username.Split('.');
        string initials = "";
        foreach (string part in parts)
        {
            if (part.Length > 0)
            {
                initials += part[0];
            }
            if (initials.Length >= 2)
            {
                break;
            }
        }
        if (initials.Length < 2)
        {
            initials = username.Substring(0, Math.Min(2, username.Length));
        }
        return initials.ToUpper();
    }

    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtusername.Text) && string.IsNullOrEmpty(txtemail.Text) && string.IsNullOrEmpty(txtpassword.Text) && string.IsNullOrEmpty(txtconfirmpassword.Text))
        {
            lblbtn.Text = "Please enter a values to Register.";
            return;
        }
        else
        {
            string userimage = txtusername.Text + ".jpeg";
            GenerateProfileImage(txtusername.Text);
            string salt = GenerateSalt();
            string hashedPassword = HashPassword(txtpassword.Text, salt);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into UserTable (uname, uemail, umobile, upassword, usalt, uimage, uaddress, ucity, ucountry, uzipcode, uabout, ufb, uig, utwitter, ulinkedin, status, rts) values ('" + txtusername.Text.Trim() + "','" + txtemail.Text.Trim() + "', '' ,'" + hashedPassword + "', '" + salt + "', '" + userimage + "' , '' , '' , '' , '' , '' , '' , '' , '' , '' , '1' ,getdate()) ", con);
            cmd.ExecuteNonQuery();
            //send_mail(txtusername.Text, txtemail.Text, txtpassword.Text);
            clear();
            con.Close();
            Response.Redirect("login.aspx");
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
    public void send_mail(string username, string email, string password)
    {
        con.Open();
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("Username :- " + username + "<br>");
        sb.AppendLine("Email :- " + email + "<br>");
        sb.AppendLine("Password :- " + password + "<br>");
        string to = txtemail.Text;
        string from = "omopyt2020@gmail.com"; //From address    
        MailMessage message = new MailMessage(from, email);

        message.Subject = "Registration Information On Places To Go : ";
        message.Body = sb.ToString();
        message.BodyEncoding = Encoding.UTF8;
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
        System.Net.NetworkCredential basicCredential1 = new
        System.Net.NetworkCredential("omopyt2020@gmail.com", "jjkhsulyfsbgdvks");
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = basicCredential1;
        client.Send(message);
        con.Close();
    }
    public void clear()
    {
        txtusername.Text = "";
        txtemail.Text = "";
        txtpassword.Text = "";
        txtconfirmpassword.Text = "";
    }
    private bool IsValidEmail(string email)
    {
        var regex = new Regex(@"^[\w!#$%&'*+\-/=?\^_`{|}~]+(\.[\w!#$%&'*+\-/=?\^_`{|}~]+)*" + "@" + @"((([\-\w]+\.)+[a-zA-Z]{2,4})|(([0-9]{1,3}\.){3}[0-9]{1,3}))$");
        return regex.IsMatch(email);
    }
    protected void txtemail_TextChanged(object sender, EventArgs e)
    {
        if (IsValidEmail(txtemail.Text))
        {
            lblemail.Text = "";
        }
        else
        {
            lblemail.Visible = true;
            lblemail.Text = "Invalid email address or in invalid format";
        }

        con.Open();
        SqlCommand cmd = new SqlCommand("select uemail from UserTable where uemail = '" + txtemail.Text + "'", con);
        object result = cmd.ExecuteScalar();
        if (result != null)
        {
            lblemail.Visible = true;
            lblemail.Text = "Email already exists in the database";
        }
        con.Close();
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
        }
        else { lblconfirmpassword.Visible = false; }
    }
    protected void txtusername_TextChanged(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select uname from UserTable where uname = '" + txtusername.Text + "'", con);
        object result = cmd.ExecuteScalar();
        if (result != null)
        {
            lblusername.Visible = true;
            lblusername.Text = "This username is not available ! Please select other.";
        }
        con.Close();
    }
}