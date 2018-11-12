using System;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InsUpdDel
{
    
    public partial class FrmIns : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SelectFun();
            }
        }
        private void SelectFun()
        {
            try
            {
               
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp = new SqlDataAdapter();
            cmd = new SqlCommand("spSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
             adp.SelectCommand = cmd;
             adp.Fill(dt);
            grdReg.DataSource = dt;
            grdReg.DataBind();
            grdUpdate.DataSource = dt;
            grdUpdate.DataBind();
            drpId.DataSource = dt;
                drpId.DataTextField = "id";
                drpId.DataValueField = "id";
            drpId.DataBind();
            drpId.Items.Insert(0, "SELECT");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Exception Found');</script>");
                throw ex;
            }
            finally
            {
                
                con.Close();
            }
          

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Spins",con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name",txtName.Text.ToUpper());
                cmd.Parameters.AddWithValue("@age", Convert.ToInt32(txtAge.Text));
                cmd.Parameters.AddWithValue("@district", txtDistrict.Text.ToUpper());
                cmd.Parameters.AddWithValue("@State", txtState.Text.ToUpper());
                cmd.ExecuteNonQuery();
                SelectFun();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }

        }

        protected void drpId_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(drpId.Text!= "SELECT")
            {
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter adp = new SqlDataAdapter();
                cmd = new SqlCommand("spSelectID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id",Convert.ToInt32(drpId.SelectedValue));
                adp.SelectCommand = cmd;
                adp.Fill(dt);
                if(dt.Rows.Count>0)
                {
                    txtUpdAge.Text = dt.Rows[0]["age"].ToString();
                    txtUpdDistrict.Text= dt.Rows[0]["district"].ToString();
                    txtUpdName.Text= dt.Rows[0]["name"].ToString();
                    txtUpdState.Text= dt.Rows[0]["state"].ToString();
                }
            }
            else
            {
                Response.Write("<script>alert('Select ID');</script>");
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spUpdateID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", txtUpdName.Text.ToUpper());
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(drpId.SelectedValue));
                cmd.Parameters.AddWithValue("@age", Convert.ToInt32(txtUpdAge.Text));
                cmd.Parameters.AddWithValue("@district", txtUpdDistrict.Text.ToUpper());
                cmd.Parameters.AddWithValue("@State", txtUpdState.Text.ToUpper());
                cmd.ExecuteNonQuery();
                SelectFun();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }


        }
        private void cancel()
        {
            txtName.Text = ""; txtAge.Text = ""; txtDistrict.Text = ""; txtState.Text = "";txtUpdState.Text = "";
            txtUpdName.Text = "";txtUpdDistrict.Text = "";txtUpdAge.Text = "";
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            cancel();
        }

        protected void btnUpdCancel_Click(object sender, EventArgs e)
        {
            cancel();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("spDeleteID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(drpId.SelectedValue));
            
            cmd.ExecuteNonQuery();
            SelectFun();
        }
    }
}