<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Async="true" CodeBehind="Register.aspx.cs" Inherits="CSOrbit.Account.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main id="MainContentSection" role="main">
        <div class="col-md-6 mx-auto mt-5">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="text-center mb-4 text-primary">Create Account</h3>

                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtName" ErrorMessage="Full name is required"
                            CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="RegexFullName" runat="server"
                            ControlToValidate="txtName"
                            ErrorMessage="Please enter your full name (first and last)."
                            CssClass="text-danger" Display="Dynamic"
                            ValidationExpression="^[A-Za-z]+\s+[A-Za-z]+.*$" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="txtEmail" ErrorMessage="Email is required"
                            CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="RegexEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Invalid email format"
                            CssClass="text-danger" Display="Dynamic"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter a password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="txtPassword" ErrorMessage="Password is required"
                            CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="RegexPassword" runat="server"
                            ControlToValidate="txtPassword"
                            ErrorMessage="Password must use English letters/numbers only."
                            CssClass="text-danger" Display="Dynamic"
                            ValidationExpression="^[A-Za-z0-9!@#\$%\^&amp;\*\(\)_\-\+=\{\}\[\]\|\\:;'\&quot;,&lt;&gt;\.\?/`~]+$" />

                    </div>



                    <div class="mb-3">
                        <label class="form-label">Confirm Password</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Re-enter password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ControlToCompare="txtPassword"
                            ErrorMessage="Passwords do not match"
                            CssClass="text-danger" Display="Dynamic" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm password is required"
                            CssClass="text-danger" Display="Dynamic" />
                    </div>


                    <div class="d-grid">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" aria-label="Submit the registration form" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                            HeaderText="Please correct the following errors:"
                            CssClass="alert alert-danger mt-3" DisplayMode="BulletList" />
                    </div>

                    <asp:Label ID="lblMsg" runat="server" CssClass="text-center d-block mt-3"></asp:Label>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
