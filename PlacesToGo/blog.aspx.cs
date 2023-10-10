using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class blog : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
        }
    }

    public void BindListView()
    {
        if (Request.QueryString.Count > 0)
        {
            con.Open();
            using (SqlDataAdapter sda = new SqlDataAdapter("select a.placeName,b.* from Place_Details_Table as a inner join Blog_Table as b on a.id=b.pid where b.cid='" + Request.QueryString["category"] + "' and b.status = 1", con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_blogs.DataSource = dt;
                lv_blogs.DataBind();
            }
            con.Close();
        }
        else
        {
            con.Open();
            using (SqlDataAdapter sda = new SqlDataAdapter("select a.placeName,b.* from Place_Details_Table as a inner join Blog_Table as b on a.id=b.pid where b.status = 1", con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_blogs.DataSource = dt;
                lv_blogs.DataBind();
            }
            con.Close();
        }
    }
    protected void lv_blogs_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        DataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        this.BindListView();
    }
}