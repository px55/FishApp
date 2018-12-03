using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.Model;

namespace WebApplication2
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Now we'll just call the method on pageload
            FillPage();
        }

        private void FillPage()
        {
            //This will grab all the products from the database
            ProductModel productModel = new ProductModel();
            List<Product> products = productModel.GetAllProducts();

            //Now we have to make sure there are actual products in our database
            if (products != null)
            {
                //If there is we'll create a new panel with an image button and 2 label description of each product
                foreach (Product product in products)
                {
                    //dynamic object so we can bind the items to new properties (eg buttons and labels)
                    Panel productPanel = new Panel();
                    ImageButton imageButton = new ImageButton();
                    Label lblName = new Label();
                    Label lblPrice = new Label();

                    //Now that we have created an entire new panel we'll have to fill those up with our products values
                    imageButton.ImageUrl = "~/Images/Products/" + product.Image;
                    imageButton.CssClass = "productImage";
                    imageButton.PostBackUrl = "~/Pages/Product.aspx?id=" + product.Id;

                    lblName.Text = product.Name;
                    lblName.CssClass = "ProductName";

                    lblPrice.Text = "$ " + product.Price;
                    lblPrice.CssClass = "productPrice";

                    // Now that we have added values and linked it to the buttons and labels we will now add these to the new panel
                    productPanel.Controls.Add(imageButton);
                    productPanel.Controls.Add(new Literal { Text = "<br />" });
                    productPanel.Controls.Add(lblName);
                    productPanel.Controls.Add(new Literal { Text = "<br />" });
                    productPanel.Controls.Add(lblPrice);

                    //Once everything is completed we will finally add this panel that we created to the actual panel on the Index.aspx panel
                    pnlProducts.Controls.Add(productPanel);

                }
            }
            else
            {
                //If there is no products found we wll just add a text to the panel saying that there is no items found
                pnlProducts.Controls.Add(new Literal { Text = "No products found!" });

            }

        }
    }
}