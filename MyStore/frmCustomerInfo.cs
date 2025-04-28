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
            if (txtFName.Text == "" && txtLName.Text == "" && txtAddress.Text == "" && txtEmail.Text == "" && txtPhone.Text == "" && (radMale.Checked == false | radFemale.Checked == false | radOther.Checked == false))
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

                    if (_boolCharCheck == true)
                    {
                        MessageBox.Show("Special characters are not allowed as part of input", "Special characters not allowed", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                    else
                    {
                        //_ConnectOpener.ConnectString();
                        Boolean _boolCondition = _ConnectOpener.OpenConnect();

                        _ConnectOpener.ConnectString();
                        _boolCondition = _ConnectOpener.OpenConnect();
                        if (_boolCondition == true)
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
            if (txtPassword.Text == txtConfirmedPassword.Text)
            {
                btnCreateAcc.Select();
            }
            else
            {
                MessageBox.Show("Passwords do not match. Please check and retype the password", "No Match", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtConfirmedPassword.Clear();
                txtConfirmedPassword.Focus();
            }

        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }



        private void lblSpecialCharacter(object sender, EventArgs e)
        {
            Boolean _boolCharChecker = _ConnectOpener.charCheck(txtPassword.Text);
            if (_boolCharChecker == false)
            {
                MessageBox.Show("The password should atleast have 1 special character.", "Characters Required", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                lblSpecialChar.ForeColor = Color.Green;
            }
        }

        private void lblLowCase(object sender, EventArgs e)
        {
            Boolean _boolLowerCase = checkUpper(txtPassword.Text);
            if (_boolLowerCase == false)
            {
                MessageBox.Show("Your password should consist of lowercase", "Lowercase Required", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                lblLowcase.ForeColor = Color.Green;
            }
        }


        private void lblUpperCase(object sender, EventArgs e)
        {
            Boolean _boolUpperCase = checkUpper(txtPassword.Text);
            if (_boolUpperCase == true)
            {
                lblUpCase.ForeColor = Color.Green;
            }
            else
            {
                MessageBox.Show("Your password should consist of uppercase", "Uppercase Required", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void txtPassword_TextChanged(object sender, EventArgs e)
        {
            //first determines length
            int _intLength = txtPassword.Text.Length;
            Boolean _boolUpperCase = checkUpper(txtPassword.Text);
            Boolean _boolLowerCase = checkLower(txtPassword.Text);
            Boolean _boolCharChecker = _ConnectOpener.charCheck(txtPassword.Text);
            Boolean _boolInputPassword = ContainsNums(txtPassword.Text);
            lblNumOfCharacters.ForeColor = (_intLength >= 8 && _intLength <= 16) ? Color.Green : Color.Black;
            lblUpCase.ForeColor = (_boolUpperCase == true) ? Color.Green : Color.Black;
            lblLowcase.ForeColor = (_boolLowerCase == true) ? Color.Green : Color.Black;
            lblSpecialChar.ForeColor = (_boolCharChecker == true) ? Color.Green : Color.Black;
            lblNums.ForeColor = (_boolInputPassword == true) ? Color.Green : Color.Black;

            if(_intLength >= 9 && _intLength <= 16 && _boolUpperCase && _boolLowerCase && _boolCharChecker && _boolInputPassword )
            {
                MessageBox.Show("The password length should be atleast 8 and less than 16 characters." +
                    "\nYour password should consist of an uppercase and a lowercase." +
                    " \nThe password should atleast have 1 special character and atleast 1 numeric.", "Invalid password synthax." , MessageBoxButtons.OK, MessageBoxIcon.Error);
                //        
            }


        }   ///SPECIAL METHODS FOR PASSWORD CONSTRAINTS
            public Boolean ContainsNums(string _strInput)
            {
                return _strInput.Any(char.IsDigit);
            }

            public Boolean checkUpper(string _strInput)
            {
                foreach (char c in _strInput)
                {
                    if (char.IsUpper(c))
                    {
                        return true;
                    }
                }
                return false;
            }

            public Boolean checkLower(string _strInput)
            {
                foreach (char c in _strInput)
                {
                    if (char.IsLower(c))
                    {
                        return true;
                    }
                }
                return false;
            }
        

    }
}
        //    if (_intLength >= 7 && _intLength <= 15)
        //    {
        //        lblNumOfCharacters.ForeColor = Color.Green;

        //        //checks if there is uppercase in the code
        //        if (_boolUpperCase == true)
        //        {
        //            lblUpCase.ForeColor = Color.Green;
                    
        //            //checks if there is lowercase in the code
        //            if (_boolLowerCase == true)
        //            {
        //                lblLowcase.ForeColor = Color.Green;

        //                //checks for special characters
        //                if (_boolCharChecker == true)
        //                {
        //                    lblSpecialChar.ForeColor = Color.Green;

        //                    //checks for numeric
        //                    if (_boolInputPassword == true)
        //                    {
        //                        lblNums.ForeColor = Color.Green;
        //                    }
        //                    else
        //                    {
        //                        MessageBox.Show("The password should atleast have 1 numeric character.", "Numbers Required", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //                        txtPassword.Clear();
        //                        txtPassword.Focus();
        //                        lblNums.ForeColor = Color.Black;
        //                    }
        //                }
        //                else
        //                {
        //                    MessageBox.Show("The password should atleast have 1 special character.", "Characters Required", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //                    txtPassword.Clear();
        //                    txtPassword.Focus();
        //                    lblSpecialChar.ForeColor = Color.Black;
        //                }
        //            }
        //            else
        //            {
        //                MessageBox.Show("Your password should consist of Lowercase", "Lowercase Required", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //                txtPassword.Clear();
        //                txtPassword.Focus();
        //                lblLowcase.ForeColor = Color.Black;
        //            }
        //        }
        //        else
        //        {
        //            MessageBox.Show("Your password should consist of uppercase", "Uppercase Required", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //            txtPassword.Clear();
        //            txtPassword.Focus();
        //            lblUpCase.ForeColor = Color.Black;
        //        }

        //    }
        //    else
        //    {
        //        MessageBox.Show("The password length should be atleast 8 and less than 16 characters.", "Invalid password length", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //        txtPassword.Clear();
        //        txtPassword.Focus();
        //        lblNumOfCharacters.ForeColor = Color.Black;
        //    }

  
        //}

