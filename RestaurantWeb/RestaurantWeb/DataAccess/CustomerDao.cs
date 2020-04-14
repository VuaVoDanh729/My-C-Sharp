using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RestaurantWeb.DataAccess
{
    public class CustomerDao
    {
        public static DataTable getAllCustomer()
        {
            String sql = "select * from customer";
            return Dao.GetDataBySQL(sql);
        }

        public static int insertCustomer(String name, String phone, String des, String address)
        {
            String sql = "insert into customer(name, phone, address, description) values (@name, @phone, @address, @des)";
            SqlParameter param1 = new SqlParameter("@name", SqlDbType.NVarChar);
            param1.Value = name;
            SqlParameter param2 = new SqlParameter("@phone", SqlDbType.VarChar);
            param2.Value = phone;
            SqlParameter param3 = new SqlParameter("@address", SqlDbType.NVarChar);
            param3.Value = address;
            SqlParameter param4 = new SqlParameter("@des", SqlDbType.NVarChar);
            param4.Value = des;

            return Dao.ExecuteSQLWithParameters(sql, param1, param2, param3, param4);
        }

        public static int getCussIdByPhone(String phone)
        {
            String sql = "select id from customer where phone ='" + phone + "'";
            return Int32.Parse(Dao.GetDataBySQL(sql).Rows[0][0].ToString());
        }
    }
}