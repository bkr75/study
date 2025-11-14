<%@ Page Title="All Resources" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="AllResources.aspx.cs" Inherits="CSOrbit.Resources.AllResources" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main id="MainContentSection" role="main">
        <div class="container mt-4">
            <h2 class="text-primary text-center mb-4">Learning Resources</h2>

            <div class="row mb-3">
                <div class="col-md-8">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by title or category"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary w-100" OnClick="btnSearch_Click" />
                </div>
            </div>

            <asp:GridView ID="GridView1" runat="server"
                CssClass="table table-bordered table-striped"
                AutoGenerateColumns="False"
                EmptyDataText="No resources available.">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:HyperLinkField DataNavigateUrlFields="FilePath"
                        Text="Visit"
                        HeaderText="Link"
                        Target="_blank" />
                </Columns>
            </asp:GridView>

        </div>
    </main>
</asp:Content>
