using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace PurchaseOrderSystem
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string Conns = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\source\repos\PurchaseOrderSystem\PurchaseOrderSystem\App_Data\myDB.mdf;Integrated Security=True";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            getPONO();
            txtDT.Text = DateTime.Now.ToString("yyyy-MM-dd").ToString();
            getPartyName();
            getItemName();
        }
        public void getPONO()
        {
            SqlConnection con = new SqlConnection(Conns);
            con.Open();
            string query = "select PONo from tblPOMaster";
            SqlDataAdapter ad = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            con.Close();
            if (dt.Rows.Count >=1)
            {
                txtPONO.Text = "1001";
            }
            else
            {
                con.Open();
                string Query = "select PONo from tblPOMaster where PONo=(select MAX(PONo) from tblPOMaster)";
                SqlDataAdapter ads = new SqlDataAdapter(Query,con);
                DataTable dts = new DataTable();
                ads.Fill(dts);
                con.Close();
                txtPONO.Text = dts.Rows.ToString();
                int a;
                a = Convert.ToInt32(txtPONO.Text);
                a = a + 1;
                txtPONO.Text = a.ToString();
                con.Close();

            }


        }
        public void getPartyName()
        {
            SqlConnection con = new SqlConnection(Conns);
            con.Open();
            string query = "select PartyID,PartyName,City from tblPartyMaster";
            SqlDataAdapter ad = new SqlDataAdapter(query,con);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            con.Close();
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "PartyName";
            DropDownList1.DataValueField = "PartyID";
            DropDownList1.DataBind();
        }
        public void getItemName()
        {
            SqlConnection con = new SqlConnection(Conns);
            con.Open();
            string query = "select ItemId,ItemName from tblItemMaster";
            SqlDataAdapter ad = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            con.Close();
            DropDownList2.DataSource = dt;
            DropDownList2.DataTextField = "ItemName";
            DropDownList2.DataValueField = "ItemId";
            DropDownList2.DataBind();
        }
           public void CalAmt()
        {
            float t1, t2;
            bool b1 = float.TryParse(TxtQty.Text, out t1);
            bool b2 = float.TryParse(txtRate.Text, out t2);
            if (b1 && b2)
            {
                txtAmount.Text = (t1 * t2).ToString();
            }
            else
            {
                txtAmount.Text = "wrong input";
            }
        }

        protected void TxtQty_TextChanged(object sender, EventArgs e)
        {
            CalAmt();
        }

        protected void txtRate_TextChanged(object sender, EventArgs e)
        {
            CalAmt();
        }
        public void CalDisc()
        {
            float t1, t2;
            bool b1 = float.TryParse(txtAmount.Text, out t1);
            bool b2 = float.TryParse(txtDiscPer.Text, out t2);
            if (b1 && b2)
            {
                txtDiscount.Text = ((t1 * t2)/100).ToString();
            }
            else
            {
                txtDiscount.Text = "wrong input";
            }
        }

        protected void txtAmount_TextChanged(object sender, EventArgs e)
        {
            CalDisc();
         
        }

        protected void txtDiscPer_TextChanged(object sender, EventArgs e)
        {
            CalDisc();
        }

        protected void txtDiscount_TextChanged(object sender, EventArgs e)
        {
            txtTotal.Text = (float.Parse(txtAmount.Text) - float.Parse(txtDiscount.Text)).ToString();
          
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Conns);
            con.Open();
            string query = "insert into tblPODetails(POID,ItemID,Details,Qty,Rate,Amount,DiscPer,Discount,TotalAmt) values(6,'" + DropDownList2.SelectedItem.Text+"','"+ txtDetails.Text + "','"+ TxtQty.Text + "','"+ txtRate.Text + "','"+ txtAmount .Text+ "','"+ txtDiscPer.Text + "','"+ txtDiscount.Text + "','"+ txtTotal.Text + "')";
            SqlCommand cmd = new SqlCommand(query,con);
            int t=cmd.ExecuteNonQuery();
            Response.Write("data inserted");
            if (t > 0) {
                string query2 = "select ItemID,Details,Qty,Rate,Amount,DiscPer,Discount,TotalAmt from tblPODetails ";
            SqlDataAdapter ad = new SqlDataAdapter(query2,con);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

      
    }
}