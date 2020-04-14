using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RestaurantWeb
{
    public partial class Main : System.Web.UI.Page
    {
        String type;



        public int PageNumber
        {
            
            get
            {
                return ViewState["PageNumber"] == null ? 0 : Convert.ToInt32(ViewState["PageNumber"]);
            }
            set
            {
                ViewState["PageNumber"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 type = Convert.ToString(Request["type"]);
                if (String.IsNullOrEmpty(type))
                {
                    type = "MainDish";
                }
                loadData();
            }
        }
        void rptPages_ItemCommand(object source, RepeaterCommandEventArgs E)
        {
            PageNumber = Convert.ToInt32(E.CommandArgument) - 1;
            loadData();
        }


        public void loadData()
        {
            PagedDataSource pagedDataSource = new PagedDataSource();
            DataView dv = new DataView(DataAccess.DishDao.getDataByType(type));
            pagedDataSource.DataSource = dv;
            pagedDataSource.AllowPaging = true;
            pagedDataSource.PageSize = 20;
            pagedDataSource.CurrentPageIndex = PageNumber;//assign the current page to the PagedDataSource page index
            if (pagedDataSource.PageCount > 1)
            {
                Repeater1.DataSource = listPages(pagedDataSource.PageCount);
                Repeater1.Visible = true;
                Repeater1.DataBind();
                DataList1.DataSource = pagedDataSource;
                DataList1.DataBind();
            }
            else
            {
                Repeater1.Visible = false;
                DataList1.DataSource = pagedDataSource;
                DataList1.DataBind();
            }

        }

        private object listPages(int pageCount)
        {
            List<int> listPages = new List<int>();
            for (int i = 1; i <= pageCount; i++)
            {
                listPages.Add(i);
            }
            return listPages;
        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            loadData();
        }


        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
           
            String commandName = e.CommandName;
            if (commandName.Equals("Add"))
            {
                Label label = (Label)e.Item.FindControl("nameLb");
                String dish_name = label.Text.Trim();
                String url = "Order.aspx?name=" + dish_name;
                Server.Transfer(url);
            }
            else
            {
                Label label = (Label)e.Item.FindControl("nameLb");
                String dish_name = label.Text.Trim();
                String url = "Detail.aspx?name=" + dish_name;
                Server.Transfer(url);
            }
            


        }
    }
}
