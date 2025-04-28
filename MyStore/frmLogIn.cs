using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace MyStore
{
    public partial class frmLogIn : Form
    {
        public dbConnection _ConnectOpener = new dbConnection();
        SqlCommand _CMD;
        SqlDataReader _DTR;
        string _strUserPassword = null, _strUsername = null;
        public frmLogIn()
        {
            InitializeComponent();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void frmLogIn_Load(object sender, EventArgs e)
        {
            txtUsername.Focus();
        }

        private void lnkReg_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
 
        }

        private void btnLogIn_Click(object sender, EventArgs e)
        {
            _strUsername = "";
            _strUserPassword = "";
            _strUsername = txtUsername.Text;
            _strUserPassword = txtPassword.Text;
            //check if the username and password are provided
            if (_strUsername == "" && _strUserPassword == "")
                {
                    MessageBox.Show("Provide your Username and Password", "LogIn details", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtUsername.Focus();
                }
                else
                    if (_strUsername == "")
                {
                    MessageBox.Show("Provide your username", "Username Required", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtUsername.Focus();

                }
                else
                        if (_strUserPassword == "")
                {
                    MessageBox.Show("Provide your password", "Password Required", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtPassword.Focus();
                }
                else if (_ConnectOpener.charCheck(_strUserPassword) == true)
                {
                    MessageBox.Show("Please avoid using special charactersas Password.", "Password Required", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtPassword.Focus();
                }
                else
            {
                _ConnectOpener.ConnectString();
                Boolean condition = _ConnectOpener.OpenConnect();
                if (condition == true)
                {
                    MessageBox.Show("Connection was established.", "Connected", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    //Code for what needs to happen when password is correct
                }

            }
        }
    }
}