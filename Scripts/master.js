// Master page JavaScript functionality
console.log('Master page loaded');

// Global portfolio data
window.portfolioProjects = [];
window.portfolioSkills = [];
window.portfolioRoles = ['Software Developer', 'Graphics Designer', 'Problem Solver'];
window.portfolioPhotography = [];

// Force hide loading screen after 2 seconds
setTimeout(function () {
    var loadingScreen = document.getElementById('loading-screen');
    var navigation = document.getElementById('main-nav');

    if (loadingScreen) {
        loadingScreen.style.display = 'none';
        if (navigation) {
            navigation.style.display = 'block';
        }
        initializeDynamicContent();
    }
}, 2000);

function initializeDynamicContent() {
    console.log('Initializing content');
    loadPortfolioData();
    
    // Add a backup timer to ensure skills load
    setTimeout(function() {
        console.log('?? Backup skills loading...');
        var skillsList = document.getElementById('skills-progress-list');
        if (skillsList && skillsList.innerHTML.includes('Loading skills...')) {
            console.log('?? Skills still loading, forcing load...');
            forceLoadSkills();
        }
    }, 3000);
    
    // Also add immediate database test
    setTimeout(function() {
        testDatabaseConnection();
    }, 1000);
}

function loadPortfolioData() {
    // Load actual data from database via AJAX or server-side rendering
    // For now using sample data - you can replace this with AJAX calls
    
    // Try to get data from server-side if available
    try {
        // This will be populated by server-side code
        if (typeof serverData !== 'undefined') {
            window.portfolioProjects = serverData.projects || [];
            window.portfolioSkills = serverData.skills || [];
            window.portfolioRoles = serverData.roles || [];
            window.portfolioPhotography = serverData.photography || [];
        } else {
            // Fallback sample data
            window.portfolioProjects = [
                {
                    title: "Portfolio Website",
                    description: "A responsive portfolio website built with ASP.NET and Bootstrap showcasing my projects and skills.",
                    image: "/Content/img/projects/portfolio.jpg",
                    liveUrl: "https://github.com/saif17313/SaifPortFoliio",
                    repoUrl: "https://github.com/saif17313/SaifPortFoliio"
                },
                {
                    title: "E-Commerce Platform",
                    description: "A full-featured e-commerce platform with shopping cart, payment integration, and admin panel.",
                    image: "/Content/img/projects/ecommerce.jpg",
                    liveUrl: "https://demo-shop.com",
                    repoUrl: "https://github.com/saif17313/ecommerce-platform"
                },
                {
                    title: "Task Management App",
                    description: "A collaborative task management application with real-time updates and team collaboration features.",
                    image: "/Content/img/projects/taskapp.jpg",
                    liveUrl: "https://task-manager-demo.com",
                    repoUrl: "https://github.com/saif17313/task-manager"
                }
            ];

            window.portfolioSkills = [
                { name: "Java", level: 95, icon: "fab fa-java" },
                { name: "C++", level: 100, icon: "fas fa-code" },
                { name: "C", level: 100, icon: "fas fa-code" },
                { name: "JavaScript", level: 85, icon: "fab fa-js-square" },
                { name: "HTML/CSS", level: 90, icon: "fab fa-html5" },
                { name: "ASP.NET", level: 80, icon: "fas fa-window-maximize" },
                { name: "Graphics Design", level: 88, icon: "fas fa-paint-brush" },
                { name: "Photoshop", level: 85, icon: "fab fa-adobe" }
            ];

            window.portfolioRoles = [
                "Full Stack Developer",
                "Software Engineer", 
                "Graphics Designer",
                "Problem Solver",
                "Web Developer",
                "UI/UX Designer"
            ];

            window.portfolioPhotography = [
                {
                    title: "Sunset Landscape",
                    description: "A breathtaking sunset captured during the golden hour with stunning color gradients.",
                    imagePath: "/Content/img/photography/sunset.jpg"
                },
                {
                    title: "Urban Architecture", 
                    description: "Modern architectural photography showcasing the beauty of urban design and structures.",
                    imagePath: "/Content/img/photography/architecture.jpg"
                },
                {
                    title: "Nature Portrait",
                    description: "A serene nature scene capturing the tranquility and beauty of the natural world.",
                    imagePath: "/Content/img/photography/nature.jpg"
                },
                {
                    title: "Street Photography",
                    description: "Candid moments from everyday life captured through the lens of street photography.", 
                    imagePath: "/Content/img/photography/street.jpg"
                }
            ];
        }
    } catch (e) {
        console.log('Error loading server data, using fallback data');
    }

    setTimeout(function() { startTypewriter(); }, 500);
    setTimeout(function() { loadSkillsSection(); }, 1000);
    setTimeout(function() { loadProjectsSection(); }, 1500);
    setTimeout(function() { loadPhotographySection(); }, 2000);
}

function startTypewriter() {
    var typewriterElement = document.getElementById('typewriter');
    if (!typewriterElement) return;

    var roles = window.portfolioRoles;
    var currentRole = 0;
    var currentChar = 0;
    var isDeleting = false;

    function type() {
        var text = roles[currentRole];

        if (isDeleting) {
            typewriterElement.textContent = text.substring(0, currentChar - 1);
            currentChar--;
            if (currentChar === 0) {
                isDeleting = false;
                currentRole = (currentRole + 1) % roles.length;
                setTimeout(type, 800);
                return;
            }
            setTimeout(type, 80);
        } else {
            typewriterElement.textContent = text.substring(0, currentChar + 1);
            currentChar++;
            if (currentChar === text.length) {
                isDeleting = true;
                setTimeout(type, 2500);
                return;
            }
            setTimeout(type, 120);
        }
    }

    setTimeout(type, 1000);
}

function loadSkillsSection() {
    console.log('?? Loading skills section...');
    
    var skillsList = document.getElementById('skills-progress-list');
    if (!skillsList) {
        console.log('? Skills progress list element not found');
        return;
    }

    console.log('? Skills progress list element found');

    // Check if server data is available
    if (typeof window.serverData !== 'undefined') {
        console.log('? Server data found:', window.serverData);
        window.portfolioSkills = window.serverData.skills || [];
    } else {
        console.log('?? No server data found, using fallback skills');
        // Enhanced fallback skills with your database data
        window.portfolioSkills = [
            { name: "C", level: 100, category: "Programming", colorClass: "programming" },
            { name: "C++", level: 100, category: "Programming", colorClass: "programming" },
            { name: "Java", level: 95, category: "Programming", colorClass: "programming" },
            { name: "JavaScript", level: 85, category: "Programming", colorClass: "programming" },
            { name: "Python", level: 80, category: "Programming", colorClass: "programming" },
            { name: "HTML5", level: 85, category: "Web Development", colorClass: "web-development" },
            { name: "CSS3", level: 90, category: "Web Development", colorClass: "web-development" },
            { name: "jQuery", level: 60, category: "Web Development", colorClass: "web-development" },
            { name: "ASP.NET", level: 80, category: "Web Development", colorClass: "web-development" },
            { name: "Bootstrap", level: 75, category: "Web Development", colorClass: "web-development" },
            { name: "Photoshop", level: 75, category: "Design", colorClass: "design" },
            { name: "WordPress", level: 70, category: "CMS", colorClass: "web-development" },
            { name: "SEO", level: 80, category: "Marketing", colorClass: "design" },
            { name: "Git", level: 85, category: "Tools", colorClass: "soft-skills" },
            { name: "Database Design", level: 88, category: "Database", colorClass: "programming" }
        ];
    }

    var skills = window.portfolioSkills || [];
    console.log('?? Skills to display:', skills.length, skills);
    
    if (skills.length === 0) {
        console.log('? No skills found');
        skillsList.innerHTML = '<div class="loading-state"><i class="fas fa-info-circle"></i><p>No skills found in database.</p></div>';
        return;
    }
    
    console.log('?? Generating skills HTML...');
    var html = '';
    for (var i = 0; i < skills.length; i++) {
        var skill = skills[i];
        html += '<div class="skill-progress-item" style="animation-delay: ' + (i * 0.1) + 's">';
        html += '<div class="skill-progress-name">';
        html += skill.name;
        html += '<span class="skill-progress-percentage ' + (skill.colorClass || 'default') + '">' + skill.level + '%</span>';
        html += '</div>';
        html += '<div class="skill-progress-bar">';
        html += '<div class="skill-progress-fill ' + (skill.colorClass || 'default') + '" data-percentage="' + skill.level + '"></div>';
        html += '</div>';
        html += '</div>';
    }
    
    skillsList.innerHTML = html;
    console.log('? Skills HTML generated and inserted');
    
    // Animate progress bars after DOM is updated
    setTimeout(function() {
        console.log('?? Starting skill animations...');
        animateSkillBars();
    }, 100);
}

function animateSkillBars() {
    var skillItems = document.querySelectorAll('.skill-progress-item');
    var progressBars = document.querySelectorAll('.skill-progress-fill');
    
    console.log('Animating', skillItems.length, 'skill items');
    
    // Add floating animation to skill items
    skillItems.forEach(function(item, index) {
        setTimeout(function() {
            item.classList.add('float-in');
        }, index * 150);
    });
    
    // Animate progress bars
    progressBars.forEach(function(bar, index) {
        var percentage = bar.getAttribute('data-percentage');
        setTimeout(function() {
            bar.style.width = percentage + '%';
        }, index * 200 + 500); // Start after float animation
    });
}

function loadProjectsSection() {
    var projectsContainer = document.getElementById('projects-container');
    if (!projectsContainer) return;

    var projects = window.portfolioProjects;
    var html = '';

    for (var i = 0; i < projects.length; i++) {
        var project = projects[i];
        html += '<div class="project-item">';
        html += '<div class="project-content">';
        html += '<h3>' + project.title + '</h3>';
        html += '<p>' + project.description + '</p>';
        html += '<div class="project-links">';
        if (project.liveUrl) {
            html += '<a href="' + project.liveUrl + '" target="_blank">Live Demo</a>';
        }
        if (project.repoUrl) {
            html += '<a href="' + project.repoUrl + '" target="_blank">View Code</a>';
        }
        html += '</div></div>';
        html += '<div class="project-image">';
        html += '<img src="' + project.image + '" alt="' + project.title + '" onerror="this.style.display=\'none\'; this.nextElementSibling.style.display=\'flex\';" />';
        html += '<div class="project-placeholder"><i class="fas fa-laptop-code"></i><span>Project Image</span></div>';
        html += '</div></div>';
    }

    projectsContainer.innerHTML = html || '<div class="loading-state"><i class="fas fa-info-circle"></i><p>No projects found.</p></div>';
}

function loadPhotographySection() {
    var photographyContainer = document.getElementById('photography-container');
    if (!photographyContainer) return;

    var photos = window.portfolioPhotography;
    var html = '';

    for (var i = 0; i < photos.length; i++) {
        var photo = photos[i];
        html += '<div class="photo-item" onclick="openPhotoModal(\'' + photo.imagePath + '\', \'' + photo.title + '\', \'' + photo.description + '\')">';
        html += '<img src="' + photo.imagePath + '" alt="' + photo.title + '" onerror="this.style.display=\'none\'; this.nextElementSibling.style.display=\'flex\';" />';
        html += '<div class="photo-placeholder"><i class="fas fa-camera"></i><span>Photo</span></div>';
        html += '<div class="photo-overlay"><h4>' + photo.title + '</h4></div>';
        html += '</div>';
    }

    photographyContainer.innerHTML = html || '<div class="loading-state"><i class="fas fa-camera"></i><p>No photos found.</p></div>';
}

function openPhotoModal(imagePath, title, description) {
    var modal = document.getElementById('photoModal');
    if (modal && typeof bootstrap !== 'undefined') {
        document.getElementById('modalImage').src = imagePath;
        document.getElementById('photoModalTitle').textContent = title;
        document.getElementById('modalDescription').textContent = description;
        
        var modalInstance = new bootstrap.Modal(modal);
        modalInstance.show();
    }
}

// Initialize contact form and navigation when DOM is ready
document.addEventListener('DOMContentLoaded', function() {
    // Contact form handling
    var contactForm = document.getElementById('contactForm');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            alert('Thank you for your message! I will get back to you soon.');
            contactForm.reset();
        });
    }

    // Smooth scrolling for navigation
    var navLinks = document.querySelectorAll('.nav-link[href^="#"]');
    for (var i = 0; i < navLinks.length; i++) {
        navLinks[i].addEventListener('click', function(e) {
            e.preventDefault();
            var targetId = this.getAttribute('href');
            var targetElement = document.querySelector(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    }
});

// Add this function after loadSkillsSection
function testDatabaseConnection() {
    console.log('?? Testing database connection...');
    
    // Make an AJAX call to test database connectivity
    fetch('/TestData.aspx')
        .then(response => {
            console.log('?? Database response:', response.status);
            return response.text();
        })
        .then(data => {
            console.log('?? Database test completed');
        })
        .catch(error => {
            console.error('? Database connection error:', error);
        });
}

// Force load skills regardless of server data
function forceLoadSkills() {
    console.log('?? Force loading skills...');
    
    // Directly set fallback skills
    window.portfolioSkills = [
        { name: "C", level: 100, category: "Programming", colorClass: "programming" },
        { name: "C++", level: 100, category: "Programming", colorClass: "programming" },
        { name: "Java", level: 95, category: "Programming", colorClass: "programming" },
        { name: "JavaScript", level: 85, category: "Programming", colorClass: "programming" },
        { name: "Python", level: 80, category: "Programming", colorClass: "programming" },
        { name: "HTML5", level: 85, category: "Web Development", colorClass: "web-development" },
        { name: "CSS3", level: 90, category: "Web Development", colorClass: "web-development" },
        { name: "jQuery", level: 60, category: "Web Development", colorClass: "web-development" },
        { name: "ASP.NET", level: 80, category: "Web Development", colorClass: "web-development" },
        { name: "Bootstrap", level: 75, category: "Web Development", colorClass: "web-development" },
        { name: "Photoshop", level: 75, category: "Design", colorClass: "design" },
        { name: "WordPress", level: 70, category: "CMS", colorClass: "web-development" },
        { name: "SEO", level: 80, category: "Marketing", colorClass: "design" },
        { name: "Git", level: 85, category: "Tools", colorClass: "soft-skills" },
        { name: "Database Design", level: 88, category: "Database", colorClass: "programming" }
    ];
    
    console.log('? Skills data set, calling loadSkillsSection...');
    loadSkillsSection();
}

console.log('Master page scripts initialized');console.log('Master page scripts initialized');