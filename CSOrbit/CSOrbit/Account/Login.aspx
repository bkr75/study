<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Async="true" CodeBehind="Login.aspx.cs" Inherits="CSOrbit.Account.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main id="MainContentSection" role="main">
        <div class="col-md-5 mx-auto mt-5">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="text-center mb-4 text-primary">Login</h3>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="txtEmail" ErrorMessage="Email is required"
                            CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="RegexEmailLogin" runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Invalid email format"
                            CssClass="text-danger" Display="Dynamic"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ControlToValidate="txtPassword" ErrorMessage="Password is required"
                            CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="d-grid">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" aria-label="Sign in to your CS Orbit account" />
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server"
                            HeaderText="Please fix the following errors:"
                            CssClass="alert alert-danger mt-3" DisplayMode="BulletList" />
                    </div>

                    <div class="text-center mt-3">
                        <small>Don’t have an account?
                    <a href="Register.aspx" class="text-primary">Register here</a>
                        </small>
                    </div>


                    <asp:Label ID="lblMsg" runat="server" CssClass="text-center d-block mt-3"></asp:Label>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
