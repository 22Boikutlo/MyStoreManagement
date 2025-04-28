using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MyStore
{
    public partial class frmPork : Form
    {
        public frmPork()
        {
            InitializeComponent();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void txtPrice_TextChanged(object sender, EventArgs e)
        {
            int price = 50;
            if (rad5.Checked)
            {
                txtPrice.Text = price.ToString();
                txtPrice.Show();
            }
            else if(rad10.Checked)
            {
                price = price * 2;
                txtPrice.Text = price.ToString();
                txtPrice.Show();
            }
            else if (rad15.Checked)
            {
                price = price * 3;
                txtPrice.Text = price.ToString();
                txtPrice.Show();

            }
            else
            {
                MessageBox.Show("No size was selected. Please select size", "Select Size", MessageBoxButtons.OKCancel, MessageBoxIcon.Error);
            }

        }

        private void label6_Click(object sender, EventArgs e)
        {
            
        }

        private void btnBuy_Click(object sender, EventArgs e)
        {
            frmCustomerInfo CustomerForm = new frmCustomerInfo();
            CustomerForm.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
