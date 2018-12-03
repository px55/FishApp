using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.Model;

namespace WebApplication2
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillPage();
        }

        private void FillPage()
        {
            //Get selected product's data values from DB
            if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                ProductModel productModel = new ProductModel();
                Product product = productModel.GetProduct(id);

                //fill the labels with the actual data from DB
                lblPrice.Text = "Price per unit: <br/>$ " + product.Price;
                lblTitle.Text = product.Name;
                lblDescription.Text = product.Description;
                lblItemNr.Text = id.ToString();
                imgProduct.ImageUrl = "~/Images/Products/" + product.Image;

                //Fill The dropdown list with numbers the user can choose how much quantity the user wants to buy
                int[] amount = Enumerable.Range(1, 20).ToArray();
                ddlAmount.DataSource = amount;
                ddlAmount.AppendDataBoundItems = true;
                ddlAmount.DataBind();

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Need to check if url contains product ID first
            if(!string.IsNullOrWhiteSpace(Request.QueryString["id"]))
            {
                string clientId = "-1";
                int id = Convert.ToInt32(Request.QueryString["id"]);
                int amount = Convert.ToInt32(ddlAmount.SelectedValue);

                //Now we will create a new cart and just fill in the missing values that a cart needs which you can look in our DB Table
                Cart cart = new Cart
                {
                    Amount = amount,
                    ClientID = clientId,
                    DatePurchased = DateTime.Now,
                    IsInCart = true,
                    ProductID = id
                };

                //Now we create a new Cartmodel and set the new values that we just attain and store them inside the labels
                CartModel model = new CartModel();
                lblResult.Text = model.InsertCart(cart);
            }
        }
    }
}