using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.Model
{
    public class ProductModel
    {
        public string InsertProduct(Product product)
        {
            try
            {
                //We are trying to add new products to the database which means we need to create a new StoreDBEntities
                StoreDBEntities db = new StoreDBEntities();
                //call the db which we created above and connected it with Products which is in our entity then use the add call function to 
                //add the product that the owner wants to add.
                db.Products.Add(product);
                //Have to make sure we save the changes that we just made so we use the method SaveChanges()
                db.SaveChanges();
                //here we just return the product's name and tell the user that the item was successfully added.
                return product.Name + " was succesfully inserted";
            }
            catch (Exception e)
            {
                //if there is a error the catch will return error
                return "Error:" + e;
            }
        }

        public string UpdateProduct(int id, Product product)
        {
            try
            {
                StoreDBEntities db = new StoreDBEntities();

                //Fetch object from db
                Product p = db.Products.Find(id);

                p.Name = product.Name;
                p.Price = product.Price;
                p.TypeId = product.TypeId;
                p.Description = product.Description;
                p.Image = product.Image;

                db.SaveChanges();
                return product.Name + " was succesfully updated";

            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteProduct(int id)
        {
            try
            {
                StoreDBEntities db = new StoreDBEntities();
                Product product = db.Products.Find(id);

                db.Products.Attach(product);
                db.Products.Remove(product);
                db.SaveChanges();

                return product.Name + " was succesfully deleted";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        // Return a single product object using product's id number
        public Product GetProduct(int id)
        {
            try
            {
                //Creates a new Store database and set the product that we are searching for in place for the original
                //Returns that product
                using (StoreDBEntities db = new StoreDBEntities())
                {
                    Product product = db.Products.Find(id);
                    return product;
                }
            }
            catch (Exception e)
            { 
                //If something goes wrong returns null
                return null;
            }
        }

        //Return a list of all available products in database
        public List<Product> GetAllProducts()
        {
            try
            {
                using (StoreDBEntities db = new StoreDBEntities())
                {
                    //select * from products then converts all the items grabbed into a list so we can use it in our code
                    List<Product> products = (from x in db.Products
                                              select x).ToList();
                    //Returns product afterwards.
                    return products;
                }
            }
            catch (Exception e)
            {
                return null;
            }
        }

        //Return a list of products that have the same selected type
        private List<Product> GetProductsByType(int typeId)
        {
            try
            {
                using (StoreDBEntities db = new StoreDBEntities())
                {
                    //select and grab all products where typeId is == to the id that the users chooses
                    //Returns product afterwards.
                    List<Product> products = (from x in db.Products
                                              where x.TypeId == typeId
                                              select x).ToList();
                    return products;
                }
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}