using Subgurim.Controles;
using Subgurim.Controles.GoogleChartIconMaker;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class PlanTrip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                Session["New"].ToString();
                Session["latidtude"].ToString();
                Session["longitude"].ToString();
            }

            double latitude;
            double.TryParse(Session["latidtude"].ToString(), NumberStyles.Any, CultureInfo.CurrentCulture, out latitude);

            string RLong = Session["longitude"].ToString();

            if (!IsPostBack)
            {
                // Current Location
                GLatLng mainLocation = new GLatLng(latitude, Convert.ToDouble(RLong));
                GMap2.setCenter(mainLocation, 15);

                XPinLetter xpinLetter = new XPinLetter(PinShapes.pin_star, "F", Color.Blue, Color.White, Color.Chocolate);
                GMap2.Add(new GMarker(mainLocation, new GMarkerOptions(new GIcon(xpinLetter.ToString(), xpinLetter.Shadow()))));

                List<LocData> location = new List<LocData>();
                using (FishLocEntities dc = new FishLocEntities())
                {
                    location = dc.LocDatas.Where(a => a.Loc_Area.Equals("Orick")).ToList();
                }

                PinIcon p;
                GMarker gm;
                GInfoWindow win;
                foreach (var i in location)
                {
                    p = new PinIcon(PinIcons.home, Color.Cyan);
                    gm = new GMarker(new GLatLng(Convert.ToDouble(i.Loc_Lat), Convert.ToDouble(i.Loc_Long)),
                        new GMarkerOptions(new GIcon(p.ToString(), p.Shadow())));

                    win = new GInfoWindow(gm, i.Loc_Name + " <a href='" + i.ReadMoreUrl + "'>Read more...</a>", false, GListener.Event.mouseover);
                    GMap2.Add(win);
                }
            }


        }
        https://www.youtube.com/watch?v=odKKw2T5wOc
        https://docs.microsoft.com/en-us/dotnet/api/system.net.mail.smtpclient.send?view=netframework-4.7.2

        string from = "jjl438@humboldt.edu";

        System.Net.Mail.SmtpClient("info@mydomain.com", "hello@hello.com", "Thank You", "We look forward to working with you again in the future");

    }
    }