using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RestaurantWeb.DataAccess
{
    public class DishDao
    {
        public static List<Entity.Dish> Select_All()
        {
            List<Entity.Dish> listDish = new List<Entity.Dish>();
            String sql = "Select * from dishs";
            DataTable dt = Dao.GetDataBySQL(sql);
            foreach (DataRow row in dt.Rows)
            {
                int ID = Int32.Parse(Convert.ToString(row["id"]));
                String Name = Convert.ToString(row["name"]);
                double Price = Double.Parse(Convert.ToString(row["price"]));
                double Discount = Double.Parse(Convert.ToString(row["discount"]));
                String Description = Convert.ToString(row["description"]);
                listDish.Add(new Entity.Dish(ID, Name, Description, Discount, Price));
            }
            return listDish;

        }
        public static DataTable getAll()
        {
            String sql = "Select * from dishs";
            return Dao.GetDataBySQL(sql);
        }

        public static List<Entity.Dish> Select_By_ID(int id)
        {
            List<Entity.Dish> listDish = new List<Entity.Dish>();
            String sql = "select dishs.id , dishs.name, dishs.price, dishs.discount, dishs.description " +
                            " from dishs left join menu_dish on menu_dish.dish_id = dishs.id " +
                            " where menu_dish.menu_id = @ID";
            SqlParameter param1 = new SqlParameter("@ID", SqlDbType.Int);
            param1.Value = id;
            DataTable dt = Dao.GetDataBySQLWithParameters(sql, param1);
            foreach (DataRow row in dt.Rows)
            {
                int ID = Int32.Parse(Convert.ToString(row["id"]));
                String Name = Convert.ToString(row["name"]);
                double Price = Double.Parse(Convert.ToString(row["price"]));
                double Discount = Double.Parse(Convert.ToString(row["discount"]));
                String Description = Convert.ToString(row["description"]);
                listDish.Add(new Entity.Dish(ID, Name, Description, Discount, Price));
            }
            return listDish;
        }

        public static void addDishAndType(String name, String avatar, int price, double discount, String des, int type)
        {

            addDish(name, avatar, price, discount, des);
            addType(name, type);

        }

        public static void addDish(String name, String avatar, int price, double discount, String des)
        {
            String sql = "insert into dishs(name, avatar , price , discount, description)  values(@name, @avatar , @price , @discount , @description )";
            SqlParameter param1 = new SqlParameter("@name", SqlDbType.NVarChar);
            param1.Value = name;
            SqlParameter param2 = new SqlParameter("@avatar", SqlDbType.NVarChar);
            param2.Value = avatar;
            SqlParameter param3 = new SqlParameter("@price", SqlDbType.Int);
            param3.Value = price;
            SqlParameter param4 = new SqlParameter("@discount", SqlDbType.Float);
            param4.Value = discount;
            SqlParameter param5 = new SqlParameter("@description", SqlDbType.NVarChar);
            param5.Value = des;
            Dao.ExecuteSQLWithParameters(sql, param1, param2, param3, param4, param5);
        }

        public static void addType(String name, int type)
        {
            int id = Get_id_by_name(name);
            String sql2 = "insert into menu_dish(dish_id , menu_id)  values (@dish_id, @menu_id)";
            SqlParameter param6 = new SqlParameter("@dish_id", SqlDbType.Int);
            param6.Value = id;
            SqlParameter param7 = new SqlParameter("@menu_id", SqlDbType.Int);
            param7.Value = type;

            Dao.ExecuteSQLWithParameters(sql2, param6, param7);
        }
        public static int Get_id_by_name(String name)
        {
            int id = 999999;
            String sql = "select * from dishs where dishs.name like N'%" + name + "%'";
            DataTable dt = Dao.GetDataBySQL(sql);
            foreach (DataRow dr in dt.Rows)
            {
                id = Int32.Parse(Convert.ToString(dr["id"]));
            }
            return id;
        }



        public static void Update_Dish_Type(String name, String avt, int price, double discount, String des, int type)
        {
            int id = Get_id_by_name(name);
            Update_Dish(id, name, avt, price, discount, des);
            Update_Type(type, id);
        }

        public static void Update_Dish(int id, String name, String avt, int price, double discount, String des)
        {
            String sql = "update dishs " +
                        " set name = @name, " +
                        " avatar = @avt," +
                        " price =  @price, " +
                        " discount = @discount," +
                         "description = @des " +
                         "where id = " + id;
            SqlParameter param1 = new SqlParameter("@name", SqlDbType.NVarChar);
            param1.Value = name;
            SqlParameter param2 = new SqlParameter("@avt", SqlDbType.NVarChar);
            param2.Value = avt;
            SqlParameter param3 = new SqlParameter("@price", SqlDbType.Int);
            param3.Value = price;
            SqlParameter param4 = new SqlParameter("@discount", SqlDbType.Float);
            param4.Value = discount;
            SqlParameter param5 = new SqlParameter("@des", SqlDbType.NVarChar);
            param5.Value = des;
            Dao.ExecuteSQLWithParameters(sql, param1, param2, param3, param4, param5);
        }

        public static void Update_Type(int type_id, int id)
        {
            String sql = "update menu_dish set menu_id = @type where id = @id";
            SqlParameter param1 = new SqlParameter("@type", SqlDbType.Int);
            param1.Value = type_id;
            SqlParameter param2 = new SqlParameter("@id", SqlDbType.Int);
            param2.Value = id;
            Dao.ExecuteSQLWithParameters(sql, param1, param2);
        }



        public static Entity.Dish Get_Dish_By_ID(int id)
        {
            Entity.Dish dish = null;
            int type = 9999;
            String sql2 = "select * from menu_dish where dish_id = " + id;
            DataTable dt2 = Dao.GetDataBySQL(sql2);
            foreach (DataRow row in dt2.Rows)
            {
                type = Int32.Parse(Convert.ToString(row["menu_id"]));
            }

            String sql = "select * from dishs where dishs.id = " + id;

            DataTable dt = Dao.GetDataBySQL(sql);
            foreach (DataRow row in dt.Rows)
            {
                int ID = Int32.Parse(Convert.ToString(row["id"]));
                String Name = Convert.ToString(row["name"]);
                String avatar = Convert.ToString(row["avatar"]);
                double Price = Double.Parse(Convert.ToString(row["price"]));
                double Discount = Double.Parse(Convert.ToString(row["discount"]));
                String Description = Convert.ToString(row["description"]);
                dish = new Entity.Dish(ID, Name, type, Description, Discount, Price, avatar);
            }

            return dish;
        }

        public static Entity.Dish Get_Dish_By_Name(String dishName)
        {
            Entity.Dish dish = null;
            

            String sql = "select * from dishs where dishs.name = N'" + dishName + "'";

            DataTable dt = Dao.GetDataBySQL(sql);
            foreach (DataRow row in dt.Rows)
            {
                int ID = Int32.Parse(Convert.ToString(row["id"]));
                String Name = Convert.ToString(row["name"]);
                String avatar = Convert.ToString(row["avatar"]);
                double Price = Double.Parse(Convert.ToString(row["price"]));
                double Discount = Double.Parse(Convert.ToString(row["discount"]));
                String Description = Convert.ToString(row["description"]);
                dish = new Entity.Dish(ID, Name, 0, Description, Discount, Price, avatar);
            }

            return dish;
        }

        public static DataTable getTypes()
        {
            String sql = "select * from menu";
            return Dao.GetDataBySQL(sql);
        }

        public static DataTable getDishesByTypeName(String type)
        {
            String sql = "select dishs.name  from menu , menu_dish , dishs " +
                "where menu.id = menu_dish.menu_id and menu_dish.dish_id = dishs.id" +
                " and menu.name like N'%" + type + "%'";
            return Dao.GetDataBySQL(sql);
        }

        public static DataTable getDataByType(String type)
        {
            int menu_id = 1;
            switch (type)
            {
                case "MainDish":
                    menu_id = 1;
                    break;
                case "Drink":
                    menu_id = 2;
                    break;
                case "Cake":
                    menu_id = 3;
                    break;
                case "Salad":
                    menu_id = 4;
                    break;
            }
            String sql = @"select dishs.id , dishs.name , dishs.avatar , dishs.price , dishs.description, dishs.discount from menu , menu_dish , dishs 
                where menu.id = menu_dish.menu_id and menu_dish.dish_id = dishs.id
				and menu.id = " + menu_id;
            return Dao.GetDataBySQL(sql);
        }
    }
}