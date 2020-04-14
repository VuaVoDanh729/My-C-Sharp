using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RestaurantWeb
{
    public partial class Detail : System.Web.UI.Page
    {
        public String Name { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Name = Convert.ToString(Request["name"]);
                loadData();
            }
        }

        public void loadData()
        {
            Entity.Dish dish = DataAccess.DishDao.Get_Dish_By_Name(Name);
            Image1.ImageUrl = dish.avatar;
            nameLb.Text = dish.Name;
            priceLb.Text = dish.Price + " ";
            Label2.Text = dish.Discount + "";
            TextBox1.Text = dish.Description;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Server.Transfer("Order.aspx");
        }
    }
}