// =========================
// PORTFOLIO LOADING SCREEN
// =========================

class LoadingScreen {
    constructor() {
        this.loadingElement = document.getElementById('loading-screen');
        this.progressBar = null;
        this.isComplete = false;
        this.minLoadTime = 2000; // Minimum 2 seconds for loading effect
        this.startTime = Date.now();
        
        this.init();
    }
    
    init() {
        // Show loading screen immediately
        this.show();
        
        // Start loading process
        this.startLoading();
        
        // Auto-hide after minimum time and page load
        this.setupAutoHide();
    }
    
    show() {
        if (this.loadingElement) {
            this.loadingElement.style.display = 'flex';
            document.body.style.overflow = 'hidden';
        }
    }
    
    hide() {
        if (this.loadingElement && !this.isComplete) {
            this.isComplete = true;
            
            // Add fade out class
            this.loadingElement.classList.add('fade-out');
            
            // Remove loading screen after animation
            setTimeout(() => {
                this.loadingElement.style.display = 'none';
                document.body.style.overflow = '';
            }, 500);
        }
    }
    
    startLoading() {
        // Create progress bar if it doesn't exist
        if (!this.progressBar) {
            this.createProgressBar();
        }
        
        // Simulate loading progress
        this.animateProgress();
    }
    
    createProgressBar() {
        const loadingContent = this.loadingElement?.querySelector('.loading-content');
        if (loadingContent) {
            const progressContainer = document.createElement('div');
            progressContainer.className = 'loading-progress';
            
            const progressBar = document.createElement('div');
            progressBar.className = 'loading-progress-bar';
            
            progressContainer.appendChild(progressBar);
            loadingContent.appendChild(progressContainer);
            
            this.progressBar = progressBar;
        }
    }
    
    animateProgress() {
        // The CSS animation handles the progress bar automatically
        // This method can be extended for more complex loading logic
    }
    
    setupAutoHide() {
        // Wait for both minimum time and page load
        Promise.all([
            this.waitForMinTime(),
            this.waitForPageLoad()
        ]).then(() => {
            this.hide();
        });
    }
    
    waitForMinTime() {
        return new Promise(resolve => {
            const elapsed = Date.now() - this.startTime;
            const remaining = Math.max(0, this.minLoadTime - elapsed);
            setTimeout(resolve, remaining);
        });
    }
    
    waitForPageLoad() {
        return new Promise(resolve => {
            if (document.readyState === 'complete') {
                resolve();
            } else {
                window.addEventListener('load', resolve);
            }
        });
    }
}

// =========================
// PORTFOLIO MAIN CLASS
// =========================

class PortfolioApp {
    constructor() {
        this.loadingScreen = null;
        this.isInitialized = false;
        
        this.init();
    }
    
    init() {
        // Initialize loading screen first
        this.loadingScreen = new LoadingScreen();
        
        // Wait for DOM to be ready
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', () => this.onDOMReady());
        } else {
            this.onDOMReady();
        }
    }
    
    onDOMReady() {
        if (this.isInitialized) return;
        this.isInitialized = true;
        
        // Initialize other components here in future steps
        this.initializeComponents();
        
        // Setup global event listeners
        this.setupEventListeners();
    }
    
    initializeComponents() {
        // Placeholder for future component initialization
        // - Navigation
        // - Typewriter effect
        // - Scroll animations
        // - Contact forms
        console.log('Portfolio components initialized');
    }
    
    setupEventListeners() {
        // Global event listeners
        window.addEventListener('resize', this.handleResize.bind(this));
        window.addEventListener('scroll', this.handleScroll.bind(this));
    }
    
    handleResize() {
        // Handle window resize events
        // Will be used for responsive adjustments
    }
    
    handleScroll() {
        // Handle scroll events
        // Will be used for scroll animations and navigation
    }
}

// =========================
// INITIALIZE APPLICATION
// =========================

// Start the application when script loads
let portfolioApp;

(function() {
    // Initialize the portfolio application
    portfolioApp = new PortfolioApp();
})();