using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class explore : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);

    public static string MPId = "";
    public static string SPMId = "";
    public static string SPSId = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
        }
    }
    List<int> idList = new List<int>(); // create an empty list to store the IDs
    public void BindListView()
    {
        int rowCount;
        int rowCount2;
        if (Request.QueryString.Count > 0)
        {
            con.Open();
            using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Place_Details_Table INNER JOIN MainCategory ON Place_Details_Table.cid = MainCategory.id INNER JOIN Continent_Table ON Place_Details_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON Place_Details_Table.countryid = Country_Table.id INNER JOIN State_Table ON Place_Details_Table.sid = State_Table.state_id INNER JOIN District_Table ON Place_Details_Table.did = District_Table.districtid where cityname ='" + Request.QueryString["search"] + "' or categoryName like '%" + Request.QueryString["search"] + "%' or placeName like '%" + Request.QueryString["search"] + "%' or district_title like '%" + Request.QueryString["search"] + "%' or state_title like '%" + Request.QueryString["search"] + "%' or name like '%" + Request.QueryString["search"] + "%' or continent_name like '%" + Request.QueryString["search"] + "%'", con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_explore.DataSource = dt;
                lv_explore.DataBind();
                rowCount = dt.Rows.Count;
                lblRowCount.Text = "Results : " + rowCount.ToString();
                if (dt.Rows.Count == 0)
                {
                    mainplaces.Visible = false;
                }
            }
            using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM NearbyPlaces_Table INNER JOIN Continent_Table ON NearbyPlaces_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON NearbyPlaces_Table.countryid = Country_Table.id INNER JOIN State_Table ON NearbyPlaces_Table.sid = State_Table.state_id INNER JOIN District_Table ON NearbyPlaces_Table.did = District_Table.districtid where placeName like '%" + Request.QueryString["search"] + "%' or  categoryName like '%" + Request.QueryString["search"] + "%' or cityname like '%" + Request.QueryString["search"] + "%' or district_title like '%" + Request.QueryString["search"] + "%' or state_title like '%" + Request.QueryString["search"] + "%' or name like '%" + Request.QueryString["search"] + "%' or continent_name like '%" + Request.QueryString["search"] + "%'", con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_explore2.DataSource = dt;
                lv_explore2.DataBind();
                rowCount2 = dt.Rows.Count + rowCount;
                lblRowCount.Text = "Results Found: " + rowCount2.ToString();
                if (dt.Rows.Count == 0)
                {
                    nearbyplaces.Visible = false;
                }
            }
            con.Close();
        }
        else
        {
            con.Open();

            using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Place_Details_Table INNER JOIN MainCategory ON Place_Details_Table.cid = MainCategory.id INNER JOIN Continent_Table ON Place_Details_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON Place_Details_Table.countryid = Country_Table.id INNER JOIN State_Table ON Place_Details_Table.sid = State_Table.state_id INNER JOIN District_Table ON Place_Details_Table.did = District_Table.districtid order by newid()", con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_explore.DataSource = dt;
                lv_explore.DataBind();
                rowCount = dt.Rows.Count;
                lblRowCount.Text = "Results Found: " + rowCount.ToString();
                if (dt.Rows.Count == 0)
                {
                    nearbyplaces.Visible = false;
                }
            }

            using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM NearbyPlaces_Table INNER JOIN Continent_Table ON NearbyPlaces_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON NearbyPlaces_Table.countryid = Country_Table.id INNER JOIN State_Table ON NearbyPlaces_Table.sid = State_Table.state_id INNER JOIN District_Table ON NearbyPlaces_Table.did = District_Table.districtid order by newid()", con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_explore2.DataSource = dt;
                lv_explore2.DataBind();
                rowCount2 = dt.Rows.Count + rowCount;
                lblRowCount.Text = "Results Found: " + rowCount2.ToString();
                if (dt.Rows.Count == 0)
                {
                    nearbyplaces.Visible = false;
                }
            }
            con.Close();
        }
    }


    protected string GetFirstWords(object descriptionObj)
    {
        string description = descriptionObj as string;

        if (string.IsNullOrEmpty(description))
        {
            return string.Empty;
        }

        string[] words = description.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

        if (words.Length == 0)
        {
            return string.Empty;
        }

        return string.Join(" ", words.Take(11));
    }
    protected void ss_sorting_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Request.QueryString.Count > 0)
        {
            if (ss_sorting.SelectedValue == "1")
            {
                con.Open();
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Place_Details_Table INNER JOIN MainCategory ON Place_Details_Table.cid = MainCategory.id INNER JOIN Continent_Table ON Place_Details_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON Place_Details_Table.countryid = Country_Table.id INNER JOIN State_Table ON Place_Details_Table.sid = State_Table.state_id INNER JOIN District_Table ON Place_Details_Table.did = District_Table.districtid order by Place_Details_Table.rts asc", con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_explore.DataSource = dt;
                    lv_explore.DataBind();
                    int rowCount = dt.Rows.Count;
                    lblRowCount.Text = "Results Found: " + rowCount.ToString();
                }
                con.Close();
            }
            if (ss_sorting.SelectedValue == "2")
            {
                con.Open();
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Place_Details_Table INNER JOIN MainCategory ON Place_Details_Table.cid = MainCategory.id INNER JOIN Continent_Table ON Place_Details_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON Place_Details_Table.countryid = Country_Table.id INNER JOIN State_Table ON Place_Details_Table.sid = State_Table.state_id INNER JOIN District_Table ON Place_Details_Table.did = District_Table.districtid order by Place_Details_Table.placeName asc", con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_explore.DataSource = dt;
                    lv_explore.DataBind();
                    int rowCount = dt.Rows.Count;
                    lblRowCount.Text = "Results Found: " + rowCount.ToString();
                }
                con.Close();
            }
            else
            {
                con.Open();
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Place_Details_Table INNER JOIN MainCategory ON Place_Details_Table.cid = MainCategory.id INNER JOIN Continent_Table ON Place_Details_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON Place_Details_Table.countryid = Country_Table.id INNER JOIN State_Table ON Place_Details_Table.sid = State_Table.state_id INNER JOIN District_Table ON Place_Details_Table.did = District_Table.districtid order by Place_Details_Table.placeName desc", con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_explore.DataSource = dt;
                    lv_explore.DataBind();
                    int rowCount = dt.Rows.Count;
                    lblRowCount.Text = "Results Found: " + rowCount.ToString();
                }
                con.Close();
            }
        }
        else
        {
            if (ss_sorting.SelectedValue == "1")
            {
                con.Open();
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Place_Details_Table INNER JOIN MainCategory ON Place_Details_Table.cid = MainCategory.id INNER JOIN Continent_Table ON Place_Details_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON Place_Details_Table.countryid = Country_Table.id INNER JOIN State_Table ON Place_Details_Table.sid = State_Table.state_id INNER JOIN District_Table ON Place_Details_Table.did = District_Table.districtid order by Place_Details_Table.rts asc", con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_explore.DataSource = dt;
                    lv_explore.DataBind();
                    int rowCount = dt.Rows.Count;
                    lblRowCount.Text = "Results Found: " + rowCount.ToString();
                }
                con.Close();
            }
            if (ss_sorting.SelectedValue == "2")
            {
                con.Open();
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Place_Details_Table INNER JOIN MainCategory ON Place_Details_Table.cid = MainCategory.id INNER JOIN Continent_Table ON Place_Details_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON Place_Details_Table.countryid = Country_Table.id INNER JOIN State_Table ON Place_Details_Table.sid = State_Table.state_id INNER JOIN District_Table ON Place_Details_Table.did = District_Table.districtid order by Place_Details_Table.placeName asc", con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_explore.DataSource = dt;
                    lv_explore.DataBind();
                    int rowCount = dt.Rows.Count;
                    lblRowCount.Text = "Results Found: " + rowCount.ToString();
                }
                con.Close();
            }
            else
            {
                con.Open();
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Place_Details_Table INNER JOIN MainCategory ON Place_Details_Table.cid = MainCategory.id INNER JOIN Continent_Table ON Place_Details_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON Place_Details_Table.countryid = Country_Table.id INNER JOIN State_Table ON Place_Details_Table.sid = State_Table.state_id INNER JOIN District_Table ON Place_Details_Table.did = District_Table.districtid order by Place_Details_Table.placeName desc", con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lv_explore.DataSource = dt;
                    lv_explore.DataBind();
                    int rowCount = dt.Rows.Count;
                    lblRowCount.Text = "Results Found: " + rowCount.ToString();
                }
                con.Close();
            }
        }

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string quer1 = "";

        if (txtkeywords.Text != "")
        {
            quer1 = "&&search=" + txtkeywords.Text + "";
            Response.Redirect("explore.aspx?query=query" + quer1 + "");
        }

        else if (txtlocation.Text != "")
        {
            quer1 = "&&search=" + txtlocation.Text + "";
            Response.Redirect("explore.aspx?query=query" + quer1 + "");
        }

        else if (txtcategory.Text != "")
        {
            quer1 = "&&search=" + txtcategory.Text + "";
            Response.Redirect("explore.aspx?query=query" + quer1 + "");
        }
        else
        {
            lblemptry.Visible = true;
            lblemptry.Text = "Please choose location, categories or enter keywords to get result !";
        }
    }
    protected void lv_explore_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        DataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        this.BindListView();
    }
    protected void lv_explore_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lblId = (Label)e.Item.FindControl("lblid");
        int placeId = Convert.ToInt32(lblId.Text);
        List<double> ratings = GetRatingsForPlace(placeId);
        double avgRating = ratings.Any() ? ratings.Average() : 0;
        int numStars = (int)Math.Round(avgRating);
        string starHtml = "";
        for (int i = 0; i < numStars; i++)
        {
            starHtml += "<i class='fas fa-star filled'></i> ";
        }
        Label avgRatingLabel = (Label)e.Item.FindControl("avgRatingLabel");
        avgRatingLabel.Text = starHtml;
        Label avgRatingCountLabel = (Label)e.Item.FindControl("avgRatingCountLabel");
        avgRatingCountLabel.Text = "( " + ratings.Count.ToString() + " Reviews )";
    }
    private List<double> GetRatingsForPlace(int placeId)
    {
        List<double> ratings = new List<double>();
        {
            SqlCommand cmd = new SqlCommand("select rating from Review_Table where pid = '" + placeId + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                double rating = Convert.ToDouble(reader["rating"]);
                ratings.Add(rating);
            }
            reader.Close();
        }
        return ratings;
    }
    protected void lv_explore2_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lblId = (Label)e.Item.FindControl("lblid");
        Label lblpid = (Label)e.Item.FindControl("lblpid");
        int placeId = Convert.ToInt32(lblId.Text);
        int pid = Convert.ToInt32(lblpid.Text);
        List<double> ratings = GetRatingsForPlace(placeId, pid);
        double avgRating = ratings.Any() ? ratings.Average() : 0;
        int numStars = (int)Math.Round(avgRating);
        string starHtml = "";
        for (int i = 0; i < numStars; i++)
        {
            starHtml += "<i class='fas fa-star filled'></i> ";
        }
        Label avgRatingLabel = (Label)e.Item.FindControl("avgRatingLabel");
        avgRatingLabel.Text = starHtml;
        Label avgRatingCountLabel = (Label)e.Item.FindControl("avgRatingCountLabel");
        avgRatingCountLabel.Text = "( " + ratings.Count.ToString() + " Reviews )";
    }
    private List<double> GetRatingsForPlace(int placeId, int pid)
    {
        List<double> ratings = new List<double>();
        {
            SqlCommand cmd = new SqlCommand("select rating from Review_Table where pid = '" + placeId + "' and subpid = '"+pid+"'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                double rating = Convert.ToDouble(reader["rating"]);
                ratings.Add(rating);
            }
            reader.Close();
        }
        return ratings;
    }
}
