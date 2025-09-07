// =========================
// SIMPLIFIED LOADING SCREEN
// =========================

document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM Content Loaded');
    
    // Simple approach - hide loading screen after 3 seconds
    const loadingScreen = document.getElementById('loading-screen');
    
    if (loadingScreen) {
        console.log('Loading screen found');
        
        // Hide loading screen after 3 seconds
        setTimeout(function() {
            console.log('Hiding loading screen...');
            loadingScreen.style.opacity = '0';
            loadingScreen.style.transition = 'opacity 0.5s ease-out';
            
            setTimeout(function() {
                loadingScreen.style.display = 'none';
                console.log('Loading screen hidden');
                
                // Initialize typewriter effect
                initializeTypewriter();
            }, 500);
        }, 3000);
    } else {
        console.error('Loading screen element not found');
        // Initialize typewriter anyway
        initializeTypewriter();
    }
});

// =========================
// SIMPLE TYPEWRITER EFFECT
// =========================

function initializeTypewriter() {
    console.log('Initializing typewriter...');
    
    const typewriterElement = document.getElementById('typewriter');
    
    if (!typewriterElement) {
        console.error('Typewriter element not found');
        return;
    }
    
    console.log('Typewriter element found');
    
    const roles = window.portfolioRoles || ['Software Developer', 'Graphics Designer', 'Problem Solver'];
    let currentRoleIndex = 0;
    let currentCharIndex = 0;
    let isDeleting = false;
    
    function type() {
        const currentRole = roles[currentRoleIndex];
        
        if (isDeleting) {
            typewriterElement.textContent = currentRole.substring(0, currentCharIndex - 1);
            currentCharIndex--;
            
            if (currentCharIndex === 0) {
                isDeleting = false;
                currentRoleIndex = (currentRoleIndex + 1) % roles.length;
                setTimeout(type, 500);
                return;
            }
            
            setTimeout(type, 50);
        } else {
            typewriterElement.textContent = currentRole.substring(0, currentCharIndex + 1);
            currentCharIndex++;
            
            if (currentCharIndex === currentRole.length) {
                isDeleting = true;
                setTimeout(type, 2000);
                return;
            }
            
            setTimeout(type, 100);
        }
    }
    
    // Start typing
    type();
    console.log('Typewriter started with roles:', roles);
}

// =========================
// SMOOTH SCROLLING
// =========================

document.addEventListener('DOMContentLoaded', function() {
    // Add smooth scrolling to anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
});

console.log('Portfolio script loaded - simplified version');