<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Contact - ENSA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Google Fonts for ENSA logo -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700;800&display=swap" rel="stylesheet">

    <!-- Favicon -->
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/3309/3309804.png" type="image/x-icon">
    <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3309/3309804.png" type="image/x-icon">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/slick/slick.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/animate/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/aos/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/venobox/venobox.css">
    <link href="${pageContext.request.contextPath}/public/css/style.css" rel="stylesheet">

    <style>
        :root {
            --ensa-yellow: #ffbc3b;
            --ensa-yellow-hover: #e0a330;
            --ensa-dark: #222;
            --ensa-light: #f8f9fa;
            --ensa-border: #e9ecef;
        }

        body { padding-top: 80px; }
        .header, footer { font-family: 'Montserrat', sans-serif; color: #333; }

        /* --- HEADER (identique à index) --- */
        .header {
            position: fixed !important; top: 0; width: 100%; z-index: 9999;
            background-color: #fff !important;
            box-shadow: 0 2px 12px rgba(0,0,0,.08);
        }
        .navbar-brand {
            font-family: 'Montserrat', sans-serif; font-weight: 800; font-size: 2.2rem;
            color: #ffbc3b !important; text-transform: uppercase; letter-spacing: 2px;
        }
        .navbar .nav-link { font-weight: 600; color: #333 !important; position: relative; }
        .navbar .nav-link::after {
            content: ""; position: absolute; left: 50%; bottom: 2px; width: 0; height: 2px;
            background: #ffbc3b; transition: .25s; transform: translateX(-50%);
        }
        .navbar .nav-link:hover::after, .navbar .nav-item.active .nav-link::after { width: 60%; }
        .navbar .nav-link:hover { color: #e0a330 !important; }
        .btn-login {
            background: #ffbc3b; color: #222 !important; font-weight: 700; text-transform: uppercase;
            padding: 9px 22px !important; margin-left: 14px; border-radius: 30px; transition: .25s;
            display: inline-block;
        }
        .btn-login:hover { background: #e0a330; text-decoration: none; transform: translateY(-2px); }

        /* --- PAGE TITLE --- */
        .page-title-section {
            position: relative;
            background-image: url('https://images.unsplash.com/photo-1541339907198-e08756dedf3f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover !important;
            background-position: center !important;
            background-repeat: no-repeat !important;
            padding: 120px 0 !important;
            display: flex;
            align-items: center;
        }
        .page-title-section::before {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }
        .page-title-section .container { position: relative; z-index: 2; }
        .page-title-section .eyebrow {
            display: inline-block;
            color: var(--ensa-yellow);
            font-weight: 800;
            letter-spacing: 3px;
            font-size: .8rem;
            text-transform: uppercase;
            margin-bottom: 10px;
        }
        .page-title-section h1 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 800;
            color: #fff;
            margin-bottom: 12px;
        }
        .page-title-section h1 span { color: var(--ensa-yellow); }
        .page-title-section p { color: rgba(255,255,255,.85); font-size: 1.1rem; margin: 0; }

        /* --- CONTACT SECTION --- */
        .contact-section { background: var(--ensa-light); padding: 80px 0; }

        /* --- INFO CARDS --- */
        .info-card {
            display: flex;
            align-items: flex-start;
            gap: 18px;
            background: #fff;
            border: 1px solid var(--ensa-border);
            border-radius: 14px;
            padding: 22px;
            margin-bottom: 20px;
            transition: all .3s ease;
        }
        .info-card:hover {
            transform: translateY(-4px);
            border-color: var(--ensa-yellow);
            box-shadow: 0 10px 25px rgba(0,0,0,.08);
        }
        .info-icon {
            flex-shrink: 0;
            width: 54px; height: 54px;
            border-radius: 14px;
            background: rgba(255,188,59,.18);
            color: #c98400;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.4rem;
        }
        .info-card h5 { font-weight: 700; color: var(--ensa-dark); margin-bottom: 6px; font-size: 1.05rem; }
        .info-card p { margin: 0; color: #6c757d; font-size: .95rem; line-height: 1.6; }

        /* --- CONTACT FORM --- */
        .contact-form {
            background: #fff;
            padding: 40px;
            border-radius: 16px;
            border-top: 5px solid var(--ensa-yellow);
            box-shadow: 0 10px 40px rgba(0,0,0,0.07);
        }
        .contact-form h3 { font-family: 'Montserrat', sans-serif; font-weight: 800; color: var(--ensa-dark); margin-bottom: 6px; }
        .contact-form .form-sub { color: #6c757d; margin-bottom: 28px; }

        .contact-form label {
            font-weight: 700;
            font-size: .85rem;
            color: #45544c;
            margin-bottom: 8px;
        }
        .contact-form .form-control {
            border: 1px solid var(--ensa-border);
            padding: 13px 16px;
            height: auto;
            border-radius: 10px;
            background-color: var(--ensa-light);
            transition: all .2s;
            font-size: .95rem;
        }
        .contact-form .form-control:focus {
            box-shadow: 0 0 0 4px rgba(255,188,59,.2);
            border-color: var(--ensa-yellow);
            background-color: #fff;
        }
        .contact-form .form-group { margin-bottom: 20px; }
        .char-count { display: block; text-align: right; font-size: .75rem; color: #9aa3ad; margin-top: 6px; }

        .btn-send {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            width: 100%;
            padding: 15px 28px;
            background: var(--ensa-yellow);
            color: var(--ensa-dark);
            font-weight: 800;
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: all .25s ease;
        }
        .btn-send:hover:not(:disabled) {
            background: var(--ensa-yellow-hover);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(255,188,59,.4);
        }
        .btn-send:disabled { opacity: .7; cursor: not-allowed; }
        .spinner {
            width: 18px; height: 18px;
            border: 3px solid rgba(34,34,34,.25);
            border-top-color: var(--ensa-dark);
            border-radius: 50%;
            animation: spin .7s linear infinite;
            display: none;
        }
        .btn-send.loading .spinner { display: inline-block; }
        @keyframes spin { to { transform: rotate(360deg); } }

        /* --- ALERTES --- */
        .form-alert {
            display: none;
            padding: 14px 18px;
            border-radius: 10px;
            margin-bottom: 24px;
            font-weight: 600;
            align-items: center;
            gap: 12px;
        }
        .form-alert.show { display: flex; }
        .form-alert.success { background: #e8f6ee; color: #176b40; border: 1px solid #b9e2c9; }
        .form-alert.error { background: #fdecec; color: #c62828; border: 1px solid #f5c2c2; }

        /* --- FOOTER (identique à index) --- */
        footer { background: #fff; border-top: 1px solid #e9ecef; padding-top: 60px; }
        .footer-container { max-width: 1000px; margin: 0 auto; }
        footer h2 { font-family: 'Montserrat', sans-serif; font-weight: 800; color: #ffbc3b; margin-bottom: 15px; }
        footer h5 { font-family: 'Montserrat', sans-serif; color: #222; font-weight: 700; }
        footer p, footer a { color: #666; font-size: .9rem; text-decoration: none; }
        footer a:hover { color: #e0a330; }
        footer li { margin-bottom: 8px; }
        .copyright { background: #f8f9fa; border-top: 1px solid #e9ecef; padding: 20px 0; margin-top: 40px; }

        @media (max-width: 767px) {
            .contact-form { padding: 26px 20px; }
            .contact-section { padding: 50px 0; }
        }
    </style>
</head>

<body>

<!-- ================= HEADER ================= -->
<header class="header">
    <div class="navigation w-100">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light p-0">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/public/index.jsp">ENSA</a>
                <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navigation">
                    <ul class="navbar-nav ml-auto text-center align-items-center">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/about.jsp">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/index.jsp#ensa-agadir">ENSA Agadir</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/index.jsp#courses-section">Courses</a></li>
                        <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/public/contact.jsp">Contact</a></li>
                        <li class="nav-item"><a class="btn-login" href="${pageContext.request.contextPath}/public/login.jsp">Login</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>
<!-- /header -->

<!-- ================= PAGE TITLE ================= -->
<section class="page-title-section">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <span class="eyebrow">Get in touch</span>
                <h1>Contact <span>Us</span></h1>
                <p>We are here to answer all your questions.</p>
            </div>
        </div>
    </div>
</section>
<!-- /page title -->

<!-- ================= CONTACT ================= -->
<section class="contact-section">
    <div class="container">
        <div class="row">

            <!-- Information Column -->
            <div class="col-lg-4 mb-4 mb-lg-0">
                <div class="info-card">
                    <div class="info-icon"><i class="ti-location-pin"></i></div>
                    <div>
                        <h5>Our Address</h5>
                        <p>University Avenue,<br>BP 1234, City, Morocco</p>
                    </div>
                </div>
                <div class="info-card">
                    <div class="info-icon"><i class="ti-email"></i></div>
                    <div>
                        <h5>Email</h5>
                        <p>contact@ensa.edu<br>admission@ensa.edu</p>
                    </div>
                </div>
                <div class="info-card">
                    <div class="info-icon"><i class="ti-mobile"></i></div>
                    <div>
                        <h5>Phone</h5>
                        <p>+212 5 22 00 00 00</p>
                    </div>
                </div>
            </div>

            <!-- Form Column -->
            <div class="col-lg-8">
                <div class="contact-form">
                    <h3>Send us a message</h3>
                    <p class="form-sub">Fill in the form below and we will get back to you as soon as possible.</p>

                    <div id="formMessage" class="form-alert" role="alert">
                        <i id="formMessageIcon"></i>
                        <span id="formMessageText"></span>
                    </div>

                    <form id="contactForm" novalidate>
                        <input type="hidden" name="access_key" value="1aa414f6-74ae-4cb7-a668-12d8d4450522">
                        <input type="hidden" name="from_name" value="ENSA - Contact Form">

                        <!-- Anti-spam : doit rester caché et décoché -->
                        <input type="checkbox" name="botcheck" class="d-none" tabindex="-1" autocomplete="off">

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name">Your Name</label>
                                    <input type="text" id="name" name="name" class="form-control" placeholder="John Doe" maxlength="100" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="email">Your Email</label>
                                    <input type="email" id="email" name="email" class="form-control" placeholder="john@example.com" maxlength="150" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="subject">Subject</label>
                            <input type="text" id="subject" name="subject" class="form-control" placeholder="How can we help you?" maxlength="150" required>
                        </div>

                        <div class="form-group">
                            <label for="message">Your Message</label>
                            <textarea id="message" name="message" class="form-control" rows="6" placeholder="Write your message here..." maxlength="5000" required></textarea>
                            <span class="char-count"><span id="charCount">0</span> / 5000</span>
                        </div>

                        <button type="submit" id="sendBtn" class="btn-send">
                            <span class="spinner"></span>
                            <span id="sendBtnText">Send Message</span>
                        </button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- /contact -->

<!-- ================= FOOTER ================= -->
<footer>
    <div class="footer-container container">
        <div class="row text-center text-md-left">
            <div class="col-md-5 mb-4 mb-md-0">
                <h2>ENSA</h2>
                <p>Empowering students to achieve their dreams through quality education and innovation.</p>
            </div>
            <div class="col-md-3 mb-4 mb-md-0">
                <h5 class="mb-3">Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/public/index.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/public/about.jsp">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/public/index.jsp#ensa-agadir">ENSA Agadir</a></li>
                    <li><a href="${pageContext.request.contextPath}/public/index.jsp#courses-section">Courses</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5 class="mb-3">Contact</h5>
                <p class="mb-1">Avenue Tamsoult, B.P. 1136, Agadir, Morocco</p>
                <p class="mb-1">contact@ensa.edu</p>
                <p>+1 234 567 890</p>
            </div>
        </div>
    </div>
    <div class="copyright text-center">
        <div class="container">
            <p class="mb-0 text-muted">© 2024 ENSA. All Rights Reserved.</p>
        </div>
    </div>
</footer>

<!-- ================= SCRIPTS ================= -->
<script src="${pageContext.request.contextPath}/public/plugins/jQuery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/public/plugins/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/public/plugins/slick/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/public/plugins/aos/aos.js"></script>
<script src="${pageContext.request.contextPath}/public/plugins/venobox/venobox.min.js"></script>
<script src="${pageContext.request.contextPath}/public/js/script.js"></script>

<script>
    if (typeof AOS !== 'undefined') { AOS.init(); }

    (function () {
        const form = document.getElementById('contactForm');
        const btn = document.getElementById('sendBtn');
        const btnText = document.getElementById('sendBtnText');
        const box = document.getElementById('formMessage');
        const boxIcon = document.getElementById('formMessageIcon');
        const boxText = document.getElementById('formMessageText');
        const textarea = document.getElementById('message');
        const counter = document.getElementById('charCount');

        // Compteur de caractères
        textarea.addEventListener('input', function () {
            counter.textContent = textarea.value.length;
        });

        function showMessage(type, text) {
            box.className = 'form-alert show ' + type;
            boxIcon.className = type === 'success' ? 'ti-check' : 'ti-alert';
            boxText.textContent = text;
            box.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }

        function setLoading(loading) {
            btn.disabled = loading;
            btn.classList.toggle('loading', loading);
            btnText.textContent = loading ? 'Sending...' : 'Send Message';
        }

        form.addEventListener('submit', async function (e) {
            e.preventDefault();

            if (!form.checkValidity()) {
                form.reportValidity();
                return;
            }

            setLoading(true);
            box.className = 'form-alert';

            try {
                const response = await fetch('https://api.web3forms.com/submit', {
                    method: 'POST',
                    headers: { 'Accept': 'application/json' },
                    body: new FormData(form)
                });
                const result = await response.json();

                if (response.ok && result.success) {
                    showMessage('success', 'Thank you! Your message has been sent successfully.');
                    form.reset();
                    counter.textContent = '0';
                } else {
                    showMessage('error', 'Sorry, your message could not be sent. Please try again.');
                }
            } catch (err) {
                showMessage('error', 'Network error. Please check your connection and try again.');
            }

            setLoading(false);
        });
    })();
</script>
</body>
</html>