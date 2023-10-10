using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for sellproduct
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
[System.Web.Script.Services.ScriptService]
public class search : System.Web.Services.WebService
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PTGcnn"].ConnectionString);

    public search()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] SearchCategory(string prefixText, int count)
    {
        count = 10;
        string[] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(", ", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");

        using (SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select categoryName FROM MainCategory where categoryName like '%" + prefixText + "%'", con)))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string[] items = new string[dt.Rows.Count];
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr["categoryName"].ToString(), i);
                i++;
            }
            return items;
        }
    }

    [WebMethod]
    public string[] SearchContinent(string prefixText, int count)
    {
        count = 10;
        string[] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(", ", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");

        using (SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select continent_name from Continent_Table where continent_name like '%" + prefixText + "%'", con)))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string[] items = new string[dt.Rows.Count];
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr["continent_name"].ToString(),i);
                i++;
            }
            return items;
        }
    }

    [WebMethod]
    public string[] SearchCountry(string prefixText, int count)
    {
        count = 10;
        string[] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(", ", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");

        using (SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select nicename FROM Country_Table where nicename like '%" + prefixText + "%'", con)))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string[] items = new string[dt.Rows.Count];
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr["nicename"].ToString(), i);
                i++;
            }
            return items;
        }
    }

    [WebMethod]
    public string[] SearchState(string prefixText, int count)
    {
        count = 10;
        string[] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(", ", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");

        using (SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select state_title FROM State_Table where state_title like '%" + prefixText + "%'", con)))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string[] items = new string[dt.Rows.Count];
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr["state_title"].ToString(), i);
                i++;
            }
            return items;
        }
    }

    [WebMethod]
    public string[] SearchDistrict(string prefixText, int count)
    {
        count = 10;
        string[] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(", ", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");

        using (SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select district_title FROM District_Table where district_title like '%" + prefixText + "%'", con)))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string[] items = new string[dt.Rows.Count];
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr["district_title"].ToString(), i);
                i++;
            }
            return items;
        }
    }

    [WebMethod]
    public string[] SearchPlace(string prefixText, int count)
    {
        count = 10;
        string[] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(", ", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");

        using (SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select placeName FROM Place_Details_Table where placeName like '%" + prefixText + "%'", con)))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string[] items = new string[dt.Rows.Count];
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr["placeName"].ToString(), i);
                i++;
            }
            return items;
        }
    }

    [WebMethod]
    public string[] SearchCityName(string prefixText, int count)
    {
        count = 10;
        string[] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(", ", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");

        using (SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select cityid FROM Place_Details_Table where cityid like '%" + prefixText + "%'", con)))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string[] items = new string[dt.Rows.Count];
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr["cityid"].ToString(), i);
                i++;
            }
            return items;
        }
    }

    [WebMethod]
    public string[] SearchNearbyPlace(string prefixText, int count)
    {
        count = 10;
        string[] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(", ", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");

        using (SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select placeName FROM NearbyPlaces_Table where placeName like '%" + prefixText + "%'", con)))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string[] items = new string[dt.Rows.Count];
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr["placeName"].ToString(), i);
                i++;
            }
            return items;
        }
    }

    [WebMethod]
    public string[] SearchNPCategory(string prefixText, int count)
    {
        count = 10;
        string[] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(", ", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");

        using (SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select categoryName FROM NearbyPlaces_Table where categoryName like '%" + prefixText + "%'", con)))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string[] items = new string[dt.Rows.Count];
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr["categoryName"].ToString(), i);
                i++;
            }
            return items;
        }
    }

}