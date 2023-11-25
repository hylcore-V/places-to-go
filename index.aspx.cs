using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

        if (HttpContext.Current.Session["UserId"] != null && HttpContext.Current.Session["UserName"] != null)
        {
            string UserId = Session["UserId"].ToString();
            string UserName = Session["UserName"].ToString();
        }
        if (!IsPostBack)
        {
            BindListView();
        }
    }

    public void BindListView()
    {
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select top 5 * from MainCategory where status = 1 ORDER BY NEWID()", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_onlycategories.DataSource = dt;
            lv_onlycategories.DataBind();
        }

        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT TOP 6 * FROM Place_Details_Table INNER JOIN MainCategory ON Place_Details_Table.cid = MainCategory.id INNER JOIN Continent_Table ON Place_Details_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON Place_Details_Table.countryid = Country_Table.id INNER JOIN State_Table ON Place_Details_Table.sid = State_Table.state_id INNER JOIN District_Table ON Place_Details_Table.did = District_Table.districtid ORDER BY Place_Details_Table.rts DESC",con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_placeList.DataSource = dt;
            lv_placeList.DataBind();
        }
        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT TOP 6 * FROM Place_Details_Table INNER JOIN MainCategory ON Place_Details_Table.cid = MainCategory.id INNER JOIN Continent_Table ON Place_Details_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON Place_Details_Table.countryid = Country_Table.id INNER JOIN State_Table ON Place_Details_Table.sid = State_Table.state_id INNER JOIN District_Table ON Place_Details_Table.did = District_Table.districtid ORDER BY NEWID()",con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_placeList2.DataSource = dt;
            lv_placeList2.DataBind();
        }
        using (SqlDataAdapter sda = new SqlDataAdapter("select * from MainCategory where status = 1 ORDER BY NEWID()",con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_categoryslider.DataSource = dt;
            lv_categoryslider.DataBind();
        }

        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT Place_Details_Table.placeName, Blog_Table.* FROM Place_Details_Table INNER JOIN Blog_Table ON Place_Details_Table.id = Blog_Table.pid WHERE Blog_Table.status = 1 ORDER BY NEWID()",con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_blogs.DataSource = dt;
            lv_blogs.DataBind();
        }
        con.Close();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string quer1 = "";
        if (txtkeywords.Text != "")
        {
            quer1 = "&&search=" + txtkeywords.Text + "";
            Response.Redirect("explore.aspx?query=go" + quer1 + "");
        }
        else if (txtlocation.Text != "")
        {
            quer1 = "&&search=" + txtlocation.Text + "";
            Response.Redirect("explore.aspx?query=go" + quer1 + "");
        }
        else if (txtcategory.Text != "")
        {
            quer1 = "&&search=" + txtcategory.Text + "";
            Response.Redirect("explore.aspx?query=go" + quer1 + "");
        }
        else
        {
            lblemptry.Visible = true;
            lblemptry.Text = "Please choose location, categories or enter keywords to get result !";
        }
    }

    protected void lv_categoryslider_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Label lblId = (Label)e.Item.FindControl("lblId");
        Label lblCatCount = (Label)e.Item.FindControl("lblCatCount");
        HiddenField1.Value = lblId.Text;
        SqlCommand command = new SqlCommand("SELECT COUNT(a.cid) FROM Place_Details_Table as a inner join MainCategory as b on a.cid=b.id where a.cid='" + lblId.Text + "'",con);
        int count = (int)command.ExecuteScalar();
        lblCatCount.Text = count.ToString();
        BindListView();
    }
}