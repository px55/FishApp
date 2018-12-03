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
    public partial class Registration : System.Web.UI.Page
    {
       //Int32 temp = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);
                conn.Open();

                //Checks to see if new username exists in database already
                //If it is there should be a warning telling user that username has already exist
                string checkuser = "select count(*) from UserData where UserName = '" + TextBoxUN.Text + "'";
                //Runs the sql query and stores the result into a temp that we convert into true or false
                //We will use that temp to write a if statement which if it falls under
                //We will tell the user that the username already exists in the database
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                conn.Close();

                if (temp > 0)
                {
                    Response.Write(@"<script language='javascript'>alert('Username already exists')</script>");
                    Response.Redirect("Registration.aspx");
                }
            }
        
        }
        protected void Button1_Click(object sender, EventArgs e) //submit button
        {
            try
            {
                //each time a new user creates a account it will come with its own unique id
                Guid newGUID = Guid.NewGuid();

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnectionString"].ConnectionString);
                conn.Open();

                //This will allow us to insert usernames into our database
                string insertQuery = "insert into [UserData](id, UserName, Password, Email, Country) values(@id, @Uname, @password, @email, @country)";
                //Runs the sql query
                SqlCommand com = new SqlCommand(insertQuery, conn);
                //This allows us to add what ever the user enters as his values and store
                //inside the textbox OR for our case a dropdown it can be anything you have
                //on your website interface design
                com.Parameters.AddWithValue("@id", newGUID.ToString()); // convert new unique id to string and stores it
                com.Parameters.AddWithValue("@Uname", TextBoxUN.Text);             
                com.Parameters.AddWithValue("@password", TextBoxPass.Text);
                com.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                com.Parameters.AddWithValue("@country", DropDownListCountry.SelectedItem.ToString());

                //executes the query
                com.ExecuteNonQuery();
                //links to a new page 
                Response.Redirect("Login.aspx");
                Response.Write("Registration is succesful!");

                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("Error:" + ex.ToString());
            }
        }

        protected void Button_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}