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
    public partial class Home : System.Web.UI.Page
    {
        string user1;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                user1 = Session["new"].ToString();
                welcome.InnerHtml = user1.ToString();
                div_dashboard_box.Visible = true;
                LoadPost();
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

       
        public void LoadPost()
        {            
            SqlDataAdapter da = new SqlDataAdapter("Select * from Forum_Post where username='" + user1 + "'", con);
            con.Open();
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {


                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    string id = ds.Tables[0].Rows[i]["PostID"].ToString();
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
                    /* Post Message */
                    HtmlGenericControl divpostmsg = new HtmlGenericControl("div");
                    divpostmsg.Attributes.Add("class", "divpostmsg");

                    //controls the length of message shown
                    //if (postmsg.Length > 50)
                    //{
                    //    divpostmsg.InnerText = postmsg.Substring(0, 50) + "....";
                    //}

                    divpostmsg.InnerText = postmsg;

                    HtmlGenericControl divreader = new HtmlGenericControl("div");
                    divreader.Attributes.Add("class", "divreader");
                    divpost.Controls.Add(divreader);

                    /* Post Read More */
                    //HtmlGenericControl btnReadMore = new HtmlGenericControl("button");
                    //btnReadMore.Attributes.Add("class", "btnreadmore");
                    //btnReadMore.InnerText = "Read More";
                    //btnReadMore.Attributes.Add("href", "javascript:readarticles()");
                    //divreader.Controls.Add(btnReadMore);

                    divpost.Controls.Add(lblauthor);
                    divpost.Controls.Add(h2);
                    divpost.Controls.Add(divpostmsg);
                    divpost.Controls.Add(divreader);
                    div_post_display_panel.Controls.Add(divpost);
                }
            }
        }
        
        public void ReadArticles1(string id)
        {
            Response.Write(id);
        }
        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
        }
    }
}
