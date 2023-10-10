using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Monitor : System.Web.UI.Page
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
        using (SqlDataAdapter sda = new SqlDataAdapter("Select * From Blog_Table where status = 0", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_monitor.DataSource = dt;
            lv_monitor.DataBind();
            lv_show.DataSource = dt;
            lv_show.DataBind();
        }
        con.Close();

        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("select a.* , b.* from Review_Table as a inner join UserTable as b on a.userid = b. uid where a.status = 0", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_pendingReviews.DataSource = dt;
            lv_pendingReviews.DataBind();
        }
        con.Close();
        con.Open();
        using (SqlDataAdapter sda = new SqlDataAdapter("Select * From Review_Table where status = 0 and id = '" + Request.QueryString["search"] + "'", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lv_showPendingReviews.DataSource = dt;
            lv_showPendingReviews.DataBind();
        }
        con.Close();

    }

    protected void btnShow_Click(object sender, EventArgs e)
    {

    }

    protected void btnAccept_Click(object sender, EventArgs e)
    {

    }

    protected void btnReject_Click(object sender, EventArgs e)
    {

    }

    protected void chk_showblog_CheckedChanged(object sender, EventArgs e)
    {
        foreach (ListViewItem item in lv_show.Items)
        {
            CheckBox checkbox = (CheckBox)item.FindControl("chk_autoapprove");
            if (checkbox != null && checkbox != sender)
            {
                checkbox.Checked = false;
            }
        }
        foreach (ListViewItem item in lv_pendingReviews.Items)
        {
            CheckBox checkbox = (CheckBox)item.FindControl("chk_autoapprove");
            if (checkbox != null && checkbox != sender)
            {
                checkbox.Checked = false;
            }
        }

    }

    protected void lv_show_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Active")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Blog_Table Set status='1' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
        }

        if (e.CommandName == "Delete")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From Blog_Table Where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
        }
        if (e.CommandName == "Show")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            using (SqlDataAdapter sda = new SqlDataAdapter("Select * From Blog_Table where id = '" + lblId + "'", con))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lv_monitor.DataSource = dt;
                lv_monitor.DataBind();
            }
            con.Close();
        }
    }

    protected void lv_show_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }

    protected void lv_show_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }

    protected void lv_pendingReviews_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

        if (e.CommandName == "Active")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Review_Table Set status='1' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
        }

        if (e.CommandName == "Delete")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From Review_Table Where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
        }

        if (e.CommandName == "Show")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            Label lbluserid = (Label)e.Item.FindControl("lbluserid");
            Label lblreview = (Label)e.Item.FindControl("lblreview");

            hdnvalue.Value = lblId.Text;
            hdnvalue.Value = lbluserid.Text;
            hdnvalue.Value = lblreview.Text;
            Response.Redirect("Monitor.aspx?search=" + lblId.Text + "");
        }
    }

    protected void lv_pendingReviews_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }

    protected void lv_pendingReviews_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }

    protected void btnShowReviews_Click(object sender, EventArgs e)
    {
    }
}