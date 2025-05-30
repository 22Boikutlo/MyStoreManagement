﻿using System;
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
    public partial class frmCustomerInfo : Form
    {
        SqlCommand _CMD;
        SqlDataReader _DTR;
        dbConnection _ConnectOpener = new dbConnection();
        string _strGender = "";
        string _strUserName = "";
        
        public frmCustomerInfo()
        {
            InitializeComponent();
        }

        private void btnCreateAcc_Click(object sender, EventArgs e)
        {
            if(txtFName.Text=="" | txtLName.Text=="" |txtAddress.Text=="" | txtEmail.Text==""| txtPhone.Text=="" | radMale.Checked == false | radFemale.Checked == false | radOther.Checked==false)
            {
                MessageBox.Show("Provide All Fields.\nThey are required for Adding a new staff member", "Field required check report", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtFName.Focus();
            }
            else
            {
                if (radMale.Checked == true)
                {
                    //_strGender = "Male";
                    _strGender = "M";
                }
                else
                    if (radFemale.Checked == true)
                {
                    //_strGender = "Female";
                    _strGender = "F";
                }
                else
                        if (radOther.Checked == true)
                {
                    //_strGender = "Other";
                    _strGender = "O";
                }
                
                {
                    Boolean _boolCharCheck = _ConnectOpener.charCheck(txtFName.Text);
                    _boolCharCheck = _ConnectOpener.charCheck(txtLName.Text);
                    _boolCharCheck = _ConnectOpener.charCheck(txtAddress.Text);
                    _boolCharCheck = _ConnectOpener.charCheck(txtPhone.Text);
                    _boolCharCheck = _ConnectOpener.charCheck(txtQuiz.Text);
                    _boolCharCheck = _ConnectOpener.charCheck(txtAns.Text);

                    if(_boolCharCheck == true)
                    {
                        MessageBox.Show("Special characters are not allowed as part of input", "Special characters not allowed", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                    else
                    {
                        //_ConnectOpener.ConnectString();
                        Boolean _boolCondition = _ConnectOpener.OpenConnect();
                        
                        _ConnectOpener.ConnectString();
                        _boolCondition = _ConnectOpener.OpenConnect();
                        if(_boolCondition == true)
                        {
                            //select added user to create tjh
                            _CMD = new SqlCommand(" INSERT INTO Customer( CustomerFirstName,CustomerLastName,CustomerGender,CustomerAddress,CustomerEmailAddress,CustomerPhoneNumber) " +
                                "                   VALUES(@name,@surname,@gender,@address,@email,@phone)", dbConnection._CONNECT);
                            _CMD.Parameters.AddWithValue("@name", txtFName.Text);
                            _CMD.Parameters.AddWithValue("@surname", txtLName.Text);
                            _CMD.Parameters.AddWithValue("@gender", _strGender);
                            _CMD.Parameters.AddWithValue("@address", txtAddress.Text);
                            _CMD.Parameters.AddWithValue("@email", txtEmail.Text);
                            _CMD.Parameters.AddWithValue("@phone", txtPhone.Text);
                            _CMD.ExecuteNonQuery();
                           // dbConnection._CONNECT.Close();
                            MessageBox.Show("Staff was added Successfully");
                        }
                        else
                        {
                            MessageBox.Show("Database Timeout");
                        }
                    }
                }
            }

        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
