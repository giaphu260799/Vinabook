﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
namespace _2019_CSDLNC_TH2_1712671.DAO
{
    public class DataProvider
    {
       private string ConnectionSTR = "Data Source=DESKTOP-MEST3HI\\MSSQLSEVER1;Initial Catalog=VINABOOK;Integrated Security=True";
        //private string ConnectionSTR = "Data Source=DESKTOP-MEST3HI\\MSSQLSEVER1;Initial Catalog=Partition_Vinabook;Integrated Security=True";
        public DataTable ExecuteQuery(string query, object[] parameter = null)
       {
           DataTable data = new DataTable();
           using (SqlConnection connection = new SqlConnection(ConnectionSTR))
           {
               connection.Open();
               SqlCommand command = new SqlCommand(query, connection);
               if(parameter != null)
               {
                   string[] listpara = query.Split(' ');
                   int i = 0;
                   foreach(string item in listpara)
                   {
                       if(item.Contains('@'))
                       {
                           command.Parameters.AddWithValue(item, parameter[i]);
                           i++;
                       }
                   }
               }
               SqlDataAdapter adapter = new SqlDataAdapter(command);
               adapter.Fill(data);
               connection.Close();
           }
           return data;
       }
       public int ExecuteNonQuery(string query, object[] parameter = null)
       {
           int data = 0;
           using (SqlConnection connection = new SqlConnection(ConnectionSTR))
           {
               connection.Open();
               SqlCommand command = new SqlCommand(query, connection);
               if (parameter != null)
               {
                   string[] listpara = query.Split(' ');
                   int i = 0;
                   foreach (string item in listpara)
                   {
                       if (item.Contains('@'))
                       {
                           command.Parameters.AddWithValue(item, parameter[i]);
                           i++;
                       }
                   }
               }
               data = command.ExecuteNonQuery();
               connection.Close();
           }
           return data;
       }
    }
}
