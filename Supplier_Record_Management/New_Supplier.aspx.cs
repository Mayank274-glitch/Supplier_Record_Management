using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Supplier_Record_Management
{
    public partial class New_Supplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

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