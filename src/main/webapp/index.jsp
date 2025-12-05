<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz Portal - Master Your Knowledge</title>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <style>
            :root {
                --primary: #4f46e5;
                --primary-dark: #4338ca;
                --secondary: #10b981;
                --dark: #1f2937;
                --light: #f9fafb;
                --gray: #6b7280;
            }

            body {
                font-family: 'Inter', sans-serif;
                background-color: #f3f4f6;
                height: 100vh;
                overflow-x: hidden;
            }

            .full-height {
                min-height: 100vh;
                display: flex;
                align-items: center;
            }

            /* Left Content Side */
            .hero-content {
                padding: 3rem;
                z-index: 10;
            }

            .brand-badge {
                display: inline-flex;
                align-items: center;
                background: rgba(79, 70, 229, 0.1);
                color: var(--primary);
                padding: 0.5rem 1rem;
                border-radius: 50px;
                font-weight: 600;
                font-size: 0.9rem;
                margin-bottom: 1.5rem;
            }

            .hero-title {
                font-size: 3.5rem;
                font-weight: 800;
                color: var(--dark);
                line-height: 1.1;
                margin-bottom: 1.5rem;
            }

            .hero-title span {
                color: var(--primary);
                position: relative;
            }

            .hero-title span::after {
                content: '';
                position: absolute;
                bottom: 5px;
                left: 0;
                width: 100%;
                height: 10px;
                background: rgba(79, 70, 229, 0.2);
                z-index: -1;
            }

            .hero-subtitle {
                font-size: 1.2rem;
                color: var(--gray);
                margin-bottom: 2.5rem;
                max-width: 500px;
                line-height: 1.6;
            }

            /* Buttons */
            .btn-custom {
                padding: 0.8rem 2rem;
                border-radius: 12px;
                font-weight: 600;
                font-size: 1rem;
                transition: all 0.3s ease;
            }

            .btn-primary-custom {
                background-color: var(--primary);
                color: white;
                border: 2px solid var(--primary);
                box-shadow: 0 4px 14px rgba(79, 70, 229, 0.4);
            }

            .btn-primary-custom:hover {
                background-color: var(--primary-dark);
                border-color: var(--primary-dark);
                color: white;
                transform: translateY(-2px);
            }

            .btn-outline-custom {
                background-color: transparent;
                color: var(--dark);
                border: 2px solid #e5e7eb;
            }

            .btn-outline-custom:hover {
                border-color: var(--dark);
                background-color: transparent;
                color: var(--dark);
                transform: translateY(-2px);
            }

            /* Feature Cards */
            .feature-box {
                background: white;
                padding: 1.5rem;
                border-radius: 16px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                transition: transform 0.3s ease;
                height: 100%;
                border: 1px solid #f3f4f6;
            }

            .feature-box:hover {
                transform: translateY(-5px);
                border-color: var(--primary);
            }

            .icon-circle {
                width: 48px;
                height: 48px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                margin-bottom: 1rem;
            }

            .bg-purple-light {
                background: #e0e7ff;
                color: var(--primary);
            }

            .bg-green-light {
                background: #d1fae5;
                color: var(--secondary);
            }

            .bg-orange-light {
                background: #ffedd5;
                color: #ea580c;
            }

            .feature-box h5 {
                font-weight: 700;
                margin-bottom: 0.5rem;
                color: var(--dark);
            }

            .feature-box p {
                font-size: 0.9rem;
                color: var(--gray);
                margin: 0;
            }

            /* Right Side Visual */
            .visual-side {
                background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
                position: relative;
                overflow: hidden;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .glass-card {
                background: rgba(255, 255, 255, 0.1);
                backdrop-filter: blur(20px);
                border: 1px solid rgba(255, 255, 255, 0.2);
                padding: 2rem;
                border-radius: 24px;
                width: 80%;
                max-width: 400px;
                box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
                transform: rotate(-3deg);
                transition: transform 0.5s ease;
            }

            .glass-card:hover {
                transform: rotate(0deg) scale(1.02);
            }

            .stat-row {
                display: flex;
                align-items: center;
                gap: 1rem;
                margin-bottom: 1.5rem;
                background: rgba(255, 255, 255, 0.9);
                padding: 1rem;
                border-radius: 12px;
            }

            .stat-icon {
                width: 40px;
                height: 40px;
                background: #e0e7ff;
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: var(--primary);
            }

            /* Responsive */
            @media (max-width: 991px) {
                .hero-title {
                    font-size: 2.5rem;
                }

                .full-height {
                    height: auto;
                    padding: 4rem 0;
                }

                .visual-side {
                    display: none;
                }

                /* Hide visual on mobile for simplicity */
                .hero-content {
                    padding: 1rem;
                    text-align: center;
                }

                .brand-badge {
                    margin: 0 auto 1.5rem;
                }

                .hero-subtitle {
                    margin: 0 auto 2.5rem;
                }
            }
        </style>
    </head>

    <body>

        <div class="container-fluid p-0">
            <div class="row no-gutters full-height">

                <!-- Left Side: Content -->
                <div class="col-lg-6 d-flex align-items-center bg-white">
                    <div class="hero-content w-100">
                        <div class="brand-badge">
                            <span>✨ New Quiz Portal</span>
                        </div>

                        <h1 class="hero-title">
                            Master Your <br>
                            <span>Knowledge</span>
                        </h1>

                        <p class="hero-subtitle">
                            The ultimate platform for students and teachers. Create engaging quizzes, track progress,
                            and achieve your educational goals.
                        </p>

                        <div class="d-flex flex-wrap gap-3 mb-5" style="gap: 1rem;">
                            <a href="register.jsp" class="btn btn-custom btn-primary-custom">Get Started Free</a>
                            <a href="login.jsp" class="btn btn-custom btn-outline-custom">Sign In</a>
                        </div>

                        <!-- Features Grid -->
                        <div class="row">
                            <div class="col-md-4 mb-3 mb-md-0">
                                <div class="feature-box">
                                    <div class="icon-circle bg-purple-light">📝</div>
                                    <h5>Create</h5>
                                    <p>Custom Quizzes</p>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3 mb-md-0">
                                <div class="feature-box">
                                    <div class="icon-circle bg-green-light">🎯</div>
                                    <h5>Track</h5>
                                    <p>Real Results</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="feature-box">
                                    <div class="icon-circle bg-orange-light">🚀</div>
                                    <h5>Excel</h5>
                                    <p>Your Goals</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Side: Visual -->
                <div class="col-lg-6 full-height visual-side">
                    <div class="glass-card">
                        <div class="stat-row">
                            <div class="stat-icon">👨‍🏫</div>
                            <div>
                                <h6 class="m-0 font-weight-bold">For Teachers</h6>
                                <small class="text-muted">Manage Classes</small>
                            </div>
                        </div>
                        <div class="stat-row">
                            <div class="stat-icon">👨‍🎓</div>
                            <div>
                                <h6 class="m-0 font-weight-bold">For Students</h6>
                                <small class="text-muted">Take Quizzes</small>
                            </div>
                        </div>
                        <div class="stat-row mb-0">
                            <div class="stat-icon">📊</div>
                            <div>
                                <h6 class="m-0 font-weight-bold">Analytics</h6>
                                <small class="text-muted">Track Progress</small>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>