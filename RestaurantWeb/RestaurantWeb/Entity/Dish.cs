using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RestaurantWeb.Entity
{
    public class Dish
    {
        public int ID { get; set; }
        public String Name { get; set; }

        public String avatar { get; set; }
        public int Type { get; set; }

        public String Description { get; set; }

        public double Discount { get; set; }
        public double Price { get; set; }

        public Dish(int iD, string name, int type, string description, double discount, double price, String avt)
        {
            ID = iD;
            Name = name;
            Type = type;
            Description = description;
            Discount = discount;
            Price = price;
            avatar = avt;
        }

        public Dish(int iD, string name, string description, double discount, double price)
        {
            ID = iD;
            Name = name;
            Description = description;
            Discount = discount;
            Price = price;
        }
        public Dish()
        {
        }

        public double getRealPrice()
        {
            return Price - Price * Discount;
        }
    }
}