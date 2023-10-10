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

public partial class admin_CategoryForm : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
        }
        if (Session["Username"] != null)
        {
            string Username = (string)Session["Username"];
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    public void BindListView()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM MainCategory", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string newFileName1 = "";
        if (categoryImage.HasFile)
        {
            foreach (HttpPostedFile file in categoryImage.PostedFiles)
            {
                newFileName1 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/CategoryImages/" + newFileName1), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/CategoryImages/" + newFileName1));
            }
        }

        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO MainCategory (categoryName, categoryImage, status, rts) VALUES ('" + txtcategoryName.Text + "','" + newFileName1 + "','1',getdate())", con);
        cmd.ExecuteNonQuery();
        con.Close();
        clear();
        BindListView();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string Idd = hdnvalue.Value;
        con.Open();

        if (categoryImage.HasFile)
        {
            string newFileName1 = "";
            foreach (HttpPostedFile file in categoryImage.PostedFiles)
            {
                newFileName1 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/CategoryImages/" + newFileName1), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/CategoryImages/" + newFileName1));
                SqlCommand cmd = new SqlCommand("Update MainCategory Set categoryImage='" + newFileName1 + "', categoryName='" + txtcategoryName.Text + "', status='1' where id='" + Idd + "'", con);
                cmd.ExecuteNonQuery();
            }
        }
        SqlCommand cmd2 = new SqlCommand("Update MainCategory Set categoryName='" + txtcategoryName.Text + "', status='1' where id='" + Idd + "'", con);
        cmd2.ExecuteNonQuery();
        con.Close();
        BindListView();
        clear();
        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            Label lblcategoryName = (Label)e.Item.FindControl("lblcategoryName");
            FileUpload lblcategoryImage = (FileUpload)e.Item.FindControl("lblcategoryImage");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblid.Text;
            txtcategoryName.Text = lblcategoryName.Text;
            categoryImage = lblcategoryImage;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From MainCategory Where id='" + lblid.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
            clear();
        }

        if (e.CommandName == "Active")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update MainCategory Set status='1' where id='" + lblid.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update MainCategory Set status='0' where id='" + lblid.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();

        }
    }

    protected void ChangeStatus(object sender, EventArgs e)
    {

    }

    protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }

    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clear();
        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
    }

    protected void clear()
    {
        txtcategoryName.Text = "";
    }

    protected void lbtnStatus_Click(object sender, EventArgs e)
    {

    }

}