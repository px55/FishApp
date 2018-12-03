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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Login_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //connects to database
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);
                conn.Open();

                //Checks to see if new username exists in database already
                //If it is there should be a warning telling user that username has already exist
                string checkuser = "select count(*) from UserData where UserName = '" + TextBoxUsername.Text + "'";
                //Runs the sql query and stores the result into a temp that we convert into true or false
                //We will use that temp to write a if statement which if it falls under
                //We will tell the user that the username already exists in the database
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                conn.Close();
                
                if (temp == 1)
                {
                    conn.Open();
                    string checkPasswordQuery = "select Password from UserData where UserName= '" + TextBoxUsername.Text + "'";
                    SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
                    //stores password from the executed query to string password
                    string password = passComm.ExecuteScalar().ToString().Replace(" ","");
                    //now we will verify the password
                    if (password == TextBoxPassword.Text)
                    {

                        Session["New"] = TextBoxUsername.Text;
                        Session["latidtude"] = lat.Value;
                        Session["longitude"] = longs.Value;
                        Response.Write("Password is correct");
                        Response.Redirect("FishM.aspx");
                    }
                    else
                    {
                        Response.Write("Incorrect password");
                        Response.Write(password);
                    }
                }
                else
                {
                    Response.Write("Username is not correct");
                }
                conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
    }
}