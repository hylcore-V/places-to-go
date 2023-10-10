using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class blog_detail : System.Web.UI.Page
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
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select a.placeName,b.*,c.categoryName from Place_Details_Table as a inner join Blog_Table as b on a.id=b.pid inner join MainCategory as c on a.cid=c.id where b.status = 1 and b.id = '" + Request.QueryString["id"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_blogs.DataSource = dt;
            lv_blogs.DataBind();
           // blogCount.InnerHtml = dt.Rows.Count.ToString();
        }

        using (SqlDataAdapter sda = new SqlDataAdapter("select a.placeName,b.*,c.categoryName from Place_Details_Table as a inner join Blog_Table as b on a.id=b.pid inner join MainCategory as c on a.cid=c.id where b.status = 1", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_blogcat.DataSource = dt;
            lv_blogcat.DataBind();
            lv_trendingBlogs.DataSource = dt;
            lv_trendingBlogs.DataBind();
            lv_blogTags.DataSource = dt;
            lv_blogTags.DataBind();
        }
        con.Close();
    }
}