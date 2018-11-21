using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Users : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["latitude"] = lat.Value;
            //Session["longitude"] = longs.Value;

            if (Session["New"] != null)
            {
                Label_Welcome.Text += Session["New"].ToString();
                Session["latidtude"].ToString();
                Session["longitude"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void B_logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Cookies.Clear();
            
            if(Session["New"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("FishMap.aspx");
        }
    }
}