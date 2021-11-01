using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;


namespace Supplier_Record_Management
{
    public partial class New_Supplier : System.Web.UI.Page
    {

        private string strConnectionString = ConfigurationManager.ConnectionStrings["supplier_recordsConnectionString"].ConnectionString;
        private SqlCommand _sqlCommand;
        private SqlDataAdapter _sqlDataAdapter;
        DataSet _dtSet;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        //work_ creating sql Conn
        private static void ShowAlertMessage(string error)
        {
            System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
            if (page != null)
            {
                error = error.Replace("'", "\'");
                System.Web.UI.ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + error + "');", true);
            }
        }
        public void CreateConnection()
        {
            SqlConnection _sqlConnection = new SqlConnection(strConnectionString);
            _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = _sqlConnection;
        }
        public void OpenConnection()
        {
            _sqlCommand.Connection.Open();
        }
        public void CloseConnection()
        {
            _sqlCommand.Connection.Close();
        }

      //  Insert
        public void btnInsert_Click()
        {
            try
            {
                CreateConnection();
                OpenConnection();
                _sqlCommand.CommandText = "InsertSupplier";
                _sqlCommand.CommandType = CommandType.StoredProcedure;
                //   _sqlCommand.Parameters.AddWithValue("@Event", "Add");Not needed
                _sqlCommand.Parameters.AddWithValue("@Name", Convert.ToString(tb_name.Text.Trim()));
                _sqlCommand.Parameters.AddWithValue("@Company", Convert.ToString(tb_company.Text.Trim()));
                _sqlCommand.Parameters.AddWithValue("@Email", Convert.ToString(tb_email.Text.Trim()));
                _sqlCommand.Parameters.AddWithValue("@Address", Convert.ToString(tb_address.Text.Trim()));
                _sqlCommand.Parameters.AddWithValue("@Mobile", Convert.ToInt32(tb_mobile.Text));
                int result = Convert.ToInt32(_sqlCommand.ExecuteNonQuery());
                if (result > 0)
                {

                    ShowAlertMessage("Record Is Inserted Successfully");
                    //  BindSupplierData();
                    //   ClearControls();doubt
                }
                else
                {

                    ShowAlertMessage("Failed Insert");
                }
            }
            catch (Exception ex)
            {

                ShowAlertMessage("Check your input data");

            }
            finally
            {
                CloseConnection();
                //  DisposeConnection();
            }
        }


        protected void btn_add_Click(object sender, EventArgs e)
        {
            // creating object of XML DOCument class  
            XmlDocument XmlDocObj = new XmlDocument();
            //loading XML File in memory  
            XmlDocObj.Load(Server.MapPath("Supplier_Record.xml"));
            //Select root node which is already defined  
            XmlNode RootNode = XmlDocObj.SelectSingleNode("Supplier_Record");
            //Creating one child node with tag name  supplierNode
            XmlNode supplierNode = RootNode.AppendChild(XmlDocObj.CreateNode(XmlNodeType.Element, "supplier", ""));

            //adding all data from text box to xml file one by one 
            supplierNode.AppendChild(XmlDocObj.CreateNode(XmlNodeType.Element, "Name", "")).InnerText = tb_name.Text;

            supplierNode.AppendChild(XmlDocObj.CreateNode(XmlNodeType.Element, "Company", "")).InnerText = tb_company.Text;

            supplierNode.AppendChild(XmlDocObj.CreateNode(XmlNodeType.Element, "Email", "")).InnerText = tb_email.Text;

            supplierNode.AppendChild(XmlDocObj.CreateNode(XmlNodeType.Element, "Address", "")).InnerText = tb_address.Text;

            supplierNode.AppendChild(XmlDocObj.CreateNode(XmlNodeType.Element, "Mobile", "")).InnerText = tb_mobile.Text;

            //after adding node, saving BookStore.xml back to the server  
            XmlDocObj.Save(Server.MapPath("Supplier_Record.xml"));
        }
    }
}