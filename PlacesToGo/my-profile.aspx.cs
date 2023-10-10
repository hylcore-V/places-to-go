using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class my_profile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);

    public static string uimage1 = "";
    public static string uaddress1 = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserId"] != null && HttpContext.Current.Session["UserName"] != null)
        {
            string UserId = Session["UserId"].ToString();
            string UserName = Session["UserName"].ToString();

            if (!IsPostBack)
            {
                BindListView();
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
    public void BindListView()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select * from UserTable where uid = '" + Session["UserId"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            uname.Text = dt.Rows[0]["uname"].ToString();
            uemail.Text = dt.Rows[0]["uemail"].ToString();
            umobile.Text = dt.Rows[0]["umobile"].ToString();
            uaddress.Text = dt.Rows[0]["uaddress"].ToString();
            ucity.Text = dt.Rows[0]["ucity"].ToString();
            ucountry.Text = dt.Rows[0]["ucountry"].ToString();
            uzipcode.Text = dt.Rows[0]["uzipcode"].ToString();
            uabout.Text = dt.Rows[0]["uabout"].ToString();
        }

        SqlCommand cmdimg = new SqlCommand("select uimage from UserTable where uid = '" + Session["UserId"] + "'", con);
        uimage1 = "<img src='assets/Images/User/" + cmdimg.ExecuteScalar().ToString() + "' class='img-fluid avater' style=''>";

        SqlCommand cmdaddress = new SqlCommand("select ucity, ucountry from UserTable where uid = '" + Session["UserId"] + "'", con);
        uaddress1 = cmdaddress.ExecuteScalar().ToString();
        con.Close();
    }
    protected void btnSaveChanges_Click(object sender, EventArgs e)
    {
        con.Open();
        if (uimage.HasFiles)
        {
            string newFileName1 = "";
            foreach (HttpPostedFile file in uimage.PostedFiles)
            {
                newFileName1 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 100L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/User/" + newFileName1), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(197, 204, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/User/" + newFileName1));
                SqlCommand cmd = new SqlCommand("Update UserTable set uname = '" + uname.Text + "', uemail = '" + uemail.Text + "', umobile = '" + umobile.Text + "', uaddress = '" + uaddress.Text + "', ucity = '" + ucity.Text + "', ucountry = '" + ucountry.Text + "', uzipcode = '" + uzipcode.Text + "', uabout = '" + uabout.Text + "'", con);
                cmd.ExecuteNonQuery();
            }
        }

        SqlCommand cmd2 = new SqlCommand("Update UserTable set uname = '" + uname.Text + "', uemail = '" + uemail.Text + "', umobile = '" + umobile.Text + "', uaddress = '" + uaddress.Text + "', ucity = '" + ucity.Text + "', ucountry = '" + ucountry.Text + "', uzipcode = '" + uzipcode.Text + "', uabout = '" + uabout.Text + "' where uid = '" + Session["UserId"] + "'", con);
        cmd2.ExecuteNonQuery();
        con.Close();
        clear();
        BindListView();
    }
    public void clear()
    { }
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