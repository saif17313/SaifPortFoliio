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
    
    // Try to get data from server-side if available
    try {
        // This will be populated by server-side code
        if (typeof serverData !== 'undefined') {
            window.portfolioProjects = serverData.projects || [];
            window.portfolioSkills = serverData.skills || [];
            window.portfolioRoles = serverData.roles || [];
            window.portfolioPhotography = serverData.photography || [];
            console.log('? Server data loaded from database');
        } else {
            console.log('? No server data available from database');
            // Set empty arrays - no hardcoded fallback data
            window.portfolioProjects = [];
            window.portfolioSkills = [];
            window.portfolioRoles = ['Software Developer', 'Graphics Designer', 'Problem Solver']; // Keep basic roles
            window.portfolioPhotography = [];
        }
    } catch (e) {
        console.log('? Error loading server data:', e);
        // Set empty arrays on error
        window.portfolioProjects = [];
        window.portfolioSkills = [];
        window.portfolioRoles = ['Software Developer', 'Graphics Designer', 'Problem Solver'];
        window.portfolioPhotography = [];
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

    // Check if server data is available from database
    if (typeof window.serverData !== 'undefined' && window.serverData.skills) {
        console.log('? Server data found from database:', window.serverData);
        window.portfolioSkills = window.serverData.skills;
    } else {
        console.log('? No server data found from database');
        skillsList.innerHTML = '<div class="loading-state"><i class="fas fa-exclamation-triangle"></i><p>Unable to load skills from database. Please check database connection.</p></div>';
        return;
    }

    var skills = window.portfolioSkills || [];
    console.log('?? Skills to display from database:', skills.length, skills);
    
    if (skills.length === 0) {
        console.log('? No skills found in database');
        skillsList.innerHTML = '<div class="loading-state"><i class="fas fa-info-circle"></i><p>No skills found in database.</p></div>';
        return;
    }
    
    console.log('?? Generating skills HTML from database...');
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
    console.log('? Skills HTML generated and inserted from database');
    
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

    // Initialize scroll spy for navigation
    initializeScrollSpy();
});

// Scroll spy functionality to highlight active navigation section
function initializeScrollSpy() {
    console.log('?? Initializing scroll spy for navigation...');
    
    // Get all navigation links that point to sections
    var navLinks = document.querySelectorAll('.nav-link[href^="#"]:not(.admin-link)');
    var sections = [];
    
    // Get corresponding sections
    navLinks.forEach(function(link) {
        var targetId = link.getAttribute('href');
        var section = document.querySelector(targetId);
        if (section) {
            sections.push({
                id: targetId,
                element: section,
                link: link
            });
        }
    });

    if (sections.length === 0) {
        console.log('? No sections found for scroll spy');
        return;
    }

    console.log('? Found', sections.length, 'sections for scroll spy');

    // Scroll event listener with throttling
    var isScrolling = false;
    
    function handleScroll() {
        if (!isScrolling) {
            requestAnimationFrame(function() {
                updateActiveNavigation();
                isScrolling = false;
            });
            isScrolling = true;
        }
    }

    function updateActiveNavigation() {
        var scrollPosition = window.pageYOffset + 100; // Offset for navbar height
        var currentSection = null;

        // Find the current section
        for (var i = 0; i < sections.length; i++) {
            var section = sections[i];
            var sectionTop = section.element.offsetTop;
            var sectionBottom = sectionTop + section.element.offsetHeight;

            if (scrollPosition >= sectionTop && scrollPosition < sectionBottom) {
                currentSection = section;
                break;
            }
        }

        // If no section is found, check if we're at the top (hero section)
        if (!currentSection && scrollPosition < 200) {
            currentSection = sections.find(s => s.id === '#hero');
        }

        // Update active navigation - ENSURE ONLY ONE ACTIVE AT A TIME
        if (currentSection) {
            // First, remove active class from ALL nav links (including any duplicates)
            document.querySelectorAll('.nav-link').forEach(function(link) {
                link.classList.remove('active');
            });

            // Then add active class ONLY to the current section's nav link
            if (currentSection.link) {
                currentSection.link.classList.add('active');
                console.log('?? Active section:', currentSection.id);
            }
        }
    }

    // Add scroll event listener
    window.addEventListener('scroll', handleScroll, { passive: true });

    // Initial setup - remove all active classes first
    document.querySelectorAll('.nav-link').forEach(function(link) {
        link.classList.remove('active');
    });

    // Initial check
    setTimeout(function() {
        updateActiveNavigation();
    }, 1000);

    console.log('? Scroll spy initialized successfully');
}

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

// Force load skills from database only
function forceLoadSkills() {
    console.log('?? Force loading skills from database...');
    
    // Only load if server data is available
    if (typeof window.serverData !== 'undefined' && window.serverData.skills) {
        window.portfolioSkills = window.serverData.skills;
        console.log('? Skills data loaded from database, calling loadSkillsSection...');
        loadSkillsSection();
    } else {
        console.log('? No database skills available for force load');
        var skillsList = document.getElementById('skills-progress-list');
        if (skillsList) {
            skillsList.innerHTML = '<div class="loading-state"><i class="fas fa-database"></i><p>Skills will load when database connection is established.</p></div>';
        }
    }
}

console.log('Master page scripts initialized');