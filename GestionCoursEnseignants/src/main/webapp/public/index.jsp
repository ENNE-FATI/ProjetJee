<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>ENSA - Home</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700;800&display=swap" rel="stylesheet">

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
      --y: #ffbc3b;
      --y-h: #e0a330;
      --g: #194b38;
      --g-dark: #123b2d;
      --d: #222;
      --muted: #6c757d;
      --line: #e9ecef;
    }
    html { scroll-behavior: smooth; }
    body { font-family: 'Montserrat', sans-serif; padding-top: 80px; color: #333; background: #f8f9fb; }
    h1, h2, h3, h4, h5 { font-family: 'Montserrat', sans-serif; color: var(--d); }
    section[id] { scroll-margin-top: 90px; }

    /* --- HEADER --- */
    .header {
      position: fixed !important; top: 0; width: 100%; z-index: 9999;
      background-color: #fff !important;
      box-shadow: 0 2px 12px rgba(0,0,0,.08);
    }
    .navbar-brand {
      font-family: 'Montserrat', sans-serif; font-weight: 800; font-size: 2.2rem;
      color: var(--y) !important; text-transform: uppercase; letter-spacing: 2px;
    }
    .navbar .nav-link { font-weight: 600; color: #333 !important; position: relative; }
    .navbar .nav-link::after {
      content: ""; position: absolute; left: 50%; bottom: 2px; width: 0; height: 2px;
      background: var(--y); transition: .25s; transform: translateX(-50%);
    }
    .navbar .nav-link:hover::after, .navbar .nav-item.active .nav-link::after { width: 60%; }
    .navbar .nav-link:hover { color: var(--y-h) !important; }
    .btn-login {
      background: var(--y); color: var(--d) !important; font-weight: 700; text-transform: uppercase;
      padding: 9px 22px !important; margin-left: 14px; border-radius: 30px; transition: .25s;
      display: inline-block;
    }
    .btn-login:hover { background: var(--y-h); text-decoration: none; transform: translateY(-2px); }

    /* --- BUTTONS --- */
    .btn-ensa {
      background: var(--y); color: var(--d); font-weight: 700; border: 2px solid var(--y);
      border-radius: 30px; padding: 13px 34px; transition: .25s; display: inline-block;
    }
    .btn-ensa:hover { background: var(--y-h); border-color: var(--y-h); color: var(--d); text-decoration: none; transform: translateY(-3px); box-shadow: 0 10px 22px rgba(255,188,59,.35); }
    .btn-ghost {
      background: transparent; color: #fff; font-weight: 700; border: 2px solid #fff;
      border-radius: 30px; padding: 13px 34px; transition: .25s; display: inline-block;
    }
    .btn-ghost:hover { background: #fff; color: var(--d); text-decoration: none; transform: translateY(-3px); }

    /* --- HERO --- */
    .hero-section { position: relative; min-height: 680px; display: flex; align-items: center; background: #222; overflow: hidden; }
    .hero-img { position: absolute; inset: 0; width: 100%; height: 100%; object-fit: cover; z-index: 1; }
    .hero-overlay { position: absolute; inset: 0; z-index: 2; background: linear-gradient(120deg, rgba(18,59,45,.93) 0%, rgba(0,0,0,.55) 100%); }
    .hero-content { position: relative; z-index: 3; color: #fff; padding: 70px 0 120px; }
    .hero-badge {
      display: inline-block; background: rgba(255,188,59,.18); color: var(--y);
      border: 1px solid rgba(255,188,59,.5); padding: 7px 18px; border-radius: 30px;
      font-weight: 700; font-size: .8rem; letter-spacing: 1.5px; text-transform: uppercase; margin-bottom: 22px;
    }
    .hero-content h1 { color: #fff; font-weight: 800; font-size: 3.2rem; line-height: 1.15; text-shadow: 0 3px 10px rgba(0,0,0,.35); }
    .hero-content h1 span { color: var(--y); }
    .hero-content .lead { color: rgba(255,255,255,.9); max-width: 560px; }

    /* --- STATS --- */
    .stats-wrap { position: relative; z-index: 5; margin-top: -70px; }
    .stats-card {
      background: #fff; border-radius: 20px; box-shadow: 0 15px 40px rgba(0,0,0,.1);
      padding: 28px 15px;
    }
    .stat-item { text-align: center; padding: 10px; border-right: 1px solid var(--line); }
    .stats-card .col-6:last-child .stat-item, .stats-card .col-md-3:last-child .stat-item { border-right: 0; }
    .stat-number { font-size: 2.2rem; font-weight: 800; color: var(--g); line-height: 1; }
    .stat-number span { color: var(--y); }
    .stat-label { color: var(--muted); font-size: .85rem; font-weight: 600; margin-top: 8px; text-transform: uppercase; letter-spacing: 1px; }

    /* --- SECTION HEAD --- */
    .section-head { text-align: center; margin-bottom: 50px; }
    .section-eyebrow { color: var(--y-h); font-weight: 700; font-size: .8rem; letter-spacing: 2px; text-transform: uppercase; }
    .section-head h2 { font-weight: 800; margin-top: 8px; }
    .section-head h2::after { content: ""; display: block; width: 60px; height: 4px; background: var(--y); border-radius: 4px; margin: 14px auto 0; }
    .section-head p { color: var(--muted); max-width: 620px; margin: 14px auto 0; }

    /* --- FEATURES --- */
    .feature-card {
      background: #fff; border: 1px solid var(--line); border-radius: 18px; padding: 34px 26px;
      text-align: center; height: 100%; transition: .3s;
    }
    .feature-card:hover { transform: translateY(-8px); box-shadow: 0 15px 35px rgba(0,0,0,.09); border-color: var(--y); }
    .feature-icon {
      width: 76px; height: 76px; border-radius: 50%; margin: 0 auto 20px;
      background: rgba(255,188,59,.15); color: var(--y-h); font-size: 2rem;
      display: flex; align-items: center; justify-content: center;
    }
    .feature-card h5 { font-weight: 700; }
    .feature-card p { color: var(--muted); font-size: .92rem; margin: 0; }

    /* --- COURSES --- */
    .filter-bar { text-align: center; margin-bottom: 35px; }
    .filter-btn {
      background: #fff; border: 1px solid var(--line); color: #555; font-weight: 700; font-size: .85rem;
      padding: 9px 22px; border-radius: 30px; margin: 4px; cursor: pointer; transition: .2s;
    }
    .filter-btn:hover { border-color: var(--y); color: var(--d); }
    .filter-btn.active { background: var(--y); border-color: var(--y); color: var(--d); }

    .course-card {
      background: #fff; border: 1px solid var(--line); border-radius: 18px; overflow: hidden;
      height: 100%; display: flex; flex-direction: column; transition: .3s;
    }
    .course-card:hover { transform: translateY(-8px); box-shadow: 0 15px 35px rgba(0,0,0,.1); border-color: var(--y); }
    .course-img {
      height: 200px; position: relative;
      background: linear-gradient(135deg, var(--g) 0%, var(--g-dark) 100%) center/cover no-repeat;
    }
    .course-img::after { content: ""; position: absolute; inset: 0; background: linear-gradient(180deg, transparent 50%, rgba(0,0,0,.35)); }
    .course-tag {
      position: absolute; top: 14px; left: 14px; z-index: 2; background: var(--y); color: var(--d);
      font-size: .72rem; font-weight: 800; letter-spacing: 1px; text-transform: uppercase;
      padding: 5px 13px; border-radius: 20px;
    }
    .course-body { padding: 24px; display: flex; flex-direction: column; flex-grow: 1; }
    .course-body h4 { font-size: 1.15rem; font-weight: 700; margin-bottom: 10px; }
    .course-body p { color: var(--muted); font-size: .92rem; flex-grow: 1; }
    .course-foot { display: flex; align-items: center; justify-content: space-between; margin-top: 12px; }
    .course-meta { color: #8a94a0; font-size: .8rem; font-weight: 600; }
    .btn-enroll {
      background: var(--y); color: var(--d); font-weight: 700; border-radius: 8px;
      padding: 8px 20px; font-size: .85rem; transition: .2s;
    }
    .btn-enroll:hover { background: var(--y-h); color: var(--d); text-decoration: none; }
    .course-item.hide { display: none; }

    /* --- ENSA AGADIR --- */
    .agadir-section { background: #fff; }
    .agadir-img-wrap { position: relative; }
    .agadir-img-wrap img { width: 100%; height: 440px; object-fit: cover; border-radius: 20px; box-shadow: 0 15px 40px rgba(0,0,0,.15); }
    .agadir-badge {
      position: absolute; right: -15px; bottom: 30px; background: var(--g); color: #fff;
      padding: 18px 26px; border-radius: 16px; box-shadow: 0 10px 25px rgba(0,0,0,.25); text-align: center;
    }
    .agadir-badge strong { display: block; font-size: 2rem; color: var(--y); line-height: 1; font-weight: 800; }
    .agadir-badge span { font-size: .75rem; letter-spacing: 1px; text-transform: uppercase; }
    .agadir-list { list-style: none; padding: 0; margin: 20px 0 28px; }
    .agadir-list li { padding: 8px 0 8px 34px; position: relative; font-weight: 600; color: #444; }
    .agadir-list li::before {
      content: "\2713"; position: absolute; left: 0; top: 7px; width: 22px; height: 22px; border-radius: 50%;
      background: rgba(255,188,59,.2); color: var(--y-h); font-size: .8rem; text-align: center; line-height: 22px; font-weight: 800;
    }

    /* --- CTA --- */
    .cta-section {
      background: linear-gradient(120deg, var(--g) 0%, var(--g-dark) 100%); color: #fff; text-align: center;
      padding: 80px 0; position: relative; overflow: hidden;
    }
    .cta-section::before { content: ""; position: absolute; width: 380px; height: 380px; border-radius: 50%; background: rgba(255,188,59,.09); top: -140px; right: -90px; }
    .cta-section h2 { color: #fff; font-weight: 800; position: relative; }
    .cta-section p { color: rgba(255,255,255,.85); position: relative; }
    .cta-section .btn-ensa { position: relative; }

    /* --- FOOTER --- */
    footer { background: #fff; border-top: 1px solid var(--line); color: #333; padding-top: 60px; }
    .footer-container { max-width: 1000px; margin: 0 auto; }
    footer h2 { font-family: 'Montserrat', sans-serif; font-weight: 800; color: var(--y); margin-bottom: 15px; }
    footer h5 { color: var(--d); font-weight: 700; }
    footer p, footer a { color: #666; font-size: .9rem; text-decoration: none; }
    footer a:hover { color: var(--y-h); }
    footer li { margin-bottom: 8px; }
    .copyright { background: #f8f9fa; border-top: 1px solid var(--line); padding: 20px 0; margin-top: 40px; }

    @media (max-width: 767px) {
      .hero-content h1 { font-size: 2.2rem; }
      .stat-item { border-right: 0; border-bottom: 1px solid var(--line); }
      .agadir-badge { right: 10px; }
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
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/public/index.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/about.jsp">About Us</a></li>
            <li class="nav-item"><a class="nav-link" href="#ensa-agadir">ENSA Agadir</a></li>
            <li class="nav-item"><a class="nav-link" href="#courses-section">Courses</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/contact.jsp">Contact</a></li>
            <li class="nav-item"><a class="btn-login" href="${pageContext.request.contextPath}/public/login.jsp">Login</a></li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</header>

<!-- ================= HERO SECTION ================= -->
<section class="hero-section">
  <img src="https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80" alt="Campus ENSA" class="hero-img">
  <div class="hero-overlay"></div>

  <div class="container hero-content">
    <div class="row">
      <div class="col-lg-8">
        <span class="hero-badge" data-aos="fade-down">Engineering school · Since 1999</span>
        <h1 class="mb-4" data-aos="fade-up">Your Bright Future is <span>Our Mission</span></h1>
        <p class="lead mb-5" data-aos="fade-up" data-aos-delay="100">Join ENSA to acquire the necessary skills and excel in the world of engineering.</p>
        <div data-aos="fade-up" data-aos-delay="200">
          <a href="${pageContext.request.contextPath}/public/contact.jsp" class="btn-ensa mr-2 mb-2">Apply Now</a>
          <a href="#ensa-agadir" class="btn-ghost mb-2">Discover ENSA Agadir</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ================= STATS ================= -->
<section class="stats-wrap">
  <div class="container">
    <div class="stats-card" data-aos="fade-up">
      <div class="row no-gutters">
        <div class="col-6 col-md-3"><div class="stat-item"><div class="stat-number">1999</div><div class="stat-label">ENSA Agadir created</div></div></div>
        <div class="col-6 col-md-3"><div class="stat-item"><div class="stat-number">1500<span>+</span></div><div class="stat-label">Students</div></div></div>
        <div class="col-6 col-md-3"><div class="stat-item"><div class="stat-number">4</div><div class="stat-label">Engineering tracks</div></div></div>
        <div class="col-6 col-md-3"><div class="stat-item"><div class="stat-number">5<span> yrs</span></div><div class="stat-label">Integrated curriculum</div></div></div>
      </div>
    </div>
  </div>
</section>

<!-- ================= FEATURES ================= -->
<section class="py-5 mt-4">
  <div class="container">
    <div class="section-head" data-aos="fade-up">
      <div class="section-eyebrow">Why ENSA</div>
      <h2>Excellence in Engineering Education</h2>
      <p>A demanding yet supportive environment where theory meets real-world practice.</p>
    </div>
    <div class="row">
      <div class="col-md-4 mb-4" data-aos="fade-up">
        <div class="feature-card">
          <div class="feature-icon"><i class="ti-book"></i></div>
          <h5>Quality Courses</h5>
          <p>Programs designed to answer current and future technological and industrial challenges.</p>
        </div>
      </div>
      <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="100">
        <div class="feature-card">
          <div class="feature-icon"><i class="ti-medall"></i></div>
          <h5>Expert Teachers</h5>
          <p>Experienced professors and professionals who guide every student toward excellence.</p>
        </div>
      </div>
      <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="200">
        <div class="feature-card">
          <div class="feature-icon"><i class="ti-desktop"></i></div>
          <h5>Online Learning</h5>
          <p>Course resources and live Zoom sessions available anywhere, anytime.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ================= ENSA AGADIR ================= -->
<section class="agadir-section py-5" id="ensa-agadir">
  <div class="container py-4">
    <div class="row align-items-center">
      <div class="col-lg-6 mb-5 mb-lg-0" data-aos="fade-right">
        <div class="agadir-img-wrap">
          <img src="https://images.unsplash.com/photo-1541339907198-e08756dedf3f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80" alt="ENSA Agadir campus">
          <div class="agadir-badge"><strong>1999</strong><span>Year of creation</span></div>
        </div>
      </div>
      <div class="col-lg-6" data-aos="fade-left">
        <div class="section-eyebrow">ENSA Agadir</div>
        <h2 class="mb-3" style="font-weight:800;">The first engineering school of the region</h2>
        <p class="text-muted">The National School of Applied Sciences of Agadir (ENSA Agadir) is a public engineering school of Ibn Zohr University. Created in September 1999, it belongs to the national ENSA network and trains multidisciplinary state engineers.</p>
        <ul class="agadir-list">
          <li>5-year curriculum: 2 years of integrated preparatory cycle + 3 years of engineering cycle</li>
          <li>Computer Engineering</li>
          <li>Industrial Engineering</li>
          <li>Electrical Engineering</li>
          <li>Process, Energy &amp; Environment Engineering</li>
          <li>Student clubs and sports activities on campus</li>
        </ul>
        <a href="${pageContext.request.contextPath}/public/about.jsp#ensa-agadir" class="btn-ensa">Learn more</a>
      </div>
    </div>
  </div>
</section>

<!-- ================= COURSES ================= -->
<section class="py-5" id="courses-section">
  <div class="container py-4">
    <div class="section-head" data-aos="fade-up">
      <div class="section-eyebrow">What we teach</div>
      <h2>Our Courses</h2>
      <p>Explore our engineering, digital and creative courses and pick the path that fits your ambitions.</p>
    </div>

    <div class="filter-bar" data-aos="fade-up">
      <button type="button" class="filter-btn active" data-filter="all">All</button>
      <button type="button" class="filter-btn" data-filter="engineering">Engineering</button>
      <button type="button" class="filter-btn" data-filter="digital">Digital</button>
      <button type="button" class="filter-btn" data-filter="creative">Creative</button>
    </div>

    <div class="row">

      <!-- Photography -->
      <div class="col-lg-4 col-md-6 mb-4 course-item" data-cat="creative" data-aos="fade-up">
        <div class="course-card">
          <div class="course-img" style="background-image:url('https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80');"><span class="course-tag">Creative</span></div>
          <div class="course-body">
            <h4>Photography</h4>
            <p>Master the art of visual storytelling.</p>
            <div class="course-foot"><span class="course-meta">Beginner friendly</span><a href="#" class="btn-enroll">Enroll</a></div>
          </div>
        </div>
      </div>

      <!-- Programming -->
      <div class="col-lg-4 col-md-6 mb-4 course-item" data-cat="digital" data-aos="fade-up" data-aos-delay="100">
        <div class="course-card">
          <div class="course-img" style="background-image:url('https://images.unsplash.com/photo-1555066931-4365d14bab8c?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80');"><span class="course-tag">Digital</span></div>
          <div class="course-body">
            <h4>Programming</h4>
            <p>Learn to build software and applications.</p>
            <div class="course-foot"><span class="course-meta">All levels</span><a href="#" class="btn-enroll">Enroll</a></div>
          </div>
        </div>
      </div>

      <!-- Graphic Design -->
      <div class="col-lg-4 col-md-6 mb-4 course-item" data-cat="creative" data-aos="fade-up" data-aos-delay="200">
        <div class="course-card">
          <div class="course-img" style="background-image:url('https://images.unsplash.com/photo-1561070791-2526d30994b5?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80');"><span class="course-tag">Creative</span></div>
          <div class="course-body">
            <h4>Graphic Design</h4>
            <p>Create stunning visuals and interfaces.</p>
            <div class="course-foot"><span class="course-meta">Beginner friendly</span><a href="#" class="btn-enroll">Enroll</a></div>
          </div>
        </div>
      </div>

      <!-- Industrial Engineering -->
      <div class="col-lg-4 col-md-6 mb-4 course-item" data-cat="engineering" data-aos="fade-up">
        <div class="course-card">
          <div class="course-img" style="background-image:url('https://images.unsplash.com/photo-1581092160562-40aa08e78837?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80');"><span class="course-tag">Engineering</span></div>
          <div class="course-body">
            <h4>Industrial Engineering</h4>
            <p>Optimize production, logistics and supply chains for modern industry.</p>
            <div class="course-foot"><span class="course-meta">Engineering cycle</span><a href="#" class="btn-enroll">Enroll</a></div>
          </div>
        </div>
      </div>

      <!-- Electrical Engineering -->
      <div class="col-lg-4 col-md-6 mb-4 course-item" data-cat="engineering" data-aos="fade-up" data-aos-delay="100">
        <div class="course-card">
          <div class="course-img" style="background-image:url('https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80');"><span class="course-tag">Engineering</span></div>
          <div class="course-body">
            <h4>Electrical Engineering</h4>
            <p>Design electrical systems, automation and power networks.</p>
            <div class="course-foot"><span class="course-meta">Engineering cycle</span><a href="#" class="btn-enroll">Enroll</a></div>
          </div>
        </div>
      </div>

      <!-- Process, Energy & Environment -->
      <div class="col-lg-4 col-md-6 mb-4 course-item" data-cat="engineering" data-aos="fade-up" data-aos-delay="200">
        <div class="course-card">
          <div class="course-img" style="background-image:url('https://images.unsplash.com/photo-1509391366360-2e959784a276?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80');"><span class="course-tag">Engineering</span></div>
          <div class="course-body">
            <h4>Process, Energy &amp; Environment</h4>
            <p>Work on renewable energy, clean processes and sustainable solutions.</p>
            <div class="course-foot"><span class="course-meta">Engineering cycle</span><a href="#" class="btn-enroll">Enroll</a></div>
          </div>
        </div>
      </div>

      <!-- Data Science & AI -->
      <div class="col-lg-4 col-md-6 mb-4 course-item" data-cat="digital" data-aos="fade-up">
        <div class="course-card">
          <div class="course-img" style="background-image:url('https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80');"><span class="course-tag">Digital</span></div>
          <div class="course-body">
            <h4>Data Science &amp; AI</h4>
            <p>Analyze data and build intelligent models with machine learning.</p>
            <div class="course-foot"><span class="course-meta">Intermediate</span><a href="#" class="btn-enroll">Enroll</a></div>
          </div>
        </div>
      </div>

      <!-- Cybersecurity -->
      <div class="col-lg-4 col-md-6 mb-4 course-item" data-cat="digital" data-aos="fade-up" data-aos-delay="100">
        <div class="course-card">
          <div class="course-img" style="background-image:url('https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80');"><span class="course-tag">Digital</span></div>
          <div class="course-body">
            <h4>Cybersecurity</h4>
            <p>Protect networks, systems and data against modern threats.</p>
            <div class="course-foot"><span class="course-meta">Intermediate</span><a href="#" class="btn-enroll">Enroll</a></div>
          </div>
        </div>
      </div>

      <!-- Embedded Systems & IoT -->
      <div class="col-lg-4 col-md-6 mb-4 course-item" data-cat="engineering" data-aos="fade-up" data-aos-delay="200">
        <div class="course-card">
          <div class="course-img" style="background-image:url('https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80');"><span class="course-tag">Engineering</span></div>
          <div class="course-body">
            <h4>Embedded Systems &amp; IoT</h4>
            <p>Program microcontrollers and connect smart devices.</p>
            <div class="course-foot"><span class="course-meta">Intermediate</span><a href="#" class="btn-enroll">Enroll</a></div>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>

<!-- ================= CTA ================= -->
<section class="cta-section">
  <div class="container">
    <h2 class="mb-3" data-aos="fade-up">Ready to Start Your Educational Journey?</h2>
    <p class="mb-4" data-aos="fade-up" data-aos-delay="100">Take the first step toward a career in engineering.</p>
    <a href="${pageContext.request.contextPath}/public/contact.jsp" class="btn-ensa" data-aos="fade-up" data-aos-delay="200">Contact Us</a>
  </div>
</section>

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
          <li><a href="#ensa-agadir">ENSA Agadir</a></li>
          <li><a href="#courses-section">Courses</a></li>
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
  if (typeof AOS !== 'undefined') { AOS.init({ duration: 700, once: true }); }

  // Filtre des cours
  (function () {
    var buttons = document.querySelectorAll('.filter-btn');
    var items = document.querySelectorAll('.course-item');
    buttons.forEach(function (btn) {
      btn.addEventListener('click', function () {
        buttons.forEach(function (b) { b.classList.remove('active'); });
        btn.classList.add('active');
        var f = btn.getAttribute('data-filter');
        items.forEach(function (it) {
          if (f === 'all' || it.getAttribute('data-cat') === f) { it.classList.remove('hide'); }
          else { it.classList.add('hide'); }
        });
      });
    });
  })();
</script>
</body>
</html>