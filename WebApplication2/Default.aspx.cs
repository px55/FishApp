using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Create_Forum_Project
{
    public partial class Default : System.Web.UI.Page
    {
        string username;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["new"] == null)
            {
                Session["new"] = 0;
                LoadPost();

            }
            else
            {
                username = Session["new"].ToString();
                divwelcome.Visible = true;
                div_log_reg_ribbon.Visible = false;
                div_dashboard_box.Visible = true;
                lblwelcom.InnerText = username.ToString();
                LoadPost();
                
            }
            
        }
        public void LoadPost()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("Select * from Forum_Post", con);
            con.Open();
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                //loops through the rows in forumpost and gets data from each row
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    string id = ds.Tables[0].Rows[i]["postid"].ToString();
                    string author = ds.Tables[0].Rows[i]["UserName"].ToString();
                    string title = ds.Tables[0].Rows[i]["PostTitle"].ToString();
                    string postmsg = ds.Tables[0].Rows[i]["PostMessage"].ToString();
                    HtmlGenericControl divpost = new HtmlGenericControl("div");
                    divpost.Attributes.Add("class", "div_post_display");
                    divpost.Attributes.Add("id", id);

                    HtmlGenericControl lblauthor = new HtmlGenericControl("label");
                    lblauthor.Attributes.Add("class", "divauthor");
                    lblauthor.InnerText = "Author :" + author; ;

                    HtmlGenericControl h2 = new HtmlGenericControl("h2");
                    h2.InnerText = title.ToString();

                    HtmlGenericControl divpostmsg = new HtmlGenericControl("div");
                    divpostmsg.Attributes.Add("class", "divpostmsg");

                    //if (postmsg.Length > 50)
                    //{
                    //    divpostmsg.InnerText = postmsg.Substring(0, 50) + "....";
                    //}

                    divpostmsg.InnerText = postmsg;


                    HtmlGenericControl divreader = new HtmlGenericControl("div");
                    divreader.Attributes.Add("class", "divreader");
                    divpost.Controls.Add(divreader);

                    /* Post Read More */
                    //HtmlGenericControl btnReadMore = new HtmlGenericControl("a");
                    //btnReadMore.Attributes.Add("class", "btnreadmore");
                    //btnReadMore.InnerText = "Read More";
                    //divreader.Controls.Add(btnReadMore);

                    divpost.Controls.Add(lblauthor);
                    divpost.Controls.Add(h2);
                    divpost.Controls.Add(divpostmsg);
                    divpost.Controls.Add(divreader);
                    div_post_display_panel.Controls.Add(divpost);
                }
            }
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
        }
    }
}