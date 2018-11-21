using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication2
{
    public partial class StoreMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("login.aspx");
        }
        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("FishMap.aspx");
        }
        protected void CheckOutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckOut.aspx");
        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Store"].ConnectionString);
                conn.Open();

                string checkSearchQuery = "select Item_name from Item where Item_name LIKE '%" + Search.Text + "%'";
                SqlCommand passComm = new SqlCommand(checkSearchQuery, conn);

                string results = passComm.ExecuteScalar().ToString().Replace(" ", "");

                if (results == null)
                {
                    Response.Write("Not Found.");
                }
                else
                {
                    Response.Write(results);
                }

                conn.Close();
            }
        }

    }
}