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
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);
    public static string uimage="";
    public static string uaddress = "";

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
        SqlCommand cmdimg = new SqlCommand("select uimage from UserTable where uid = '" + Session["UserId"] + "'", con);
        uimage = "<img src='assets/Images/User/" + cmdimg.ExecuteScalar().ToString() + "' class='img-fluid avater' style=''>";

        SqlCommand cmdaddress = new SqlCommand("select ucity, ucountry from UserTable where uid = '" + Session["UserId"] + "'", con);
        uaddress = cmdaddress.ExecuteScalar().ToString();
        
        SqlCommand cmdappoveblog = new SqlCommand("select COUNT(*) from Blog_Table where blogAuthorId='" + Session["UserId"] + "' and status = 1", con);
        lblapprove.Text = cmdappoveblog.ExecuteScalar().ToString();
        
        SqlCommand cmdpending = new SqlCommand("select COUNT(*) from Blog_Table where blogAuthorId='" + Session["UserId"] + "' and status = 0", con);
        lblpending.Text = cmdpending.ExecuteScalar().ToString();
        con.Close();
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