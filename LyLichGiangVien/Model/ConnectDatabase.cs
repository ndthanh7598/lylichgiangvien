using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LyLichGiangVien.Model
{
    public class ConnectDatabase
    {
        public string strCon = @"Data Source=DESKTOP-KLCUD63\THANH;Initial Catalog=lylichgiangvien;Integrated Security=True";
        public SqlConnection connectDatabase()
        {
            SqlConnection myCnn = new SqlConnection(strCon);
            myCnn.Open();
            return myCnn;
        }
    }
}