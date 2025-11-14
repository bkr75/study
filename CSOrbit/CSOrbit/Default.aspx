<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSOrbit._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main id="MainContentSection" role="main">
        <!-- ===== Hero Section ===== -->
        <section class="text-center py-5 bg-light border-bottom">
            <div class="container">
                <h1 class="display-5 fw-bold">
                    <asp:Label ID="lblWelcome" runat="server" Text="Welcome to"></asp:Label>
                    <span class="text-primary">CS Orbit</span>
                </h1>

                <p class="lead mt-3 mb-4">
                    A learning hub for web technologies, programming, and database skills, built for students, by students.
                </p>

                <% if (Session["UserEmail"] != null)
                    { %>
                <a href="Resources/AllResources.aspx" class="btn btn-primary btn-lg mx-2">Explore Resources</a>
                <% }
                else
                { %>
                <a href="Account/Login.aspx" class="btn btn-primary btn-lg mx-2">Explore Resources</a>
                <% } %>

                <a href="Account/Register.aspx" class="btn btn-outline-primary btn-lg mx-2">Join Now</a>

                <% if (Session["FirstName"] != null)
                    { %>
                <p class="mt-4 text-success fs-5">👋 Welcome , <strong><%: Session["FirstName"] %></strong>!</p>
                <% } %>
            </div>
        </section>


        <!-- ===== About Section ===== -->
        <section class="py-5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 mb-4">
                        <img src="https://cdn-icons-png.flaticon.com/512/1828/1828961.png" class="img-fluid rounded shadow" alt="Learning illustration" />
                    </div>
                    <div class="col-md-6">
                        <h2 class="fw-bold mb-3">About CS Orbit</h2>
                        <p class="lead">CS Orbit is an educational platform designed to help IT and Computer Science students learn modern web development using ASP.NET, C#, HTML, CSS, and SQL.</p>
                        <p>Our goal is to make learning practical and project-based — helping you build real-world applications, not just memorize theory.</p>
                        <a href="About.aspx" class="btn btn-outline-primary mt-3">Learn More</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- ===== Features Section ===== -->
        <section class="py-5 bg-light border-top border-bottom">
            <div class="container text-center">
                <h2 class="fw-bold mb-5">Why Choose <span class="text-primary">CS Orbit</span>?</h2>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="card h-100 shadow-sm border-0">
                            <div class="card-body">
                                <i class="bi bi-laptop fs-1 text-primary mb-3"></i>
                                <h5 class="card-title">Hands-on Learning</h5>
                                <p class="card-text">Every section includes real coding tasks and examples you can try instantly.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card h-100 shadow-sm border-0">
                            <div class="card-body">
                                <i class="bi bi-people fs-1 text-primary mb-3"></i>
                                <h5 class="card-title">Community Driven</h5>
                                <p class="card-text">A platform built by students to help each other succeed — share, learn, and grow together.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card h-100 shadow-sm border-0">
                            <div class="card-body">
                                <i class="bi bi-shield-check fs-1 text-primary mb-3"></i>
                                <h5 class="card-title">Secure & Reliable</h5>
                                <p class="card-text">We follow best practices in security and design to keep your data safe and your experience smooth.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ===== Popular Resources Section ===== -->
        <section class="py-5">
            <div class="container text-center">
                <h2 class="fw-bold mb-4">Popular Topics</h2>
                <p class="lead mb-5">Explore our most viewed and recommended learning resources.</p>

                <div class="row g-4">
                    <div class="col-md-3">
                        <div class="card shadow-sm h-100">
                            <div class="card-body">
                                <h5 class="card-title text-primary">HTML & CSS</h5>
                                <p class="card-text">Design and structure modern websites from scratch.</p>
                                <a href="Resources/AllResources.aspx" class="btn btn-outline-primary btn-sm">Learn More</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card shadow-sm h-100">
                            <div class="card-body">
                                <h5 class="card-title text-primary">C# & ASP.NET</h5>
                                <p class="card-text">Build dynamic, data-driven web applications.</p>
                                <a href="Resources/AllResources.aspx" class="btn btn-outline-primary btn-sm">Learn More</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card shadow-sm h-100">
                            <div class="card-body">
                                <h5 class="card-title text-primary">SQL & Databases</h5>
                                <p class="card-text">Learn how to design, query, and connect databases.</p>
                                <a href="Resources/AllResources.aspx" class="btn btn-outline-primary btn-sm">Learn More</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card shadow-sm h-100">
                            <div class="card-body">
                                <h5 class="card-title text-primary">Web Security</h5>
                                <p class="card-text">Understand authentication, encryption, and safe coding.</p>
                                <a href="Resources/AllResources.aspx" class="btn btn-outline-primary btn-sm">Learn More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ===== Call to Action Section ===== -->
        <section class="py-5 bg-primary text-white text-center">
            <div class="container">
                <h2 class="fw-bold mb-3">Start your learning journey today!</h2>
                <p class="lead mb-4">Sign up for free and unlock hundreds of curated resources across different technologies.</p>
                <a href="Account/Register.aspx" class="btn btn-light btn-lg mx-2">Create Account</a>
                <a href="Resources/AllResources.aspx" class="btn btn-outline-light btn-lg mx-2">Browse Resources</a>
            </div>
        </section>
    </main>
</asp:Content>
