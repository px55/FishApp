using Subgurim.Controles;
using Subgurim.Controles.GoogleChartIconMaker;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class FishMap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Here I used Degha Location as Main Location and Lat Long is : 21.622564, 87.523417
                GLatLng mainLocation = new GLatLng(41.289944, -124.059646);
                GMap1.setCenter(mainLocation, 15);

                XPinLetter xpinLetter = new XPinLetter(PinShapes.pin_star, "H", Color.Blue, Color.White, Color.Chocolate);
                GMap1.Add(new GMarker(mainLocation, new GMarkerOptions(new GIcon(xpinLetter.ToString(), xpinLetter.Shadow()))));

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
                    GMap1.Add(win);
                }
            }

        }
    }
}