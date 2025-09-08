<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SaifPortFoliio._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Section -->
    <section id="hero" class="hero-section">
        <div class="container">
            <div class="row align-items-center min-vh-100">
                <div class="col-lg-6 order-2 order-lg-1">
                    <div class="hero-content">
                        <h1 class="hero-greeting">Hello, I'm</h1>
                        <h2 class="hero-name">Abdullah Al Saif</h2>
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
                            <a href="#projects" class="btn btn-primary me-3">
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
                            <a href="mailto:abdullahalsaif17313@gmail.com" class="social-link">
                                <i class="fas fa-envelope"></i>
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-6 order-1 order-lg-2">
                    <div class="hero-image">
                        <div class="profile-container">
                            <img src="/Content/img/profile/profile.jpg" alt="Abdullah Al Saif" class="profile-image"
                                 onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';"
                                 onload="this.style.display='block'; this.nextElementSibling.style.display='none';">
                            <div class="profile-placeholder">
                                <i class="fas fa-user-circle"></i>
                                <span>Profile Photo</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center mb-5">
                    <h2 class="section-title">About Me</h2>
                    <div class="section-divider"></div>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="about-content">
                        <h3 class="about-subtitle">Get to know me!</h3>
                        <p class="about-text">
                            I'm a passionate <strong>Software Developer and Graphics Designer</strong> with a strong foundation in 
                            problem-solving and creative thinking. My journey in technology started with a curiosity 
                            about how digital solutions can transform ideas into reality.
                        </p>
                        <p class="about-text">
                            With expertise in multiple programming languages including <strong>C, C++, and Java</strong>, I enjoy 
                            building efficient and scalable applications. My design skills complement my technical 
                            abilities, allowing me to create user-centered solutions that are both functional and visually appealing.
                        </p>
                        <p class="about-text">
                            I'm open to <strong>Job</strong> opportunities where I can contribute, learn and grow. If you have a good 
                            opportunity that matches my skills and experience then don't hesitate to <strong>contact me</strong>.
                        </p>
                        
                        <div class="about-button">
                            <a href="#contact" class="btn btn-primary">
                                <i class="fas fa-envelope"></i> Contact
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Skills Section -->
    <section id="skills" class="skills-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center mb-5">
                    <h2 class="section-title">My Skills</h2>
                    <div class="section-divider"></div>
                    <p class="section-subtitle">
                        Here you can see my technical skills and expertise levels in various technologies and tools
                    </p>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="skills-container">
                        <div class="skills-progress-grid" id="skills-progress-list">
                            <!-- Skills progress bars will be loaded dynamically -->
                            <div class="loading-state">
                                <i class="fas fa-cogs fa-spin"></i>
                                <p>Loading skills...</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Projects Section -->
    <section id="projects" class="projects-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center mb-5">
                    <h2 class="section-title">Projects</h2>
                    <div class="section-divider"></div>
                    <p class="section-subtitle">
                        Here you will find some of the personal and clients projects that I created with 
                        each project containing its own case study
                    </p>
                </div>
            </div>
            
            <!-- Projects Grid -->
            <div class="projects-container" id="projects-container">
                <!-- Projects will be loaded dynamically -->
                <div class="loading-state">
                    <i class="fas fa-spinner fa-spin"></i>
                    <p>Loading projects...</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Photography Section -->
    <section id="photography" class="photography-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center mb-5">
                    <h2 class="section-title">Photography</h2>
                    <div class="section-divider"></div>
                    <p class="section-subtitle">
                        Here you can find some of my photography work showcasing different styles and techniques
                    </p>
                </div>
            </div>
            
            <!-- Photography Grid -->
            <div class="photography-container" id="photography-container">
                <!-- Photos will be loaded dynamically -->
                <div class="loading-state">
                    <i class="fas fa-camera fa-spin"></i>
                    <p>Loading gallery...</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center mb-5">
                    <h2 class="section-title">Contact</h2>
                    <div class="section-divider"></div>
                    <p class="section-subtitle">
                        Feel free to Contact me by submitting the form below and I will get back to you as soon as possible
                    </p>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="contact-form-container">
                        <form class="contact-form" id="contactForm">
                            <div class="form-group">
                                <label for="contactName">Name</label>
                                <input type="text" id="contactName" name="name" class="form-control" placeholder="Enter Your Name" required />
                            </div>
                            
                            <div class="form-group">
                                <label for="contactEmail">Email</label>
                                <input type="email" id="contactEmail" name="email" class="form-control" placeholder="Enter Your Email" required />
                            </div>
                            
                            <div class="form-group">
                                <label for="contactMessage">Message</label>
                                <textarea id="contactMessage" name="message" class="form-control" rows="8" placeholder="Enter Your Message" required></textarea>
                            </div>
                            
                            <div class="form-group text-end">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    Submit
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Photo Modal -->
    <div class="modal fade" id="photoModal" tabindex="-1">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="photoModalTitle">Photo Gallery</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body text-center">
                    <img id="modalImage" src="" alt="" class="img-fluid" />
                    <div class="photo-description mt-3">
                        <p id="modalDescription"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* Modern Portfolio Styles */
        :root {
            --primary-color: #5865F2;
            --secondary-color: #4752C4;
            --light-blue: #E8F2FF;
            --dark-blue: #2E3A7A;
            --text-dark: #2D3748;
            --text-light: #718096;
            --border-color: #E2E8F0;
            --section-bg: #F7FAFC;
            --white: #FFFFFF;
        }

        /* Hero Section */
        .hero-section {
            padding: 100px 0;
            background: var(--white);
        }

        .hero-content h1 {
            font-size: 3.5rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 1rem;
        }

        .hero-content h2 {
            font-size: 3.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 2rem;
        }

        .hero-roles {
            font-size: 1.8rem;
            font-weight: 500;
            color: var(--text-light);
            margin-bottom: 2rem;
        }

        .typewriter-text {
            color: var(--primary-color);
            font-weight: 600;
        }

        .typewriter-cursor {
            animation: blink 1s infinite;
        }

        @keyframes blink {
            0%, 50% { opacity: 1; }
            51%, 100% { opacity: 0; }
        }

        .hero-description {
            font-size: 1.2rem;
            line-height: 1.8;
            color: var(--text-light);
            margin-bottom: 3rem;
        }

        .hero-buttons .btn {
            padding: 15px 30px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(88, 101, 242, 0.3);
        }

        .btn-outline-primary {
            color: var(--primary-color);
            border-color: var(--primary-color);
            background: transparent;
        }

        .btn-outline-primary:hover {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            color: var(--white);
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(88, 101, 242, 0.3);
        }

        .hero-social {
            margin-top: 3rem;
        }

        .social-link {
            display: inline-block;
            width: 50px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            background: var(--section-bg);
            color: var(--text-dark);
            border-radius: 50%;
            margin-right: 15px;
            font-size: 1.5rem;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .social-link:hover {
            background: var(--primary-color);
            color: var(--white);
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(88, 101, 242, 0.3);
        }

        /* Profile Image */
        .hero-image {
            text-align: center;
        }

        .profile-container {
            position: relative;
            width: 350px;
            height: 350px;
            margin: 0 auto;
        }

        .profile-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(88, 101, 242, 0.15);
            border: 4px solid var(--light-blue);
        }

        .profile-placeholder {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, var(--light-blue), #F0F7FF);
            border-radius: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
            font-size: 1.2rem;
            display: none;
            border: 4px solid var(--light-blue);
        }

        .profile-placeholder i {
            font-size: 5rem;
            margin-bottom: 1rem;
        }

        /* Section Styles */
        .about-section, .projects-section, .photography-section, .contact-section {
            padding: 100px 0;
        }

        .about-section {
            background: var(--section-bg);
        }

        .skills-section {
            background: var(--white);
        }

        .projects-section {
            background: var(--section-bg);
        }

        .photography-section {
            background: var(--white);
        }

        .contact-section {
            background: var(--section-bg);
        }

        .section-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 1rem;
        }

        .section-divider {
            width: 80px;
            height: 4px;
            background: var(--primary-color);
            margin: 0 auto 2rem;
            border-radius: 2px;
        }

        .section-subtitle {
            font-size: 1.1rem;
            color: var(--text-light);
            line-height: 1.8;
            max-width: 800px;
            margin: 0 auto;
        }

        /* About Section */
        .about-subtitle {
            font-size: 2rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 2rem;
        }

        .about-text {
            font-size: 1.1rem;
            line-height: 1.8;
            color: var(--text-light);
            margin-bottom: 1.5rem;
        }

        /* Skills Section */
        .skills-subtitle {
            font-size: 2rem;
            font-weight: 700;
            color: var,--text-dark);
            margin-bottom: 2rem;
        }

        /* Skills Progress Bars with Enhanced Floating Animation - Matching Reference Image */
        .skills-progress-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2.5rem;
            margin-top: 3rem;
            padding: 1rem 0;
        }

        .skill-progress-item {
            opacity: 0;
            transform: translateY(50px) scale(0.9);
            transition: all 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            margin-bottom: 1.5rem;
        }

        /* Enhanced floating animation keyframes matching the reference */
        @keyframes skillFloatIn {
            0% {
                opacity: 0;
                transform: translateY(60px) scale(0.8) rotate(-3deg);
            }
            50% {
                opacity: 0.8;
                transform: translateY(-8px) scale(1.02) rotate(1deg);
            }
            100% {
                opacity: 1;
                transform: translateY(0) scale(1) rotate(0deg);
            }
        }

        .skill-progress-item.float-in {
            animation: skillFloatIn 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
        }

        .skill-progress-name {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.8rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .skill-progress-percentage {
            font-size: 1.1rem;
            font-weight: 700;
            margin-left: 1rem;
        }

        .skill-progress-bar {
            height: 10px;
            background: #f0f0f0;
            border-radius: 20px;
            overflow: hidden;
            position: relative;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .skill-progress-fill {
            height: 100%;
            border-radius: 20px;
            transition: width 2s ease-in-out;
            position: relative;
            overflow: hidden;
        }

        /* Colors matching the reference image */
        .skill-progress-fill.programming {
            background: linear-gradient(90deg, #4285F4, #6FA8F7);
        }

        .skill-progress-fill.web-development {
            background: linear-gradient(90deg, #FF6B35, #FF8C69);
        }

        .skill-progress-fill.design {
            background: linear-gradient(90deg, #9C27B0, #BA68C8);
        }

        .skill-progress-fill.soft-skills {
            background: linear-gradient(90deg, #00BCD4, #4DD0E1);
        }

        .skill-progress-fill.default {
            background: linear-gradient(90deg, #667eea, #764ba2);
        }

        /* Animated shine effect */
        .skill-progress-fill::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
            animation: shine 3s ease-in-out infinite;
            animation-delay: 1.5s;
        }

        @keyframes shine {
            0% { left: -100%; }
            100% { left: 100%; }
        }

        /* Projects Grid */
        .projects-container {
            display: grid;
            gap: 60px;
        }

        .project-item {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 60px;
            align-items: center;
            background: var(--white);
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 8px 30px rgba(88, 101, 242, 0.08);
            transition: all 0.3s ease;
        }

        .project-item:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 50px rgba(88, 101, 242, 0.15);
        }

        .project-item:nth-child(even) .project-content {
            order: 2;
        }

        .project-item:nth-child(even) .project-image {
            order: 1;
        }

        .project-image {
            position: relative;
            overflow: hidden;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .project-image img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .project-image:hover img {
            transform: scale(1.05);
        }

        .project-placeholder {
            width: 100%;
            height: 300px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: var(--white);
            font-size: 1.2rem;
            border-radius: 12px;
        }

        .project-placeholder i {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .project-content h3 {
            font-size: 2rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 1rem;
        }

        .project-content p {
            font-size: 1.1rem;
            line-height: 1.8;
            color: var(--text-light);
            margin-bottom: 2rem;
        }

        .project-links a {
            display: inline-block;
            padding: 12px 25px;
            background: var(--primary-color);
            color: var(--white);
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            margin-right: 15px;
            transition: all 0.3s ease;
        }

        .project-links a:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(88, 101, 242, 0.3);
        }

        /* Photography Grid */
        .photography-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .photo-item {
            position: relative;
            overflow: hidden;
            border-radius: 12px;
            cursor: pointer;
            transition: transform 0.3s ease;
            box-shadow: 0 8px 25px rgba(88, 101, 242, 0.08);
        }

        .photo-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(88, 101, 242, 0.15);
        }

        .photo-item img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .photo-placeholder {
            width: 100%;
            height: 250px;
            background: linear-gradient(135deg, var(--light-blue), #F0F7FF);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
            font-size: 1.1rem;
        }

        .photo-placeholder i {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .photo-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(88, 101, 242, 0.8), rgba(71, 82, 196, 0.8));
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .photo-item:hover .photo-overlay {
            opacity: 1;
        }

        .photo-overlay h4 {
            color: var(--white);
            font-size: 1.3rem;
            font-weight: 600;
            text-align: center;
        }

        /* Contact Form */
        .contact-form-container {
            background: var(--white);
            padding: 50px;
            border-radius: 16px;
            box-shadow: 0 20px 50px rgba(88, 101, 242, 0.08);
        }

        .form-group {
            margin-bottom: 30px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 10px;
            font-size: 1.1rem;
        }

        .form-control {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid var(--border-color);
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(88, 101, 242, 0.1);
        }

        .loading-state {
            text-align: center;
            padding: 50px 0;
            color: var(--text-light);
        }

        .loading-state i {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: var(--primary-color);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero-content h1,
            .hero-content h2 {
                font-size: 2.5rem;
            }

            .hero-roles {
                font-size: 1.5rem;
            }

            .profile-container {
                width: 250px;
                height: 250px;
            }

            .project-item {
                grid-template-columns: 1fr;
                gap: 30px;
                padding: 1.5rem;
            }

            .project-item:nth-child(even) .project-content {
                order: 1;
            }

            .project-item:nth-child(even) .project-image {
                order: 2;
            }

            .photography-container {
                grid-template-columns: 1fr;
            }

            .contact-form-container {
                padding: 30px 20px;
            }

            .skills-progress-grid {
                grid-template-columns: 1fr;
                gap: 2rem;
            }
        }
    </style>
</asp:Content>
