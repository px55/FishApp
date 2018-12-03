using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.Model;

namespace WebApplication2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetImages();

                //This method allows us to check the url if the it actually contains a id parameter.
                //If the url doesnt have an id parameter it means that there is something wrong and the user isnt actually updating a existing product
                if(!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    FillPage(id);
                }
            }
             
        }

        //This will allow user to update their new values
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ProductModel productModel = new ProductModel();
            Product product = CreateProduct();

            //Check to see if the url when the user press "update" from the Management.aspx page has an parameter id or not.
            if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
            {
                //Id does exist so we will proceed to update the table
                int id = Convert.ToInt32(Request.QueryString["id"]);
                lblResult.Text = productModel.UpdateProduct(id, product);

            }
            else
            {
                //If there is no parameter id we will just create a new role for the user
                lblResult.Text = productModel.InsertProduct(product);
            }
        }

        //This function supports the Management.aspx page where if the user wants to update an existing row of Products
        //This will also display the existing values into the original text boxes when user tries updating.
        private void FillPage(int id)
        {
            //Get selected product from DB
            ProductModel productModel = new ProductModel();
            Product product = productModel.GetProduct(id);

            //This will allow us to fill the textboxes with the existing row's data that we are trying to update
            txtDescription.Text = product.Description;
            txtName.Text = product.Name;
            txtPrice.Text = product.Price.ToString();

            //We then need to fill the dropdownlist again with values in order for user to select their choices
            ddlImage.SelectedValue = product.Image;
            ddlImage.SelectedValue = product.TypeId.ToString();
        }

        private void GetImages()
        {
            try
            {
                //Get all filepaths
                string[] images = Directory.GetFiles(Server.MapPath("~/Images/Products/"));

                //Get all filenames and add them to an arraylist
                ArrayList imageList = new ArrayList();
                foreach (string image in images)
                {
                    string imageName = image.Substring(image.LastIndexOf(@"\", StringComparison.Ordinal) + 1);
                    imageList.Add(imageName);
                }

                //Set the arrayList as the dropdownview's datasourch and refresh
                ddlImage.DataSource = imageList;
                ddlImage.AppendDataBoundItems = true;
                ddlImage.DataBind();

            }
            catch (Exception e)
            {
                lblResult.Text = e.ToString();
            }
        }

        private Product CreateProduct()
        {
            Product product = new Product();

            product.Name = txtName.Text;
            product.Price = Convert.ToInt32(txtPrice.Text);
            product.TypeId = Convert.ToInt32(ddlType.SelectedValue);
            product.Description = txtDescription.Text;
            product.Image = ddlImage.SelectedValue;

            return product;
        }
    }
}