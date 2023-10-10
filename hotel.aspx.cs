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

public partial class hotel : System.Web.UI.Page
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
        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Hotel_Table where hotel_id='" + Request.QueryString["o"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_hotelIntro.DataSource = dt;
            lv_hotelIntro.DataBind();
            lv_hotelDetails.DataSource = dt;
            lv_hotelDetails.DataBind();
        }
        con.Close();
    }
}

