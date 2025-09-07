<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SaifPortFoliio._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Section -->
    <section id="hero" class="hero-section">
        <div class="hero-content">
            <div class="container">
                <div class="row align-items-center min-vh-100">
                    <div class="col-lg-6 col-md-8 mx-auto text-center">
                        <div class="hero-text">
                            <h1 class="hero-greeting">Hello, I'm</h1>
                            <h2 class="hero-name text-gradient">Abdullah Al Saif</h2>
                            <div class="hero-roles">
                                <span class="role-prefix">I'm a </span>
                                <span id="typewriter" class="typewriter-text"></span>
                                <span class="typewriter-cursor">|</span>
                            </div>
                            <p class="hero-description">
                                Passionate about creating innovative solutions through code and design. 
                                I specialize in software development, graphics design, and problem-solving 
                                to bring ideas to life.
                            </p>
                            <div class="hero-buttons">
                                <a href="#projects" class="btn btn-primary-custom me-3">
                                    <i class="fas fa-code"></i> View My Work
                                </a>
                                <a href="#contact" class="btn btn-outline-primary">
                                    <i class="fas fa-envelope"></i> Get In Touch
                                </a>
                            </div>
                            <div class="hero-social">
                                <a href="https://github.com/saif17313" target="_blank" class="social-link">
                                    <i class="fab fa-github"></i>
                                </a>
                                <a href="https://linkedin.com/in/abdullah-al-saif" target="_blank" class="social-link">
                                    <i class="fab fa-linkedin"></i>
                                </a>
                                <a href="mailto:abdullah.saif@example.com" class="social-link">
                                    <i class="fas fa-envelope"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Animated Background Elements -->
        <div class="hero-bg-animation">
            <div class="floating-element element-1"></div>
            <div class="floating-element element-2"></div>
            <div class="floating-element element-3"></div>
        </div>
        
        <!-- Scroll Down Indicator -->
        <div class="scroll-indicator">
            <a href="#about" class="scroll-down">
                <span></span>
                <span></span>
                <span></span>
            </a>
        </div>
    </section>

</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/hero.css" rel="stylesheet" />
</asp:Content>
