using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RestaurantWeb
{

    public partial class Order : System.Web.UI.Page
    {

        public string NameViewState
        {
            get
            {
                return ViewState["Name"].ToString();
            }
            set
            {
                ViewState["Name"] = value;
            }

        }
        public Entity.Dish myDish { get; set; }
        public String Name { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Name = Convert.ToString(Request["name"]);
                loadData();
            }
           

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                myDish = DataAccess.DishDao.Get_Dish_By_Name(Name);
                String cusName = TextBox3.Text.Trim();
                String phone = TextBox5.Text.Trim();
                String address = TextBox6.Text.Trim();



                int number_Table = Int32.Parse(TextBox1.Text);


                int quantity = Int32.Parse(TextBox2.Text);

                int lastOrder = DataAccess.OrderDao.getLastOrder_id();


                String des = TextBox4.Text.Trim();

                DataAccess.CustomerDao.insertCustomer(cusName, phone, "Des", address);
                int cusId = DataAccess.CustomerDao.getCussIdByPhone(phone);
                DataAccess.OrderDao.InsertOrderTable(cusId, number_Table, "");

                int check = DataAccess.OrderDao.InsertOrderDetail(lastOrder, myDish.ID, des, quantity);
                if (check == 1)
                {
                    ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:Added(); ", true);


                    String url = "Detail.aspx?name=" + myDish.Name;
                    Server.Transfer(url);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:NotAdded(); ", true);
                }

            }
            catch
            {
                ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:NotAdded(); ", true);
            }




        }
        public void loadData()
        {
            myDish = DataAccess.DishDao.Get_Dish_By_Name(Name);
            Image1.ImageUrl = myDish.avatar;
            Dish_name.Text = myDish.Name;
        }
    }
}