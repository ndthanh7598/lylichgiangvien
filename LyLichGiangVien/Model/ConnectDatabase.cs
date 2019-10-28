using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LyLichGiangVien.Model
{
    public class ConnectDatabase
    {
        public string strCon = @"Data Source=DESKTOP-LCKS2LS\Q;Initial Catalog=Fithou.Web.Adv;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        public SqlConnection connectDatabase()
        {
            SqlConnection myCnn = new SqlConnection(strCon);
            myCnn.Open();
            return myCnn;
        }
    }
}