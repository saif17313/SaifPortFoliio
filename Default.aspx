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

    <!-- About Section -->
    <section id="about" class="about-section section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center mb-5">
                    <h2 class="section-title">About Me</h2>
                    <p class="section-subtitle">Get to know more about my journey and expertise</p>
                </div>
            </div>
            
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <div class="about-content">
                        <h3 class="about-title">Hi, I'm Abdullah Al Saif</h3>
                        <p class="about-text">
                            I'm a passionate Software Developer and Graphics Designer with a strong foundation in 
                            problem-solving and creative thinking. My journey in technology started with a curiosity 
                            about how digital solutions can transform ideas into reality.
                        </p>
                        <p class="about-text">
                            With expertise in multiple programming languages including C, C++, and Java, I enjoy 
                            building efficient and scalable applications. My design skills complement my technical 
                            abilities, allowing me to create user-centered solutions that are both functional and visually appealing.
                        </p>
                        
                        <div class="about-highlights">
                            <div class="highlight-item">
                                <i class="fas fa-code"></i>
                                <div>
                                    <h4>Clean Code</h4>
                                    <p>Writing maintainable and efficient code</p>
                                </div>
                            </div>
                            <div class="highlight-item">
                                <i class="fas fa-palette"></i>
                                <div>
                                    <h4>Creative Design</h4>
                                    <p>Crafting visually stunning user interfaces</p>
                                </div>
                            </div>
                            <div class="highlight-item">
                                <i class="fas fa-lightbulb"></i>
                                <div>
                                    <h4>Problem Solving</h4>
                                    <p>Finding innovative solutions to complex challenges</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="about-buttons">
                            <a href="#contact" class="btn btn-primary-custom">
                                <i class="fas fa-envelope"></i> Get In Touch
                            </a>
                            <a href="/Content/resume/Abdullah_Al_Saif_Resume.pdf" target="_blank" class="btn btn-outline-primary">
                                <i class="fas fa-download"></i> Download Resume
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <div class="about-image">
                        <div class="image-container">
                            <img src="/Content/img/profile/profile-photo.jpg" alt="Abdullah Al Saif" class="profile-img">
                            <div class="image-overlay">
                                <div class="overlay-content">
                                    <h4>Let's Create Something Amazing Together!</h4>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Stats Cards -->
                        <div class="stats-container">
                            <div class="stat-card">
                                <div class="stat-number">3+</div>
                                <div class="stat-label">Programming Languages</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-number">10+</div>
                                <div class="stat-label">Projects Completed</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-number">2+</div>
                                <div class="stat-label">Years Experience</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Skills Preview Section -->
    <section id="skills" class="skills-preview-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center mb-5">
                    <h2 class="section-title">My Skills</h2>
                    <p class="section-subtitle">Technologies and tools I work with</p>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="skills-grid">
                        <div class="skill-item">
                            <div class="skill-icon">
                                <i class="fab fa-java"></i>
                            </div>
                            <h4>Java</h4>
                            <div class="skill-progress">
                                <div class="progress-bar" data-width="95"></div>
                            </div>
                            <span class="skill-percentage">95%</span>
                        </div>
                        
                        <div class="skill-item">
                            <div class="skill-icon">
                                <i class="fab fa-cuttlefish"></i>
                            </div>
                            <h4>C++</h4>
                            <div class="skill-progress">
                                <div class="progress-bar" data-width="100"></div>
                            </div>
                            <span class="skill-percentage">100%</span>
                        </div>
                        
                        <div class="skill-item">
                            <div class="skill-icon">
                                <i class="fas fa-code"></i>
                            </div>
                            <h4>C</h4>
                            <div class="skill-progress">
                                <div class="progress-bar" data-width="100"></div>
                            </div>
                            <span class="skill-percentage">100%</span>
                        </div>
                        
                        <div class="skill-item">
                            <div class="skill-icon">
                                <i class="fab fa-html5"></i>
                            </div>
                            <h4>HTML/CSS</h4>
                            <div class="skill-progress">
                                <div class="progress-bar" data-width="90"></div>
                            </div>
                            <span class="skill-percentage">90%</span>
                        </div>
                        
                        <div class="skill-item">
                            <div class="skill-icon">
                                <i class="fab fa-js-square"></i>
                            </div>
                            <h4>JavaScript</h4>
                            <div class="skill-progress">
                                <div class="progress-bar" data-width="85"></div>
                            </div>
                            <span class="skill-percentage">85%</span>
                        </div>
                        
                        <div class="skill-item">
                            <div class="skill-icon">
                                <i class="fas fa-paint-brush"></i>
                            </div>
                            <h4>Graphics Design</h4>
                            <div class="skill-progress">
                                <div class="progress-bar" data-width="88"></div>
                            </div>
                            <span class="skill-percentage">88%</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Projects Section -->
    <section id="projects" class="projects-section section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center mb-5">
                    <h2 class="section-title">My Projects</h2>
                    <p class="section-subtitle">A showcase of my recent work and accomplishments</p>
                </div>
            </div>
            
            <!-- Project Filter Buttons -->
            <div class="row mb-5">
                <div class="col-lg-12 text-center">
                    <div class="project-filters">
                        <button class="filter-btn active" data-filter="all">All Projects</button>
                        <button class="filter-btn" data-filter="development">Development</button>
                        <button class="filter-btn" data-filter="design">Design</button>
                        <button class="filter-btn" data-filter="mobile">Mobile</button>
                    </div>
                </div>
            </div>
            
            <!-- Projects Grid -->
            <div class="row" id="projects-grid">
                <!-- Projects will be dynamically loaded here -->
                <div class="col-12 text-center">
                    <div class="projects-loading">
                        <i class="fas fa-spinner fa-spin fa-2x"></i>
                        <p>Loading projects...</p>
                    </div>
                </div>
            </div>
            
            <!-- View More Button -->
            <div class="row mt-5">
                <div class="col-lg-12 text-center">
                    <a href="https://github.com/saif17313" target="_blank" class="btn btn-outline-primary btn-lg">
                        <i class="fab fa-github"></i> View More on GitHub
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Photography Gallery Section -->
    <section id="photography" class="photography-section section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center mb-5">
                    <h2 class="section-title">Photography & Creative Work</h2>
                    <p class="section-subtitle">Capturing moments and expressing creativity through visual storytelling</p>
                </div>
            </div>
            
            <!-- Gallery Categories -->
            <div class="row mb-5">
                <div class="col-lg-12 text-center">
                    <div class="gallery-filters">
                        <button class="gallery-filter-btn active" data-category="all">All Photos</button>
                        <button class="gallery-filter-btn" data-category="portraits">Portraits</button>
                        <button class="gallery-filter-btn" data-category="nature">Nature</button>
                        <button class="gallery-filter-btn" data-category="urban">Urban</button>
                        <button class="gallery-filter-btn" data-category="events">Events</button>
                    </div>
                </div>
            </div>
            
            <!-- Photography Grid -->
            <div class="row" id="photography-grid">
                <!-- Photos will be dynamically loaded here -->
                <div class="col-12 text-center">
                    <div class="gallery-loading">
                        <i class="fas fa-camera fa-2x"></i>
                        <p>Loading gallery...</p>
                    </div>
                </div>
            </div>
            
            <!-- View More Photography -->
            <div class="row mt-5">
                <div class="col-lg-12 text-center">
                    <a href="#" class="btn btn-outline-primary btn-lg" id="load-more-photos">
                        <i class="fas fa-images"></i> Load More Photos
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Photography Modal -->
    <div class="modal fade" id="photoModal" tabindex="-1" aria-labelledby="photoModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content bg-dark">
                <div class="modal-header border-0">
                    <h5 class="modal-title text-white" id="photoModalLabel">Photo Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <img id="modalImage" src="" alt="" class="img-fluid rounded">
                    <div class="photo-details mt-3">
                        <h6 id="modalPhotoTitle" class="text-white"></h6>
                        <p id="modalPhotoDescription" class="text-light"></p>
                        <div class="photo-meta">
                            <span id="modalPhotoCategory" class="badge bg-primary me-2"></span>
                            <span id="modalPhotoDate" class="text-muted"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-0 justify-content-center">
                    <button type="button" class="btn btn-outline-light" id="prevPhoto">
                        <i class="fas fa-chevron-left"></i> Previous
                    </button>
                    <button type="button" class="btn btn-outline-light" id="nextPhoto">
                        Next <i class="fas fa-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Preview Section -->
    <section id="contact" class="contact-preview-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center mb-5">
                    <h2 class="section-title">Let's Work Together</h2>
                    <p class="section-subtitle">Ready to start your next project? Let's discuss how I can help.</p>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="contact-info">
                        <div class="row">
                            <div class="col-md-4 mb-4">
                                <div class="contact-item">
                                    <div class="contact-icon">
                                        <i class="fas fa-envelope"></i>
                                    </div>
                                    <h4>Email</h4>
                                    <p>abdullah.saif@example.com</p>
                                    <a href="mailto:abdullah.saif@example.com" class="contact-link">Send Message</a>
                                </div>
                            </div>
                            <div class="col-md-4 mb-4">
                                <div class="contact-item">
                                    <div class="contact-icon">
                                        <i class="fab fa-linkedin"></i>
                                    </div>
                                    <h4>LinkedIn</h4>
                                    <p>Professional Network</p>
                                    <a href="https://linkedin.com/in/abdullah-al-saif" target="_blank" class="contact-link">Connect</a>
                                </div>
                            </div>
                            <div class="col-md-4 mb-4">
                                <div class="contact-item">
                                    <div class="contact-icon">
                                        <i class="fab fa-github"></i>
                                    </div>
                                    <h4>GitHub</h4>
                                    <p>Code Repository</p>
                                    <a href="https://github.com/saif17313" target="_blank" class="contact-link">View Projects</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/hero.css" rel="stylesheet" />
    <link href="~/Content/css/about.css" rel="stylesheet" />
    <link href="~/Content/css/projects.css" rel="stylesheet" />
    <link href="~/Content/css/photography.css" rel="stylesheet" />
</asp:Content>
