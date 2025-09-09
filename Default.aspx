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
                            <img src="/Content/img/profile/dp.png" alt="Abdullah Al Saif" class="profile-image"
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
            
            <div class="row align-items-center">
                <!-- About Image Section -->
                <div class="col-lg-5 mb-4 mb-lg-0">
                    <div class="about-image">
                        <img src="/Content/img/profile/aboutme.png" alt="Abdullah Al Saif - About Me" class="about-img"
                             onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';"
                             onload="this.style.display='block'; this.nextElementSibling.style.display='none';">
                        <div class="about-img-placeholder">
                            <i class="fas fa-user-circle"></i>
                            <span>About Me Photo</span>
                        </div>
                    </div>
                </div>
                
                <!-- About Content Section -->
                <div class="col-lg-7">
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
                <!-- Contact Information Section -->
                <div class="col-lg-5 mb-4">
                    <div class="contact-info-container">
                        <h3 class="contact-info-title">For any information, <strong>contact me</strong></h3>
                        
                        <div class="contact-info-item">
                            <div class="contact-info-icon">
                                <i class="fas fa-user"></i>
                            </div>
                            <div class="contact-info-content">
                                <h4>Name</h4>
                                <p>Abdullah Al Saif</p>
                            </div>
                        </div>

                        <div class="contact-info-item">
                            <div class="contact-info-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="contact-info-content">
                                <h4>Address</h4>
                                <p>Dept. of CSE, KUET, Khulna, Bangladesh</p>
                            </div>
                        </div>

                        <div class="contact-info-item">
                            <div class="contact-info-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div class="contact-info-content">
                                <h4>Email</h4>
                                <p>abdullahalsaif17313@gmail.com</p>
                                <p>saif2107017@gmail.com</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contact Form Section -->
                <div class="col-lg-6">
                    <div class="contact-form-container">
                        <h3 class="contact-form-title">Message me</h3>
                        <div class="contact-form">
                            <div class="form-group">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email" required="true"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" placeholder="Message.." TextMode="MultiLine" Rows="6" required="true"></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <asp:Button ID="btnSendMessage" runat="server" CssClass="btn btn-contact" Text="Send message" OnClick="btnSendMessage_Click" />
                            </div>
                            
                            <!-- Success/Error Messages -->
                            <div id="messageStatus" runat="server" visible="false" class="alert">
                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            </div>
                        </div>
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

    <!-- Skills Debugging Script -->
    <script>
        // Debug script to force load skills from database
        document.addEventListener('DOMContentLoaded', function() {
            console.log('🔧 Skills debug script loaded');
            
            // Check if server data is available
            if (window.serverData && window.serverData.skills) {
                console.log('✅ Server skills data found, loading from database...');
                loadSkillsFromServer();
            } else {
                console.log('⚠️ No server skills data, waiting for database...');
                // Wait for server data to load
                setTimeout(function() {
                    if (window.serverData && window.serverData.skills) {
                        loadSkillsFromServer();
                    } else {
                        console.log('❌ Database skills not available after 5 seconds');
                        showSkillsError();
                    }
                }, 5000);
            }
        });

        function loadSkillsFromServer() {
            var skillsList = document.getElementById('skills-progress-list');
            if (!skillsList) return;

            var skills = window.serverData.skills;
            if (!skills || skills.length === 0) {
                showSkillsError();
                return;
            }

            var html = '';
            for (var i = 0; i < skills.length; i++) {
                var skill = skills[i];
                var colorClass = getSkillColorClass(skill.category);
                
                html += '<div class="skill-progress-item" style="animation-delay: ' + (i * 0.2) + 's">';
                html += '<div class="skill-progress-name">';
                html += skill.name;
                html += '<span class="skill-progress-percentage ' + colorClass + '">' + skill.level + '%</span>';
                html += '</div>';
                html += '<div class="skill-progress-bar">';
                html += '<div class="skill-progress-fill ' + colorClass + '" data-percentage="' + skill.level + '"></div>';
                html += '</div>';
                html += '</div>';
            }
            
            skillsList.innerHTML = html;
            console.log('✅ Database skills loaded successfully! Count:', skills.length);
            
            // Start floating animations
            setTimeout(function() {
                animateSkillsWithFloating();
            }, 100);
        }

        function getSkillColorClass(category) {
            if (!category) return 'default';
            
            var cat = category.toLowerCase();
            if (cat.includes('programming')) return 'programming';
            if (cat.includes('web')) return 'web-development';
            if (cat.includes('design')) return 'design';
            if (cat.includes('tools')) return 'tools';
            if (cat.includes('database')) return 'database';
            if (cat.includes('marketing')) return 'marketing';
            if (cat.includes('cms')) return 'cms';
            return 'default';
        }

        function animateSkillsWithFloating() {
            var skillItems = document.querySelectorAll('.skill-progress-item');
            var progressBars = document.querySelectorAll('.skill-progress-fill');
            
            console.log('🎯 Starting floating animations for', skillItems.length, 'skills');
            
            // Animate skill items with floating effect
            skillItems.forEach(function(item, index) {
                setTimeout(function() {
                    item.classList.add('float-in');
                }, index * 150);
            });
            
            // Animate progress bars after floating animation
            progressBars.forEach(function(bar, index) {
                var percentage = bar.getAttribute('data-percentage');
                setTimeout(function() {
                    bar.style.width = percentage + '%';
                }, index * 200 + 800); // Start after floating animations
            });
        }
    </script>

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
            border-color: var,--secondary-color);
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
            border-color: var,--primary-color);
            color: var,--white);
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
            background: #f8f9fa;
            color: #2D3748;
            border-radius: 50%;
            margin-right: 15px;
            font-size: 1.5rem;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .social-link:hover {
            background: #e9ecef;
            color: #1a1a1a;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(45, 55, 72, 0.2);
        }

        /* Hero Image Profile Styles Enhancement */
        .hero-image {
            text-align: center;
            position: relative;
        }

        .profile-container {
            position: relative;
            width: 420px;
            height: 420px;
            margin: 0 auto;
        }

        /* Blue circular background - larger */
        .profile-container::before {
            content: '';
            position: absolute;
            top: -25px;
            right: -25px;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #5865F2, #4752C4);
            border-radius: 50%;
            z-index: 1;
        }

        .profile-image {
            position: relative;
            width: 370px;
            height: 370px;
            object-fit: cover;
            border-radius: 50%;
            border: 5px solid var(--white);
            box-shadow: 0 25px 50px rgba(88, 101, 242, 0.2);
            z-index: 2;
            margin: 25px;
        }

        .profile-placeholder {
            position: absolute;
            top: 25px;
            left: 25px;
            width: 370px;
            height: 370px;
            background: linear-gradient(135deg, var(--light-blue), #F0F7FF);
            border-radius: 50%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
            font-size: 1.3rem;
            display: none;
            border: 5px solid var(--white);
            z-index: 2;
        }

        .profile-placeholder i {
            font-size: 5rem;
            margin-bottom: 1rem;
        }

        /* About Section */
        .about-section {
            background: var(--section-bg);
        }

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
        .skills-section {
            background: var(--white);
        }

        .skills-subtitle {
            font-size: 2rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 2rem;
        }

        /* Projects Section */
        .projects-section {
            background: var(--section-bg);
        }

        /* Photography Section */
        .photography-section {
            background: var(--white);
        }

        /* Contact Section */
        .contact-section {
            background: var(--section-bg);
        }

        .section-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: var,--text-dark);
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

        /* About Image Styles */
        .about-image {
            text-align: center;
            position: relative;
        }

        .about-img {
            width: 100%;
            max-width: 400px;
            height: auto;
            border-radius: 16px;
            box-shadow: 0 20px 40px rgba(88, 101, 242, 0.15);
            border: 4px solid var(--white);
            transition: all 0.3s ease;
        }

        .about-img:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 50px rgba(88, 101, 242, 0.2);
        }

        .about-img-placeholder {
            width: 100%;
            max-width: 400px;
            height: 300px;
            background: linear-gradient(135deg, var(--light-blue), #F0F7FF);
            border-radius: 16px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
            font-size: 1.2rem;
            display: none;
            border: 4px solid var(--white);
            box-shadow: 0 20px 40px rgba(88, 101, 242, 0.15);
            margin: 0 auto;
        }

        .about-img-placeholder i {
            font-size: 4rem;
            margin-bottom: 1rem;
        }

        /* Contact Information Section */
        .contact-info-container {
            padding: 1.5rem 2rem;
            background: var(--white);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(88, 101, 242, 0.08);
            margin-bottom: 2rem;
            height: fit-content;
        }

        .contact-info-title {
            font-size: 1.6rem;
            font-weight: 500;
            color: var(--text-light);
            margin-bottom: 2rem;
        }

        .contact-info-title strong {
            color: var(--text-dark);
            font-weight: 700;
        }

        .contact-info-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 1.5rem;
            padding: 0.5rem 0;
        }

        .contact-info-item:last-child {
            margin-bottom: 0;
        }

        .contact-info-icon {
            width: 45px;
            height: 45px;
            background: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1.2rem;
            flex-shrink: 0;
        }

        .contact-info-icon i {
            font-size: 1.1rem;
            color: var(--white);
        }

        .contact-info-content {
            flex: 1;
        }

        .contact-info-content h4 {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.3rem;
        }

        .contact-info-content p {
            font-size: 0.95rem;
            color: var,--text-light);
            line-height: 1.4;
            margin-bottom: 0.2rem;
        }

        /* Contact Form Section */
        .contact-form-container {
            background: var(--white);
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(88, 101, 242, 0.08);
        }

        .contact-form-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-control {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid var(--border-color);
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: var(--white);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(88, 101, 242, 0.1);
        }

        .form-control::placeholder {
            color: #94a3b8;
            font-weight: 400;
        }

        .btn-contact {
            background: var(--primary-color);
            color: var,--white);
            border: none;
            padding: 15px 40px;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-contact:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(88, 101, 242, 0.3);
        }

        /* Contact Form Alert Messages */
        .alert {
            padding: 1rem 1.5rem;
            margin-top: 1rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .alert-success {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
        }

        .alert-danger {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
        }

        .alert-warning {
            background-color: #fff3cd;
            border: 1px solid #ffeaa7;
            color: #856404;
        }

        .btn-contact:disabled {
            background: #6c757d;
            cursor: not-allowed;
            transform: none;
        }

        /* Form Validation States */
        .form-control:invalid {
            border-color: #dc3545;
        }

        .form-control:valid {
            border-color: #28a745;
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

        /* Projects Grid - Consistent Sizing */
        .projects-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
        }

        .project-card {
            background: var(--white);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(88, 101, 242, 0.08);
            transition: all 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .project-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(88, 101, 242, 0.15);
        }

        .project-image {
            position: relative;
            overflow: hidden;
            height: 220px;
            flex-shrink: 0;
        }

        .project-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .project-card:hover .project-image img {
            transform: scale(1.05);
        }

        .project-placeholder {
            width: 100%;
            height: 220px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: var(--white);
            font-size: 1.1rem;
        }

        .project-placeholder i {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .project-content {
            padding: 1.5rem;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .project-content h3 {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 1rem;
            line-height: 1.3;
        }

        .project-content p {
            font-size: 0.95rem;
            line-height: 1.6;
            color: var(--text-light);
            margin-bottom: 1.5rem;
            flex-grow: 1;
        }

        .project-links {
            margin-top: auto;
        }

        .project-links a {
            display: inline-block;
            padding: 8px 16px;
            background: var(--primary-color);
            color: var(--white);
            text-decoration: none;
            border-radius: 6px;
            font-size: 0.9rem;
            font-weight: 500;
            margin-right: 10px;
            margin-bottom: 5px;
            transition: all 0.3s ease;
        }

        .project-links a:hover {
            background: var(--secondary-color);
            color: var,--white);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(88, 101, 242, 0.3);
        }

        /* Skills Section - Progress Bar Layout */
        .skills-container {
            background: var(--white);
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(88, 101, 242, 0.08);
        }

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

        .skill-progress-item.float-in {
            opacity: 1;
            transform: translateY(0) scale(1);
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
            height: 8px;
            background: #f0f0f0;
            border-radius: 20px;
            overflow: hidden;
            position: relative;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .skill-progress-fill {
            height: 100%;
            border-radius: 20px;
            width: 0%;
            transition: width 2s ease-in-out;
            position: relative;
            overflow: hidden;
        }

        /* Skill Progress Colors */
        .skill-progress-fill.programming {
            background: linear-gradient(90deg, #4285F4, #6FA8F7);
        }

        .skill-progress-percentage.programming {
            color: #4285F4;
        }

        .skill-progress-fill.web-development {
            background: linear-gradient(90deg, #FF6B35, #FF8C69);
        }

        .skill-progress-percentage.web-development {
            color: #FF6B35;
        }

        .skill-progress-fill.design {
            background: linear-gradient(90deg, #9C27B0, #BA68C8);
        }

        .skill-progress-percentage.design {
            color: #9C27B0;
        }

        .skill-progress-fill.tools {
            background: linear-gradient(90deg, #00BCD4, #4DD0E1);
        }

        .skill-progress-percentage.tools {
            color: #00BCD4;
        }

        .skill-progress-fill.database {
            background: linear-gradient(90deg, #4CAF50, #81C784);
        }

        .skill-progress-percentage.database {
            color: #4CAF50;
        }

        .skill-progress-fill.marketing {
            background: linear-gradient(90deg, #FF9800, #FFB74D);
        }

        .skill-progress-percentage.marketing {
            color: #FF9800;
        }

        .skill-progress-fill.cms {
            background: linear-gradient(90deg, #607D8B, #90A4AE);
        }

        .skill-progress-percentage.cms {
            color: #607D8B;
        }

        .skill-progress-fill.default {
            background: linear-gradient(90deg, #667eea, #764ba2);
        }

        .skill-progress-percentage.default {
            color: #667eea;
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
                width: 320px;
                height: 320px;
            }

            .profile-container::before {
                top: -20px;
                right: -20px;
            }

            .profile-image {
                width: 270px;
                height: 270px;
                margin: 25px;
            }

            .profile-placeholder {
                top: 25px;
                left: 25px;
                width: 270px;
                height: 270px;
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

            .project-image img {
                height: 200px;
            }

            .project-placeholder {
                height: 200px;
            }

            .photography-container {
                grid-template-columns: 1fr;
            }

            .contact-info-container {
                padding: 1rem 0 2rem;
                text-align: center;
                margin-bottom: 1.5rem;
            }

            .contact-info-title {
                font-size: 1.4rem;
                margin-bottom: 1.5rem;
            }

            .contact-info-item {
                justify-content: center;
                text-align: center;
                margin-bottom: 1.2rem;
                padding: 0.3rem 0;
            }

            .contact-info-icon {
                margin-right: 0.8rem;
                width: 40px;
                height: 40px;
            }

            .contact-form-container {
                padding: 2rem 1.5rem;
            }

            .contact-form-title {
                font-size: 1.5rem;
                text-align: center;
            }

            .skills-progress-grid {
                grid-template-columns: 1fr;
                gap: 2rem;
            }

            .project-card {
                margin-bottom: 1.5rem;
            }

            .project-image {
                height: 180px;
            }

            .project-placeholder {
                height: 180px;
            }

            .about-img {
                max-width: 300px;
                margin-bottom: 2rem;
            }

            .about-img-placeholder {
                max-width: 300px;
                height: 250px;
                margin-bottom: 2rem;
            }
        }
    </style>
</asp:Content>
