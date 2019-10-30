using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LyLichGiangVien.Model;
using System.Data;
using System.Data.SqlClient;

namespace LyLichGiangVien.View
{
    public partial class quanLyHoSoKhoaHoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["quyen"].ToString()) == 1)
            {
                if (Request.QueryString["func"] != null)
                {
                    if (Request.QueryString["func"].ToString().Equals("duyet"))
                    {

                        ConnectDatabase conn = new ConnectDatabase();
                        using (SqlConnection sqlConnection = conn.connectDatabase())
                        {
                            SqlCommand cmd = new SqlCommand("updateTrangThaiLyLichGV", sqlConnection);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("magv", Convert.ToInt32(Request.QueryString["magv"]));
                            cmd.Parameters.AddWithValue("TrangThai", Request.QueryString["tt"].ToString());
                            cmd.ExecuteNonQuery();
                            layTatCaLylich();
                        }

                    }
                }

                if (Request.QueryString["status"] != null)
                {
                    if (Request.QueryString["status"].Equals("load"))
                    {
                        layTatCaLylich();
                    }
                }
            if (Request.QueryString["timkiem"] != null)
            {
                if (Request.QueryString["tengv"] != null)
                {
                    ConnectDatabase conn = new ConnectDatabase();
                    using (SqlConnection sqlConnection = conn.connectDatabase())
                    {
                        SqlCommand sqlCommand = new SqlCommand("layTatCaLyLichGV", sqlConnection);
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        sqlCommand.Parameters.AddWithValue("@tenGV", Request.QueryString["tengv"].ToString());
                        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                        DataTable dataTable = new DataTable();
                        sqlDataAdapter.Fill(dataTable);
                        gridView_lyLich.DataSource = dataTable;
                        gridView_lyLich.DataBind();
                    }
                }
            }
            }
            else
            {
                Response.Redirect("welcome.aspx");
            }
        }
         private void layTatCaLylich()
        {
            ConnectDatabase conn = new ConnectDatabase();
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("danhSachHoSoLyLich_GV", sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                gridView_lyLich.DataSource = dataTable;
                gridView_lyLich.DataBind();
            }
        }


        public override void VerifyRenderingInServerForm(Control control)
        {
            return;
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            
            ConnectDatabase conn = new ConnectDatabase();
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand sqlCommand = new SqlCommand("layTatCaLyLichGV", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@tenGV", tenGV.Text);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                gridView_lyLich.DataSource = dataTable;
                gridView_lyLich.DataBind();
            }

        }
    }
}