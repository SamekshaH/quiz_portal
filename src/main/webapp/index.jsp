<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz Portal - Test Your Knowledge</title>
        <meta name="description"
            content="Welcome to Quiz Portal - An interactive platform for students and teachers to create, take, and manage quizzes online.">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/landing.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap"
            rel="stylesheet">
    </head>

    <body class="landing-page">
        <!-- Animated Background -->
        <div class="animated-bg">
            <div class="gradient-orb orb-1"></div>
            <div class="gradient-orb orb-2"></div>
            <div class="gradient-orb orb-3"></div>
        </div>

        <!-- Hero Section -->
        <section class="hero-section">
            <div class="container">
                <div class="row align-items-center min-vh-100">
                    <div class="col-lg-6 hero-content">
                        <div class="badge-pill">
                            <span class="pulse-dot"></span>
                            <span class="badge-text">Welcome to the Future of Learning</span>
                        </div>
                        <h1 class="hero-title">
                            Master Your Knowledge with
                            <span class="gradient-text">Quiz Portal</span>
                        </h1>
                        <p class="hero-description">
                            An innovative platform designed for students and educators. Create engaging quizzes,
                            track progress, and enhance learning experiences with our intuitive quiz management system.
                        </p>
                        <div class="cta-buttons">
                            <a href="register.jsp" class="btn btn-primary-custom btn-lg">
                                <span>Get Started</span>
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                    <path d="M7.5 15L12.5 10L7.5 5" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round" />
                                </svg>
                            </a>
                            <a href="login.jsp" class="btn btn-secondary-custom btn-lg">
                                <span>Sign In</span>
                            </a>
                        </div>
                        <div class="stats-row">
                            <div class="stat-item">
                                <div class="stat-number">1000+</div>
                                <div class="stat-label">Active Users</div>
                            </div>
                            <div class="stat-divider"></div>
                            <div class="stat-item">
                                <div class="stat-number">5000+</div>
                                <div class="stat-label">Quizzes Created</div>
                            </div>
                            <div class="stat-divider"></div>
                            <div class="stat-item">
                                <div class="stat-number">98%</div>
                                <div class="stat-label">Satisfaction Rate</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="hero-visual">
                            <div class="floating-card card-1">
                                <div class="card-icon">📝</div>
                                <div class="card-title">Create Quizzes</div>
                                <div class="card-desc">Build custom quizzes in minutes</div>
                            </div>
                            <div class="floating-card card-2">
                                <div class="card-icon">📊</div>
                                <div class="card-title">Track Progress</div>
                                <div class="card-desc">Monitor performance analytics</div>
                            </div>
                            <div class="floating-card card-3">
                                <div class="card-icon">🎯</div>
                                <div class="card-title">Achieve Goals</div>
                                <div class="card-desc">Reach your learning objectives</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features-section">
            <div class="container">
                <div class="section-header text-center">
                    <h2 class="section-title">Powerful Features for Everyone</h2>
                    <p class="section-subtitle">Everything you need to create, manage, and excel in quizzes</p>
                </div>
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                                    <rect width="40" height="40" rx="12" fill="url(#grad1)" />
                                    <path d="M12 20L18 26L28 14" stroke="white" stroke-width="3" stroke-linecap="round"
                                        stroke-linejoin="round" />
                                    <defs>
                                        <linearGradient id="grad1" x1="0" y1="0" x2="40" y2="40">
                                            <stop offset="0%" stop-color="#667eea" />
                                            <stop offset="100%" stop-color="#764ba2" />
                                        </linearGradient>
                                    </defs>
                                </svg>
                            </div>
                            <h3 class="feature-title">Easy Quiz Creation</h3>
                            <p class="feature-description">
                                Create comprehensive quizzes with multiple question types, time limits,
                                and custom scoring systems in just a few clicks.
                            </p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                                    <rect width="40" height="40" rx="12" fill="url(#grad2)" />
                                    <circle cx="20" cy="15" r="5" stroke="white" stroke-width="2" />
                                    <path d="M10 30C10 25 14 22 20 22C26 22 30 25 30 30" stroke="white" stroke-width="2"
                                        stroke-linecap="round" />
                                    <defs>
                                        <linearGradient id="grad2" x1="0" y1="0" x2="40" y2="40">
                                            <stop offset="0%" stop-color="#f093fb" />
                                            <stop offset="100%" stop-color="#f5576c" />
                                        </linearGradient>
                                    </defs>
                                </svg>
                            </div>
                            <h3 class="feature-title">Student & Teacher Roles</h3>
                            <p class="feature-description">
                                Separate interfaces for students and teachers. Teachers create and manage
                                quizzes while students take tests and view results.
                            </p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                                    <rect width="40" height="40" rx="12" fill="url(#grad3)" />
                                    <rect x="10" y="12" width="20" height="16" rx="2" stroke="white" stroke-width="2" />
                                    <line x1="10" y1="18" x2="30" y2="18" stroke="white" stroke-width="2" />
                                    <line x1="15" y1="22" x2="25" y2="22" stroke="white" stroke-width="2" />
                                    <line x1="15" y1="25" x2="22" y2="25" stroke="white" stroke-width="2" />
                                    <defs>
                                        <linearGradient id="grad3" x1="0" y1="0" x2="40" y2="40">
                                            <stop offset="0%" stop-color="#4facfe" />
                                            <stop offset="100%" stop-color="#00f2fe" />
                                        </linearGradient>
                                    </defs>
                                </svg>
                            </div>
                            <h3 class="feature-title">Real-time Results</h3>
                            <p class="feature-description">
                                Get instant feedback on quiz performance with detailed analytics,
                                score breakdowns, and comprehensive result tracking.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta-section">
            <div class="container">
                <div class="cta-card">
                    <h2 class="cta-title">Ready to Start Your Learning Journey?</h2>
                    <p class="cta-description">
                        Join thousands of students and teachers already using Quiz Portal to enhance their educational
                        experience.
                    </p>
                    <div class="cta-buttons-center">
                        <a href="register.jsp" class="btn btn-light-custom btn-lg">
                            <span>Create Free Account</span>
                        </a>
                        <a href="login.jsp" class="btn btn-outline-custom btn-lg">
                            <span>Sign In</span>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="landing-footer">
            <div class="container">
                <div class="footer-content">
                    <div class="footer-brand">
                        <h3>Quiz Portal</h3>
                        <p>Empowering education through technology</p>
                    </div>
                    <div class="footer-copyright">
                        <p>&copy; 2025 Quiz Portal. All rights reserved.</p>
                    </div>
                </div>
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>