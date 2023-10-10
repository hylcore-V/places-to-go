using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class place_details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);
    public static string mainplacename = "";
    public static string avgRatingPercentage = "";
    public static string avgRatingPercentage2 = "";

    public static string showairway = "";
    public static string showtrain = "";
    public static string showbus = "";


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count == 0)
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["search"]))
                {
                    BindListViewNP();
                }
                else
                {
                    BindListView();
                }
            }
        }
    }
    private List<double> GetRatingsForPlace(int placeId)
    {
        List<double> ratings = new List<double>();
        {
            SqlCommand cmd = new SqlCommand("select rating from Review_Table where pid = '" + Request.QueryString["q"] + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                double rating = Convert.ToDouble(reader["rating"]);
                ratings.Add(rating);
            }
            reader.Close();
        }
        reviewcount.InnerText = "Total Reviews : " + ratings.Count.ToString();
        return ratings;
    }
    protected string GetStarIcons(int rating)
    {
        PlaceHolder starContainer = new PlaceHolder();
        for (int i = 1; i <= rating; i++)
        {
            Label starLabel = new Label();
            starLabel.Text = "<i class='fas fa-star filled'></i>";
            starContainer.Controls.Add(starLabel);
        }
        return RenderControlToString(starContainer);
    }
    protected string RenderControlToString(Control control)
    {
        StringBuilder sb = new StringBuilder();
        StringWriter sw = new StringWriter(sb);
        HtmlTextWriter htmlWriter = new HtmlTextWriter(sw);
        control.RenderControl(htmlWriter);
        return sb.ToString();
    }
    public void BindListView()
    {
        con.Open();
        BindavgRatingPercentage();
        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT placeImage1,placeImage2,placeImage3,placeImage4,placeImage5 FROM Place_Details_Table where id = '" + Request.QueryString["q"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_placeslider.DataSource = dt;
            lv_placeslider.DataBind();
        }
        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Place_Details_Table INNER JOIN MainCategory ON Place_Details_Table.cid = MainCategory.id INNER JOIN Continent_Table ON Place_Details_Table.continentid = Continent_Table.id INNER JOIN Country_Table ON Place_Details_Table.countryid = Country_Table.id INNER JOIN State_Table ON Place_Details_Table.sid = State_Table.state_id INNER JOIN District_Table ON Place_Details_Table.did = District_Table.districtid where Place_Details_Table.id='" + Request.QueryString["q"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_placedetails.DataSource = dt;
            lv_placedetails.DataBind();
            lv_description.DataSource = dt;
            lv_description.DataBind();
            lv_location.DataSource = dt;
            lv_location.DataBind();
        }
        string loodata = "";
        SqlCommand cmd = new SqlCommand("Select transport from Place_Details_Table where id ='" + Request.QueryString["q"] + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            loodata = dr["transport"].ToString();
        }
        var query = from val in loodata.Split(',') select val.ToString();
        airway.Visible = false; train.Visible = false; bus.Visible = false;
        foreach (string num in query)
        {
            if (num == "Airway")
            {
                airway.Visible = true;
            }
            if (num == "Buses")
            {
                bus.Visible = true;
            }

            if (num == "Train")
            {
                train.Visible = true;
            }
            if (num == null)
            {
                TransportNone.Visible = false;
            }
        }
        dr.Close();

        using (SqlDataAdapter sda = new SqlDataAdapter("select x.*, a.id, b.id, c.state_id, d.districtid, e.placeName from NearbyPlaces_Table as x inner join Continent_Table as a on x.continentid=a.id inner join Country_Table as b on x.countryid=b.id inner join State_Table as c on x.sid=c.state_id inner join District_Table as d on x.did=d.districtid inner join Place_Details_Table as e on x.pid=e.id where x.pid='" + Request.QueryString["q"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_np.DataSource = dt;
            lv_np.DataBind();
            SqlCommand cmdmainplacename = new SqlCommand("select placeName from Place_Details_Table where id = '" + Request.QueryString["q"] + "'", con);
            mainplacename = cmdmainplacename.ExecuteScalar().ToString();
        }
        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT id,did,placeImage1,placeName FROM NearbyPlaces_Table where did = '" + Request.QueryString["d"] + "' union all select id,did,placeImage1,placeName from Place_Details_Table where id != '" + Request.QueryString["q"] + "' and did = '" + Request.QueryString["d"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_npright.DataSource = dt;
            lv_npright.DataBind();
            if (dt.Rows.Count == 0) { nearbyplaces.Visible = false; }
        }
        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Hotel_Table INNER JOIN Continent_Table ON Hotel_Table.continent_id = Continent_Table.id INNER JOIN Country_Table ON Hotel_Table.country_id = Country_Table.id INNER JOIN State_Table ON Hotel_Table.state_id = State_Table.state_id INNER JOIN District_Table ON Hotel_Table.district_id = District_Table.districtid", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_hotels.DataSource = dt;
            lv_hotels.DataBind();
            if (dt.Rows.Count <= 0)
            {
                showHotels.Visible = false;
            }
        }

        using (SqlDataAdapter sda = new SqlDataAdapter("select a.* , b.* from Review_Table as a inner join UserTable as b on a.userid = b. uid where a.status = 1 and a.pid = '" + Request.QueryString["q"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_showReviews.DataSource = dt;
            lv_showReviews.DataBind();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    int rating = Convert.ToInt32(row["rating"]);
                    int numStars = rating;
                    PlaceHolder starContainer = new PlaceHolder();
                    for (int i = 1; i <= numStars; i++)
                    {
                        Label starLabel = new Label();
                        starLabel.Text = "<i class='fa fa-star'></i>";
                        starContainer.Controls.Add(starLabel);
                    }
                }
                int placeId = Convert.ToInt32(Request.QueryString["q"]);
                List<double> ratings = GetRatingsForPlace(placeId);
                double avgRating = ratings.Any() ? ratings.Average() : 0;
                avgRatingPercentage = avgRating.ToString();
                avgRatingPercentage2 = (ratings.Average() * 20).ToString();
            }
        }
        con.Close();
    }
    public void BindListViewNP()
    {
        con.Open();
        PlacesToVisit.Visible = false;
        using (SqlDataAdapter sda1 = new SqlDataAdapter("select * from Review_Table where pid = '" + Request.QueryString["q"] + "' and subpid = '" + Request.QueryString["p"] + "'", con))
        {
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
        }
        using (SqlDataAdapter sda = new SqlDataAdapter("select x.*, a.id, b.id, c.state_id, d.districtid, e.placeName from NearbyPlaces_Table as x inner join Continent_Table as a on x.continentid=a.id inner join Country_Table as b on x.countryid=b.id inner join State_Table as c on x.sid=c.state_id inner join District_Table as d on x.did=d.districtid inner join Place_Details_Table as e on x.pid=e.id where x.id='" + Request.QueryString["q"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_placeslider.DataSource = dt;
            lv_placeslider.DataBind();
        }

        using (SqlDataAdapter sda = new SqlDataAdapter("select x.*, a.*, b.*, c.*, d.*, e.placeName from NearbyPlaces_Table as x inner join Continent_Table as a on x.continentid=a.id inner join Country_Table as b on x.countryid=b.id inner join State_Table as c on x.sid=c.state_id inner join District_Table as d on x.did=d.districtid inner join Place_Details_Table as e on x.pid=e.id where x.id='" + Request.QueryString["q"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_placedetails.DataSource = dt;
            lv_placedetails.DataBind();
            lv_description.DataSource = dt;
            lv_description.DataBind();
            lv_location.DataSource = dt;
            lv_location.DataBind();
        }
        string loodata = "";
        SqlCommand cmd = new SqlCommand("Select transport from NearbyPlaces_Table where id ='" + Request.QueryString["q"] + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            loodata = dr["transport"].ToString();
        }
        var query = from val in loodata.Split(',') select val.ToString();
        airway.Visible = false; train.Visible = false; bus.Visible = false;
        Splane.Visible = false; Strain.Visible = false; Sbus.Visible = false;
        foreach (string num in query)
        {
            if (num == "Airway")
            {
                airway.Visible = true;
                Splane.Visible = true;
            }
            if (num == "Buses")
            {
                bus.Visible = true;
                Strain.Visible = true;
            }

            if (num == "Train")
            {
                train.Visible = true;
                Sbus.Visible = true;
            }
            if (num == null)
            {
                TransportNone.Visible = false;
            }
        }
        dr.Close();

        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Hotel_Table INNER JOIN Continent_Table ON Hotel_Table.continent_id = Continent_Table.id INNER JOIN Country_Table ON Hotel_Table.country_id = Country_Table.id INNER JOIN State_Table ON Hotel_Table.state_id = State_Table.state_id INNER JOIN District_Table ON Hotel_Table.district_id = District_Table.districtid", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_hotels.DataSource = dt;
            lv_hotels.DataBind();
            if (dt.Rows.Count <= 0)
            {
                showHotels.Visible = false;
            }
        }

        using (SqlDataAdapter sda = new SqlDataAdapter("select a.* , b.* from Review_Table as a inner join UserTable as b on a.userid = b.uid where a.pid = '" + Request.QueryString["q"] + "' and a.subpid = '" + Request.QueryString["p"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_showReviews.DataSource = dt;
            lv_showReviews.DataBind();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    int rating = Convert.ToInt32(row["rating"]);
                    int numStars = rating;
                    PlaceHolder starContainer = new PlaceHolder();
                    for (int i = 1; i <= numStars; i++)
                    {
                        Label starLabel = new Label();
                        starLabel.Text = "<i class='fa fa-star'></i>";
                        starContainer.Controls.Add(starLabel);
                    }
                }
                int placeId = Convert.ToInt32(Request.QueryString["q"]);
                List<double> ratings = GetRatingsForPlace(placeId);
                double avgRating = ratings.Any() ? ratings.Average() : 0;
                avgRatingPercentage = avgRating.ToString();
                avgRatingPercentage2 = (ratings.Average() * 20).ToString();
            }
        }

        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT id,did,placeImage1,placeName FROM NearbyPlaces_Table where id != '" + Request.QueryString["q"] + "' and did = '" + Request.QueryString["d"] + "' union all select id,did,placeImage1,placeName from Place_Details_Table where did = '" + Request.QueryString["d"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_npright.DataSource = dt;
            lv_npright.DataBind();
            if (dt.Rows.Count == 0) { nearbyplaces.Visible = false; }
        }
        con.Close();
    }
    protected void SubmitReview_Click(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserId"] != null && HttpContext.Current.Session["UserName"] != null)
        {
            string Username = (string)Session["Username"];
            con.Open();
            SqlCommand cmdaddress = new SqlCommand("select uemail from UserTable where uid = '" + Session["UserId"] + "'", con);
            string usermail = cmdaddress.ExecuteScalar().ToString();
            if (!string.IsNullOrEmpty(Request.QueryString["search"]))
            {
                SqlCommand cmd = new SqlCommand("insert into Review_Table (userid, pid, subpid, review, rating, status, rts) values ('" + Session["UserId"] + "', '" + Request.QueryString["q"] + "', '" + Request.QueryString["p"] + "', '" + txtreview.Text.Replace("'", "''") + "', '" + ratingControl.CurrentRating + "', '0', getdate())", con);
                cmd.ExecuteNonQuery();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("insert into Review_Table (userid, pid, subpid, review, rating, status, rts) values ('" + Session["UserId"] + "', '" + Request.QueryString["q"] + "', '', '" + txtreview.Text.Replace("'", "''") + "', '" + ratingControl.CurrentRating + "', '0', getdate())", con);
                cmd.ExecuteNonQuery();
            }
            con.Close();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showloginpopup", "alert('Please log in to add a review comment.');", true);
            txtreview.Text = string.Empty;
            string returnUrl = HttpUtility.UrlEncode(Request.Url.PathAndQuery);
            Response.Redirect("login.aspx?returnUrl=" + returnUrl);
        }
    }
    protected void lv_placedetails_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            int placeId = Convert.ToInt32(Request.QueryString["q"]);

            List<double> ratings = GetRatingsForPlace(placeId);

            double avgRating = ratings.Any() ? ratings.Average() : 0;
            int numStars = (int)Math.Round(avgRating);
            string starHtml = "";
            for (int i = 0; i < numStars; i++)
            {
                starHtml += "<i class='fas fa-star'></i> ";
            }
            Label avgRatingLabel = (Label)e.Item.FindControl("avgRatingLabel");
            avgRatingLabel.Text = starHtml;
            Label avgRatingCountLabel = (Label)e.Item.FindControl("avgRatingCountLabel");
            avgRatingCountLabel.Text = "( " + ratings.Count.ToString() + " Reviews )";
        }
    }
    public void BindavgRatingPercentage()
    {

    }
}

