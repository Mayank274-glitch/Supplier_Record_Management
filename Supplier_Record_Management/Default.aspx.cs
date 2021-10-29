using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using AjaxControlToolkit;

namespace Supplier_Record_Management
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                Page.MaintainScrollPositionOnPostBack = true;
                //GridView1.DataBind();
            }
        }

        
       //check_1
      

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
                //(e.Row.FindControl("lblRowNumber") as Label).Text = (e.Row.RowIndex + 1).ToString();

            }
           
        }

        class Supplier_Dummy
        {
            public string Name { get; set; }
            public string Company { get; set; }
            public string Email { get; set; }
            public string Address { get; set; }
            public string Mobile { get; set; }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (GridViewRow rowS = GridView1.SelectedRow)
            {
                int selectedIndex = GridView1.SelectedIndex;
                ajxtb_name.Text = GridView1.Rows[selectedIndex].Cells[1].Text;
                ajxtb_company.Text = GridView1.Rows[selectedIndex].Cells[2].Text;
                ajxtb_email.Text =GridView1.Rows[selectedIndex].Cells[3].Text;
                ajxtb_address.Text = GridView1.Rows[selectedIndex].Cells[4].Text;
                ajxtb_mobile.Text = GridView1.Rows[selectedIndex].Cells[5].Text;

                // for name change
           //     temptxtnamevalue = ajxtb_name.Text.ToString();//GridView1.Rows[selectedIndex].Cells[1].Text;
            }
          

            foreach (GridViewRow row in GridView1.Rows)
                {
                    if (row.RowIndex == GridView1.SelectedIndex)
                    {
                    // row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                    ModalPopupExtender1.Show();


                }
                    else
                    {
                        //row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                        row.ToolTip = "Click to select this row.";
                    }
                }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            // instantiate XmlDocument and load XML from file
            string path = AppDomain.CurrentDomain.BaseDirectory;
            XDocument doc = XDocument.Load(path + "Supplier_Record.xml");

            string temptxtnamevalue = ajxtb_name.Text;
            var node = doc.Descendants("supplier").FirstOrDefault(cd => cd.Element("Name").Value == temptxtnamevalue);

            //Updating all values
            node.SetElementValue("Name", ajxtb_name.Text);
            node.SetElementValue("Company", ajxtb_company.Text);
            node.SetElementValue("Email", ajxtb_email.Text);
            node.SetElementValue("Address", ajxtb_address.Text);
            node.SetElementValue("Mobile", ajxtb_mobile.Text);


            // save the XmlDocument back to disk
            doc.Save(path + "Supplier_Record.xml");

            //  gvServerConfiguration.Databind();
            // uppServerConfiguration.Update();
           Response.Redirect(Request.Url.ToString());


        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Hide();
        }
    }
}