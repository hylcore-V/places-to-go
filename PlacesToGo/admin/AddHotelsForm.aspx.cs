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

public partial class admin_AddHotelsForm : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Username"] != null)
            {
                string Username = (string)Session["Username"];
                BindListView();
                if (Request.QueryString.Count > 0)
                {
                    dd_lists.Visible = false;
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }

    public void BindListView()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Hotel_Table INNER JOIN Continent_Table ON Hotel_Table.continent_id = Continent_Table.id INNER JOIN Country_Table ON Hotel_Table.country_id = Country_Table.id INNER JOIN State_Table ON Hotel_Table.state_id = State_Table.state_id INNER JOIN District_Table ON Hotel_Table.district_id = District_Table.districtid", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
        using (SqlDataAdapter sda = new SqlDataAdapter("Select * From Continent_Table", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddcontinentid.DataSource = dt;
            ddcontinentid.DataBind();
        }

        using (SqlDataAdapter sda = new SqlDataAdapter("Select * From Country_Table", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddcountryid.DataSource = dt;
            ddcountryid.DataBind();
        }

        using (SqlDataAdapter sda = new SqlDataAdapter("Select * From State_Table", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddsid.DataSource = dt;
            ddsid.DataBind();
        }

        using (SqlDataAdapter sda = new SqlDataAdapter("Select * From District_Table", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            dddid.DataSource = dt;
            dddid.DataBind();
        }
        con.Close();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string HotelImageFile = "";
        foreach (HttpPostedFile file in txthotelimg.PostedFiles)
        {
            HotelImageFile = Path.GetFileName(file.FileName);
            var encoderParams = new EncoderParameters(1);
            encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
            System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/HotelImages/" + HotelImageFile), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
            System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/HotelImages/" + HotelImageFile));
        }
        con.Open();
        if (Request.QueryString.Count > 0)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Hotel_Table (continent_id, country_id, state_id, district_id, hotel_city, hotel_name, hotel_image, hotel_address, hotel_details, status, rts) VALUES ('" + Request.QueryString["continent"] + "','" + Request.QueryString["country"] + "','" + Request.QueryString["state"] + "','" + Request.QueryString["district"] + "','" + txtcity.Text + "','" + txthotelname.Text + "','" + HotelImageFile + "','" + txthoteladdress.Text + "','" + hoteldescription.Text + "','1',getdate())", con);
            cmd.ExecuteNonQuery();
        }
        else
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Hotel_Table (continent_id, country_id, state_id, district_id, hotel_city, hotel_name, hotel_image, hotel_address, hotel_details, status, rts) VALUES ('" + ddcontinentid.SelectedValue + "','" + ddcountryid.SelectedValue + "','" + ddsid.SelectedValue + "','" + dddid.SelectedValue + "','" + txtcity.Text + "','" + txthotelname.Text + "','" + HotelImageFile + "','" + txthoteladdress.Text + "','" + hoteldescription.Text + "','1',getdate())", con);
            cmd.ExecuteNonQuery();
        }
        con.Close();
        clear();
        BindListView();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string Idd = hdnvalue.Value;
        con.Open();
        if (txthotelimg.HasFiles)
        {
            string HotelImageFile = "";
            foreach (HttpPostedFile file in txthotelimg.PostedFiles)
            {
                HotelImageFile = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/HotelImages/" + HotelImageFile), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(400, 400, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/HotelImages/" + HotelImageFile));
                SqlCommand cmd = new SqlCommand("Update Hotel_Table Set hotel_image ='" + HotelImageFile + "', hotel_city='" + txtcity.Text + "', hotel_name='" + txthotelname.Text + "', hotel_address='" + txthoteladdress.Text + "',hotel_details='" + hoteldescription.Text + "', status='1'", con);
                cmd.ExecuteNonQuery();
            }
        }

        SqlCommand cmd2 = new SqlCommand("Update Hotel_Table Set  hotel_city='" + txtcity.Text + "', hotel_name='" + txthotelname.Text + "', hotel_address='" + txthoteladdress.Text + "',hotel_details='" + hoteldescription.Text + "', status='1'", con);
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
            Label lblhotel_id = (Label)e.Item.FindControl("lblId");
            Label lblhotel_city = (Label)e.Item.FindControl("lblhotel_city");
            Label lblhotel_name = (Label)e.Item.FindControl("lblhotel_name");
            FileUpload lblhotel_image = (FileUpload)e.Item.FindControl("lblhotel_image");
            Label lblhotel_address = (Label)e.Item.FindControl("lblhotel_address");
            Label lblhotel_details = (Label)e.Item.FindControl("lblhotel_details");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblhotel_id.Text;
            txtcity.Text = lblhotel_city.Text;
            txthotelname.Text = lblhotel_name.Text;
            txthotelimg = lblhotel_image;
            txthoteladdress.Text = lblhotel_address.Text;
            hoteldescription.Text = lblhotel_details.Text;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblhotel_id = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From Hotel_Table where hotel_id='" + lblhotel_id.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
            clear();
        }

        if (e.CommandName == "Active")
        {
            Label lblhotel_id = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Hotel_Table Set status='1' where hotel_id='" + lblhotel_id.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblhotel_id = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Hotel_Table Set status='0' where hotel_id='" + lblhotel_id.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clear();
        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
    }
    protected void clear()
    {
        txtcity.Text = "";
        txthotelname.Text = "";
        txthoteladdress.Text = "";
        hoteldescription.Text = "";
    }
    protected void ChangeStatus(object sender, EventArgs e)
    {

    }
    protected void lbtnStatus_Click(object sender, EventArgs e)
    {
    }
    protected void ddcontinentid_SelectedIndexChanged(object sender, EventArgs e) { }
    protected void ddcountryid_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddcountryid.SelectedValue != "99")
        {
            ddsid.Visible = false;
            dddid.Visible = false;
            lblddsid.Visible = false;
            lbldddid.Visible = false;
        }
    }
    protected void ddsid_SelectedIndexChanged(object sender, EventArgs e) { }
    protected void dddid_SelectedIndexChanged(object sender, EventArgs e) { }
    protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
}