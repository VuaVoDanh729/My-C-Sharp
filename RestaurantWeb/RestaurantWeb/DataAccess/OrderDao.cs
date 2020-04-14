using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RestaurantWeb.DataAccess
{
    public class OrderDao
    {
        public static DataTable getAllOrders()
        {
            String sql = "select id as ID , customer_id as CustomerID , order_date as OrderDate, num_of_table as NumTable , description as Description , paid as Paid from order_table";
            return Dao.GetDataBySQL(sql);
        }

        public static int PayOrder(int id)
        {
            String sql = "update order_table " +
                       "set paid = 1 where id = " + id;
            int check = Dao.ExecuteSQL(sql);
            return check;
        }

        public static int InsertOrderTable(int cusId, int tableNum, String des)
        {
            String sql = "insert into order_table(customer_id, order_date, num_of_table, description, paid) values(@cusID, SYSDATETIME(), @tableNum,@des, 0)";
            SqlParameter param1 = new SqlParameter("@cusID", SqlDbType.Int);
            param1.Value = cusId;
            SqlParameter param2 = new SqlParameter("@tableNum", SqlDbType.Int);
            param2.Value = tableNum;
            SqlParameter param3 = new SqlParameter("@des", SqlDbType.NVarChar);
            param3.Value = des;
            return Dao.ExecuteSQLWithParameters(sql, param1, param2, param3);
        }

        public static int InsertOrderDetail(int orderId, int product_id, String description, int quantity)
        {
            String sql = "insert into order_detail(order_id,product_id,description,quantity) " +
                "values(@o_id, @p_id,@des,@quant)";

            SqlParameter param1 = new SqlParameter("@o_id", SqlDbType.Int);
            param1.Value = orderId;

            SqlParameter param2 = new SqlParameter("@p_id", SqlDbType.Int);
            param2.Value = product_id;

            SqlParameter param3 = new SqlParameter("@des", SqlDbType.NVarChar);
            param3.Value = description;

            SqlParameter param4 = new SqlParameter("@quant", SqlDbType.Int);
            param4.Value = quantity;

            return Dao.ExecuteSQLWithParameters(sql, param1, param2, param3, param4);
        }

        public static int getLastOrder_id()
        {
            String sql = "select count(id) as result from order_table";
            DataTable dt = Dao.GetDataBySQL(sql);
            int id = 99999;
            foreach (DataRow dr in dt.Rows)
            {
                id = Int32.Parse(dr["result"].ToString());
            }
            return id;
        }
    }
}