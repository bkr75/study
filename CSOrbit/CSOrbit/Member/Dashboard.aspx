<%@ Page Title="Member Dashboard" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CSOrbit.Member.Dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main id="MainContentSection" role="main">
        <div class="container mt-5">
            <div class="text-center mb-5">
                <h2>Welcome, <%: Session["FirstName"] %> 👋</h2>
                <p class="lead">Here are some resources recommended for you:</p>
            </div>

            <div class="row" runat="server" id="suggestedSection">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 mb-4 d-flex align-items-stretch">
                            <div class="card shadow-sm w-100">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <div>
                                        <h5 class="card-title text-primary"><%# Eval("Title") %></h5>
                                        <p class="card-text"><%# Eval("Description") %></p>
                                        <span class="badge bg-secondary"><%# Eval("Category") %></span>
                                    </div>
                                    <div class="mt-3">
                                        <a href='<%# Eval("FilePath") %>'
                                            target="_blank"
                                            class="btn btn-outline-primary w-100">Visit Site</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </main>
</asp:Content>
