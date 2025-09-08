// =========================
// PORTFOLIO LOADING SCREEN AND FUNCTIONALITY
// =========================

console.log('Portfolio script loaded');

// Global variables
let portfolioApp = {
    loadingScreen: null,
    typewriter: null,
    isInitialized: false
};

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM Content Loaded - Portfolio.js');
    
    // Only initialize if not already done by master page
    if (!window.portfolioInitialized) {
        initializePortfolio();
    }
});

function initializePortfolio() {
    console.log('Initializing portfolio from portfolio.js...');
    
    // Mark as initialized to prevent conflicts
    window.portfolioInitialized = true;
    
    // Initialize loading screen
    initLoadingScreen();
    
    // Initialize other components after loading screen
    setTimeout(() => {
        initTypewriterEffect();
        initSmoothScrolling();
        initProjectsIfAvailable();
    }, 4000); // Wait for loading screen to finish
}

// =========================
// LOADING SCREEN
// =========================

function initLoadingScreen() {
    const loadingScreen = document.getElementById('loading-screen');
    
    if (loadingScreen) {
        console.log('Loading screen found - Portfolio.js');
        
        // Hide loading screen after 3 seconds
        setTimeout(function() {
            console.log('Hiding loading screen - Portfolio.js');
            loadingScreen.style.opacity = '0';
            loadingScreen.style.transition = 'opacity 0.5s ease-out';
            
            setTimeout(function() {
                loadingScreen.style.display = 'none';
                console.log('Loading screen hidden - Portfolio.js');
                
                // Show navigation
                showNavigation();
            }, 500);
        }, 3000);
    }
}

function showNavigation() {
    const navigation = document.getElementById('main-nav');
    if (navigation) {
        navigation.style.display = 'block';
        setTimeout(() => {
            navigation.classList.add('nav-visible');
        }, 100);
    }
}

// =========================
// TYPEWRITER EFFECT
// =========================

function initTypewriterEffect() {
    console.log('Initializing typewriter effect - Portfolio.js');
    
    const typewriterElement = document.getElementById('typewriter');
    
    if (!typewriterElement) {
        console.error('Typewriter element not found - Portfolio.js');
        return;
    }
    
    console.log('Typewriter element found - Portfolio.js');
    
    // Get roles from server-side data or use defaults
    const roles = window.portfolioRoles || ['Software Developer', 'Graphics Designer', 'Problem Solver'];
    console.log('Using roles:', roles);
    
    let currentRoleIndex = 0;
    let currentCharIndex = 0;
    let isDeleting = false;
    
    function typeText() {
        const currentRole = roles[currentRoleIndex];
        
        if (isDeleting) {
            // Deleting characters
            typewriterElement.textContent = currentRole.substring(0, currentCharIndex - 1);
            currentCharIndex--;
            
            if (currentCharIndex === 0) {
                isDeleting = false;
                currentRoleIndex = (currentRoleIndex + 1) % roles.length;
                setTimeout(typeText, 800); // Pause before next role
                return;
            }
            
            setTimeout(typeText, 80); // Slower deletion
        } else {
            // Typing characters
            typewriterElement.textContent = currentRole.substring(0, currentCharIndex + 1);
            currentCharIndex++;
            
            if (currentCharIndex === currentRole.length) {
                isDeleting = true;
                setTimeout(typeText, 2500); // Display complete text longer
                return;
            }
            
            // Variable typing speed for natural effect
            const typingSpeed = Math.random() * 100 + 80;
            setTimeout(typeText, typingSpeed);
        }
    }
    
    // Start typing after a brief delay
    setTimeout(() => {
        typeText();
        console.log('Typewriter effect started - Portfolio.js');
    }, 1000);
}

// =========================
// SMOOTH SCROLLING
// =========================

function initSmoothScrolling() {
    console.log('Initializing smooth scrolling - Portfolio.js');
    
    // Add smooth scrolling to anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            
            if (targetElement) {
                const offsetTop = targetElement.offsetTop - 80; // Account for fixed navbar
                window.scrollTo({
                    top: offsetTop,
                    behavior: 'smooth'
                });
            }
        });
    });
    
    console.log('Smooth scrolling initialized - Portfolio.js');
}

// =========================
// PROJECTS FUNCTIONALITY
// =========================

function initProjectsIfAvailable() {
    console.log('Checking for projects section - Portfolio.js');
    
    const projectsGrid = document.getElementById('projects-grid');
    if (projectsGrid && window.portfolioProjects) {
        console.log('Projects section found, initializing...');
        setTimeout(() => {
            loadProjectsData();
            initProjectFilters();
        }, 1000);
    }
}

function loadProjectsData() {
    const projectsGrid = document.getElementById('projects-grid');
    const projects = window.portfolioProjects || [];
    
    if (projects.length === 0) {
        projectsGrid.innerHTML = `
            <div class="col-12 text-center">
                <div class="projects-loading">
                    <i class="fas fa-info-circle fa-2x"></i>
                    <p>No projects available at the moment.</p>
                </div>
            </div>
        `;
        return;
    }
    
    let projectsHTML = '';
    
    projects.forEach((project, index) => {
        const category = getCategoryFromTech(project.technologies);
        const icon = getProjectIcon(category);
        const placeholderText = getPlaceholderText(category);
        
        projectsHTML += `
            <div class="col-lg-4 col-md-6 mb-4 project-item" data-category="${category}" data-all="true">
                <div class="project-card">
                    <div class="project-image">
                        <div class="project-image-placeholder ${category}">
                            <i class="${icon}"></i>
                            <span>${placeholderText}</span>
                        </div>
                        <div class="project-overlay">
                            <div class="project-links">
                                ${project.liveUrl ? `<a href="${project.liveUrl}" target="_blank" class="project-link" title="Live Demo"><i class="fas fa-external-link-alt"></i></a>` : ''}
                                ${project.repoUrl ? `<a href="${project.repoUrl}" target="_blank" class="project-link" title="Source Code"><i class="fab fa-github"></i></a>` : ''}
                                ${!project.liveUrl && !project.repoUrl ? `<div class="project-link" title="Coming Soon"><i class="fas fa-clock"></i></div>` : ''}
                            </div>
                        </div>
                    </div>
                    <div class="project-content">
                        <h3 class="project-title">${project.title}</h3>
                        <p class="project-description">${project.description}</p>
                        <div class="project-technologies">
                            ${project.technologies.map(tech => `<span class="tech-tag">${tech}</span>`).join('')}
                        </div>
                        <div class="project-meta">
                            <span class="project-date">Recent Project</span>
                            <span class="project-status status-completed">Completed</span>
                        </div>
                    </div>
                </div>
            </div>
        `;
    });
    
    projectsGrid.innerHTML = projectsHTML;
    console.log('Projects loaded successfully - Portfolio.js');
}

function getCategoryFromTech(technologies) {
    const tech = technologies.map(t => t.toLowerCase());
    
    if (tech.includes('android') || tech.includes('mobile') || tech.includes('java')) return 'mobile';
    if (tech.includes('photoshop') || tech.includes('illustrator') || tech.includes('figma')) return 'design';
    return 'development';
}

function getProjectIcon(category) {
    switch(category) {
        case 'mobile': return 'fas fa-mobile-alt';
        case 'design': return 'fas fa-palette';
        case 'development':
        default: return 'fas fa-laptop-code';
    }
}

function getPlaceholderText(category) {
    switch(category) {
        case 'mobile': return 'Mobile App Preview';
        case 'design': return 'Design Preview';
        case 'development':
        default: return 'Project Preview';
    }
}

function initProjectFilters() {
    const filterButtons = document.querySelectorAll('.filter-btn');
    const projectItems = document.querySelectorAll('.project-item');
    
    filterButtons.forEach(button => {
        button.addEventListener('click', function() {
            const filter = this.getAttribute('data-filter');
            
            // Update active button
            filterButtons.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
            
            // Filter projects
            projectItems.forEach(item => {
                if (filter === 'all' || item.getAttribute('data-' + filter) === 'true' || item.getAttribute('data-category') === filter) {
                    item.style.display = 'block';
                    item.style.opacity = '0';
                    setTimeout(() => {
                        item.style.opacity = '1';
                    }, 100);
                } else {
                    item.style.opacity = '0';
                    setTimeout(() => {
                        item.style.display = 'none';
                    }, 300);
                }
            });
        });
    });
    
    console.log('Project filters initialized - Portfolio.js');
}

console.log('Portfolio script fully loaded - Portfolio.js');