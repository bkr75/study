<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CSOrbit.Admin.Dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main id="MainContentSection" role="main">
        <div class="container mt-5">
            <h2 class="text-center text-primary">Admin Dashboard</h2>
            <p class="text-center">Welcome, <%= Session["FirstName"] %> 👋</p>
            <hr />

            <h4>Manage Resources</h4>
            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by title or category"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary w-100" OnClick="btnSearch_Click" />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary w-100" OnClick="btnReset_Click" />
                </div>
            </div>

            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped"
                AutoGenerateColumns="False" DataKeyNames="ResourceID"
                OnRowEditing="GridView1_RowEditing"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowUpdating="GridView1_RowUpdating"
                OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="ResourceID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:HyperLinkField
                        DataNavigateUrlFields="FilePath"
                        Text="Visit"
                        HeaderText="Link"
                        Target="_blank" />
                </Columns>
            </asp:GridView>


            <h5 class="mt-4">Add New Resource</h5>
            <div class="row g-3 align-items-end">
                <div class="col-md-3">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Title"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" placeholder="Description"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtCat" runat="server" CssClass="form-control" placeholder="Category"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label class="form-label">Resource Link (URL)</label>
                    <asp:TextBox ID="txtLink" runat="server" CssClass="form-control"
                        placeholder="https://example.com/your-resource"></asp:TextBox>
                </div>
            </div>

            <div class="mt-3">
                <asp:Button ID="btnAdd" runat="server" Text="Add Resource" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
            </div>

            <asp:Label ID="Label1" runat="server" CssClass="fw-bold d-block mt-3"></asp:Label>


            <asp:Label ID="lblMsg" runat="server" CssClass="mt-3 d-block"></asp:Label>
        </div>
    </main>
</asp:Content>
