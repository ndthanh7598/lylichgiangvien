using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Reporting;
using LyLichGiangVien.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LyLichGiangVien.View
{
    public partial class Thongkebaocao : System.Web.UI.Page
    {
        ReportDocument rdoc = new ReportDocument();

        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectDatabase conn = new ConnectDatabase();
            using (SqlConnection myCnn = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("giangvien_getall", myCnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable ds = new DataTable();
                da.Fill(ds);

             


                rdoc.Load(Server.MapPath("~/baocao.rpt"));
                rdoc.SetDataSource(ds);

                crvr1.ReportSource = rdoc;
                crvr1.DataBind();
                crvr1.RefreshReport();

            }

        }
    }
}


