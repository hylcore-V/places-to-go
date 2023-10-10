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
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_blogs : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserId"] != null && HttpContext.Current.Session["UserName"] != null)
        {
            //string UserId = Session["UserNameEmail"].ToString();
            //string UserName = Session["UserNameEmail"].ToString();
            BindListView();
        }
        else
        {
        //    showPopup("Wants to write a blog ?", "To write a blog you need to login !");
            Response.Redirect("index.aspx");
        }
    }
    public void BindListView()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("Select * From MainCategory where status = 1", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddcid.DataSource = dt;
            ddcid.DataBind();
        }
        con.Close();

        ddpid.Items.Clear();
        ddpid.DataBind();
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("Select * From Place_Details_Table where cid = '" + ddcid.SelectedValue + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddpid.DataSource = dt;
            ddpid.DataBind();
        }
        con.Close();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string blogsImage = "";
        foreach (HttpPostedFile file in blogsUpload.PostedFiles)
        {
            blogsImage = Path.GetFileName(file.FileName);
            var encoderParams = new EncoderParameters(1);
            encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
            System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("assets/Images/BlogImages/" + blogsImage), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
            System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("assets/Images/BlogImages/" + blogsImage));
        }

        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO Blog_Table (cid, pid, blogImage, blogAuthorId, blogAuthor, blogTitle, blogTags, blogDescription, status, rts) VALUES ('" + ddcid.SelectedValue + "', '" + ddpid.SelectedValue + "', '" + blogsImage + "','" + Session["UserId"] + "','" + blogAuthor.Text + "','" + blogTitle.Text + "', '" + blogTags.Text + "', '" + blogDescription.Text + "', '0' ,getdate())", con);
        cmd.ExecuteNonQuery();
        con.Close();
        clear();
    }
    private void showPopup(string title, string body)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
    }

    public void clear()
    {
        ddcid.Items.Clear();
        ddpid.Items.Clear();
        blogAuthor.Text = "";
        blogTitle.Text = "";
        blogTags.Text = "";
        blogDescription.Text = "";
    }
    protected void ddcid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddpid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnSendToLogin_Click(object sender, EventArgs e)
    {
        string returnUrl = HttpUtility.UrlEncode(Request.Url.PathAndQuery);
        Response.Redirect("login.aspx?returnUrl=" + returnUrl);
    }
    protected void btncancle_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}