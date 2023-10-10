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

public partial class admin_PlaceInfoForm : System.Web.UI.Page
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
        using (SqlDataAdapter sda = new SqlDataAdapter("Select * From Place_Details_Table", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }

        using (SqlDataAdapter sda = new SqlDataAdapter("Select * From MainCategory", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddcid.DataSource = dt;
            ddcid.DataBind();
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
        string newFileName1 = "";
        if (placeImage1.HasFile)
        {
            foreach (HttpPostedFile file in placeImage1.PostedFiles)
            {
                newFileName1 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName1), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName1));
            }
        }
        string newFileName2 = "";
        if (placeImage2.HasFile)
        {
            foreach (HttpPostedFile file in placeImage2.PostedFiles)
            {
                newFileName2 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName2), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName2));
            }
        }

        string newFileName3 = "";
        if (placeImage3.HasFile)
        {
            foreach (HttpPostedFile file in placeImage3.PostedFiles)
            {
                newFileName3 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName3), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName3));
            }
        }

        string newFileName4 = "";
        if (placeImage4.HasFile)
        {
            foreach (HttpPostedFile file in placeImage4.PostedFiles)
            {
                newFileName4 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName4), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName4));
            }
        }

        string newFileName5 = "";
        if (placeImage5.HasFile)
        {
            foreach (HttpPostedFile file in placeImage5.PostedFiles)
            {
                newFileName5 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName5), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName5));
            }
        }

        String str = "";
        for (int i = 0; i <= chkList.Items.Count - 1; i++)
        {
            if (chkList.Items[i].Selected)
            {
                if (str == "")
                {
                    str = chkList.Items[i].Text;
                }
                else
                {
                    str += "," + chkList.Items[i].Text;
                }
            }
        }

        if (str == "")
        {
            lblchkList.Text = "Please select at least one"; return;
        }
        if (ddcountryid.SelectedValue != "99")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Place_Details_Table (cid, continentid, countryid, sid, did, cityname, placeName, placeImage1, placeImage2, placeImage3, placeImage4, placeImage5, placeMap, placeIntro, placeDiscription, transport, status, rts) VALUES ('" + ddcid.SelectedValue + "','" + ddcontinentid.SelectedValue + "','" + ddcountryid.SelectedValue + "','0','0','" + txtcity.Text + "','" + txtplace.Text + "','" + newFileName1 + "','" + newFileName2 + "','" + newFileName3 + "','" + newFileName4 + "','" + newFileName5 + "','" + txtplaceMap.Text + "', '" + txtplaceIntro.Text + "', '" + description.Text + "','" + str + "','1',getdate())", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        else
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Place_Details_Table (cid, continentid, countryid, sid, did, cityname, placeName, placeImage1, placeImage2, placeImage3, placeImage4, placeImage5, placeMap, placeIntro, placeDiscription, transport, status, rts) VALUES ('" + ddcid.SelectedValue + "','" + ddcontinentid.SelectedValue + "','" + ddcountryid.SelectedValue + "','" + ddsid.SelectedValue + "','" + dddid.SelectedValue + "','" + txtcity.Text + "','" + txtplace.Text + "','" + newFileName1 + "','" + newFileName2 + "','" + newFileName3 + "','" + newFileName4 + "','" + newFileName5 + "','" + txtplaceMap.Text + "', '" + txtplaceIntro.Text + "','" + description.Text + "','" + str + "','1',getdate())", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        Response.Write("Your data Sucessfully saved");
        chkList.SelectedIndex = -1;
        clear();
        BindListView();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        String str = "";
        for (int i = 0; i <= chkList.Items.Count - 1; i++)
        {
            if (chkList.Items[i].Selected)
            {
                if (str == "")
                {
                    str = chkList.Items[i].Text;
                }
                else
                {
                    str += "," + chkList.Items[i].Text;
                }
            }
        }

        if (str == "")
        {
            lblchkList.Text = "Please select at least one"; return;
        }
        string Idd = hdnvalue.Value;

        con.Open();

        if (placeImage1.HasFiles)
        {
            string newFileName1 = "";
            foreach (HttpPostedFile file in placeImage1.PostedFiles)
            {
                newFileName1 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName1), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName1));
                SqlCommand cmd = new SqlCommand("Update Place_Details_Table Set placeImage1 ='" + newFileName1 + "', cid='" + ddcid.SelectedValue + "', continentid='" + ddcontinentid.SelectedValue + "', countryid='" + ddcountryid.SelectedValue + "', sid='" + ddsid.SelectedValue + "', did='" + dddid.SelectedValue + "', cityname='" + txtcity.Text + "', placeName='" + txtplace.Text + "', placeMap='" + txtplaceMap.Text + "', placeIntro = '" + txtplaceIntro.Text + "', placeDiscription='" + description.Text + "', transport='" + str + "', status='1' where Id='" + Idd + "'", con);
                cmd.ExecuteNonQuery();
            }
        }

        if (placeImage2.HasFiles)
        {
            string newFileName2 = "";
            foreach (HttpPostedFile file in placeImage2.PostedFiles)
            {
                newFileName2 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName2), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName2));
                SqlCommand cmd = new SqlCommand("Update Place_Details_Table Set placeImage2 ='" + newFileName2 + "', cid='" + ddcid.SelectedValue + "', continentid='" + ddcontinentid.SelectedValue + "', countryid='" + ddcountryid.SelectedValue + "', sid='" + ddsid.SelectedValue + "', did='" + dddid.SelectedValue + "', cityname='" + txtcity.Text + "', placeName='" + txtplace.Text + "', placeMap='" + txtplaceMap.Text + "', placeIntro = '" + txtplaceIntro.Text + "', placeDiscription='" + description.Text + "', transport='" + str + "', status='1' where Id='" + Idd + "'", con);
                cmd.ExecuteNonQuery();
            }
        }

        if (placeImage3.HasFiles)
        {
            string newFileName3 = "";
            foreach (HttpPostedFile file in placeImage3.PostedFiles)
            {
                newFileName3 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName3), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName3));
                SqlCommand cmd = new SqlCommand("Update Place_Details_Table Set placeImage3 ='" + newFileName3 + "', cid='" + ddcid.SelectedValue + "', continentid='" + ddcontinentid.SelectedValue + "', countryid='" + ddcountryid.SelectedValue + "', sid='" + ddsid.SelectedValue + "',did='" + dddid.SelectedValue + "', cityname='" + txtcity.Text + "', placeName='" + txtplace.Text + "', placeMap='" + txtplaceMap.Text + "', placeIntro = '" + txtplaceIntro.Text + "', placeDiscription='" + description.Text + "', transport='" + str + "', status='1' where Id='" + Idd + "'", con);
                cmd.ExecuteNonQuery();
            }
        }

        if (placeImage4.HasFiles)
        {
            string newFileName4 = "";
            foreach (HttpPostedFile file in placeImage4.PostedFiles)
            {
                newFileName4 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName4), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName4));
                SqlCommand cmd = new SqlCommand("Update Place_Details_Table Set placeImage4 ='" + newFileName4 + "', cid='" + ddcid.SelectedValue + "', continentid='" + ddcontinentid.SelectedValue + "', countryid='" + ddcountryid.SelectedValue + "', sid='" + ddsid.SelectedValue + "',did='" + dddid.SelectedValue + "', cityname='" + txtcity.Text + "', placeName='" + txtplace.Text + "', placeMap='" + txtplaceMap.Text + "', placeIntro = '" + txtplaceIntro.Text + "', placeDiscription='" + description.Text + "', transport='" + str + "', status='1' where Id='" + Idd + "'", con);
                cmd.ExecuteNonQuery();
            }
        }

        if (placeImage5.HasFiles)
        {
            string newFileName5 = "";
            foreach (HttpPostedFile file in placeImage5.PostedFiles)
            {
                newFileName5 = Path.GetFileName(file.FileName);
                var encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(Encoder.Quality, 90L);
                System.Drawing.Image.FromStream(file.InputStream).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName5), ImageCodecInfo.GetImageEncoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid), encoderParams);
                System.Drawing.Image.FromStream(file.InputStream).GetThumbnailImage(640, 427, () => false, IntPtr.Zero).Save(Server.MapPath("~/assets/Images/PlcaeImages/" + newFileName5));
                SqlCommand cmd = new SqlCommand("Update Place_Details_Table Set placeImage5 ='" + newFileName5 + "', cid='" + ddcid.SelectedValue + "', continentid='" + ddcontinentid.SelectedValue + "', countryid='" + ddcountryid.SelectedValue + "', sid='" + ddsid.SelectedValue + "',did='" + dddid.SelectedValue + "', cityname='" + txtcity.Text + "', placeName='" + txtplace.Text + "', placeMap='" + txtplaceMap.Text + "', placeIntro = '" + txtplaceIntro.Text + "', placeDiscription='" + description.Text + "', transport='" + str + "', status='1' where Id='" + Idd + "'", con);
                cmd.ExecuteNonQuery();
            }
        }

        SqlCommand cmd2 = new SqlCommand("Update Place_Details_Table Set cid='" + ddcid.SelectedValue + "', continentid='" + ddcontinentid.SelectedValue + "', countryid='" + ddcountryid.SelectedValue + "', sid='" + ddsid.SelectedValue + "',did='" + dddid.SelectedValue + "', cityname='" + txtcity.Text + "', placeName='" + txtplace.Text + "', placeMap='" + txtplaceMap.Text + "', placeIntro = '" + txtplaceIntro.Text + "', placeDiscription='" + description.Text + "', transport='" + str + "', status='1' where Id='" + Idd + "'", con);
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
            Label lblId = (Label)e.Item.FindControl("lblId");
            Label lblcontinentid = (Label)e.Item.FindControl("lblcontinentid");
            Label lblcountryid = (Label)e.Item.FindControl("lblcountryid");
            Label lblcid = (Label)e.Item.FindControl("lblcid");
            Label lblsid = (Label)e.Item.FindControl("lblsid");
            Label lbldid = (Label)e.Item.FindControl("lbldid");
            Label lblcityname = (Label)e.Item.FindControl("lblcityname");
            Label lblplaceName = (Label)e.Item.FindControl("lblplaceName");
            FileUpload lblplaceImage1 = (FileUpload)e.Item.FindControl("lblplaceImage1");
            FileUpload lblplaceImage2 = (FileUpload)e.Item.FindControl("lblplaceImage2");
            FileUpload lblplaceImage3 = (FileUpload)e.Item.FindControl("lblplaceImage3");
            FileUpload lblplaceImage4 = (FileUpload)e.Item.FindControl("lblplaceImage4");
            FileUpload lblplaceImage5 = (FileUpload)e.Item.FindControl("lblplaceImage5");
            Label lblplaceMap = (Label)e.Item.FindControl("lblplaceMap");
            Label lblplaceIntro = (Label)e.Item.FindControl("lblplaceIntro");
            Label lblplaceDiscription = (Label)e.Item.FindControl("lblplaceDiscription");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblId.Text;
            ddcontinentid.SelectedValue = lblcontinentid.Text;
            ddcountryid.SelectedValue = lblcountryid.Text;
            ddcid.SelectedValue = lblcid.Text;
            ddsid.SelectedValue = lblsid.Text;
            dddid.SelectedValue = lbldid.Text;
            txtcity.Text = lblcityname.Text;
            txtplace.Text = lblplaceName.Text;
            placeImage1 = lblplaceImage1;
            placeImage2 = lblplaceImage2;
            placeImage3 = lblplaceImage3;
            placeImage4 = lblplaceImage4;
            placeImage5 = lblplaceImage5;
            txtplaceMap.Text = lblplaceMap.Text;
            txtplaceIntro.Text = lblplaceIntro.Text;
            description.Text = lblplaceDiscription.Text;

            string[] sstr = new string[100];
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Place_Details_Table where id ='" + lblId.Text + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                sstr = dr["transport"].ToString().Split(',');
            }
            int length = sstr.Length;
            for (int i = 0; i <= sstr.Length - 1; i++)
            {
                string cntry = sstr[i];
                for (int j = 0; j <= chkList.Items.Count - 1; j++)
                {
                    if (chkList.Items[j].Value == sstr[i])
                    {
                        chkList.Items[j].Selected = true;
                        break;
                    }
                }
            }
            con.Close();

            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From Place_Details_Table Where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
            clear();
        }

        if (e.CommandName == "Active")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Place_Details_Table Set status='1' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Place_Details_Table Set status='0' where Id='" + lblId.Text + "'", con);
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
        ddcid.ClearSelection();
        ddcontinentid.ClearSelection();
        ddcountryid.ClearSelection();
        ddsid.ClearSelection();
        dddid.ClearSelection();
        txtcity.Text = "";
        txtplace.Text = "";
        txtplaceMap.Text = "";
        txtplaceIntro.Text = "";
        description.Text = "";
        chkList.ClearSelection();
    }
    protected void ChangeStatus(object sender, EventArgs e) { }
    protected void lbtnStatus_Click(object sender, EventArgs e) { }
    protected void ddcid_SelectedIndexChanged(object sender, EventArgs e) { }
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
    protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e) { }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        Response.Redirect("AddNearbyPlaces.aspx");
    }
    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e) { }
}