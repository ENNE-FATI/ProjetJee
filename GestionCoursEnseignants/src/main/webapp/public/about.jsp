<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>About Us - ENSA</title>
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
      background-color: #fff !important; box-shadow: 0 2px 12px rgba(0,0,0,.08);
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
      padding: 9px 22px !important; margin-left: 14px; border-radius: 30px; transition: .25s; display: inline-block;
    }
    .btn-login:hover { background: var(--y-h); text-decoration: none; transform: translateY(-2px); }

    .btn-ensa {
      background: var(--y); color: var(--d); font-weight: 700; border: 2px solid var(--y);
      border-radius: 30px; padding: 13px 34px; transition: .25s; display: inline-block;
    }
    .btn-ensa:hover { background: var(--y-h); border-color: var(--y-h); color: var(--d); text-decoration: none; transform: translateY(-3px); box-shadow: 0 10px 22px rgba(255,188,59,.35); }

    /* --- PAGE TITLE --- */
    .page-title-section {
      position: relative;
      background: url('https://images.unsplash.com/photo-1541339907198-e08756dedf3f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') center/cover no-repeat, #222;
      padding: 130px 0 !important; display: flex; align-items: center;
    }
    .page-title-section::before {
      content: ""; position: absolute; inset: 0;
      background: linear-gradient(120deg, rgba(18,59,45,.93) 0%, rgba(0,0,0,.55) 100%); z-index: 1;
    }
    .page-title-section .container { position: relative; z-index: 2; }
    .page-title-section h1 { color: #fff; font-weight: 800; font-size: 3rem; margin-bottom: 10px; }
    .page-title-section h1 span { color: var(--y); }
    .page-title-section p { color: rgba(255,255,255,.88); font-size: 1.1rem; margin: 0; }
    .crumbs { color: rgba(255,255,255,.75); font-size: .85rem; font-weight: 600; margin-bottom: 14px; letter-spacing: 1px; text-transform: uppercase; }
    .crumbs a { color: var(--y); text-decoration: none; }

    /* --- SECTION HEAD --- */
    .section-eyebrow { color: var(--y-h); font-weight: 700; font-size: .8rem; letter-spacing: 2px; text-transform: uppercase; }
    .section-head { text-align: center; margin-bottom: 50px; }
    .section-head h2 { font-weight: 800; margin-top: 8px; }
    .section-head h2::after { content: ""; display: block; width: 60px; height: 4px; background: var(--y); border-radius: 4px; margin: 14px auto 0; }
    .section-head p { color: var(--muted); max-width: 620px; margin: 14px auto 0; }

    /* --- STORY --- */
    .about-img-page {
      width: 100%; height: 440px; object-fit: cover; border-radius: 20px;
      box-shadow: 0 15px 40px rgba(0,0,0,.15);
    }
    .story-text p { color: #555; line-height: 1.8; }
    .story-text .lead { color: var(--d); font-weight: 600; }

    /* --- STATS --- */
    .stats-card { background: #fff; border-radius: 20px; box-shadow: 0 15px 40px rgba(0,0,0,.08); padding: 28px 15px; margin-top: -60px; position: relative; z-index: 5; }
    .stat-item { text-align: center; padding: 10px; border-right: 1px solid var(--line); }
    .stats-card .col-md-3:last-child .stat-item { border-right: 0; }
    .stat-number { font-size: 2.2rem; font-weight: 800; color: var(--g); line-height: 1; }
    .stat-number span { color: var(--y); }
    .stat-label { color: var(--muted); font-size: .85rem; font-weight: 600; margin-top: 8px; text-transform: uppercase; letter-spacing: 1px; }

    /* --- TIMELINE --- */
    .timeline { position: relative; max-width: 760px; margin: 0 auto; padding-left: 40px; }
    .timeline::before { content: ""; position: absolute; left: 14px; top: 6px; bottom: 6px; width: 3px; background: linear-gradient(var(--y), var(--g)); border-radius: 3px; }
    .tl-item { position: relative; background: #fff; border: 1px solid var(--line); border-radius: 16px; padding: 22px 26px; margin-bottom: 26px; transition: .3s; }
    .tl-item:hover { box-shadow: 0 12px 30px rgba(0,0,0,.08); border-color: var(--y); }
    .tl-item::before { content: ""; position: absolute; left: -35px; top: 28px; width: 18px; height: 18px; background: var(--y); border: 4px solid #fff; border-radius: 50%; box-shadow: 0 0 0 2px var(--y); }
    .tl-year { display: inline-block; background: var(--g); color: #fff; font-weight: 800; font-size: .8rem; letter-spacing: 1px; padding: 4px 14px; border-radius: 20px; margin-bottom: 10px; }
    .tl-item h5 { font-weight: 700; margin-bottom: 6px; }
    .tl-item p { color: var(--muted); margin: 0; font-size: .93rem; }

    /* --- AGADIR --- */
    .agadir-section { background: #fff; }
    .info-card { background: #f8f9fb; border: 1px solid var(--line); border-radius: 16px; padding: 22px; height: 100%; display: flex; align-items: flex-start; gap: 16px; transition: .3s; }
    .info-card:hover { border-color: var(--y); transform: translateY(-4px); box-shadow: 0 10px 25px rgba(0,0,0,.07); }
    .info-icon { width: 48px; height: 48px; flex-shrink: 0; border-radius: 12px; background: rgba(255,188,59,.2); color: var(--y-h); font-size: 1.3rem; display: flex; align-items: center; justify-content: center; }
    .info-label { font-size: .72rem; text-transform: uppercase; letter-spacing: 1px; color: #8a94a0; font-weight: 700; }
    .info-value { font-weight: 700; color: var(--d); }

    .track-card { background: #fff; border: 1px solid var(--line); border-radius: 16px; padding: 26px 22px; text-align: center; height: 100%; transition: .3s; }
    .track-card:hover { transform: translateY(-6px); box-shadow: 0 14px 32px rgba(0,0,0,.09); border-color: var(--y); }
    .track-icon { width: 64px; height: 64px; border-radius: 50%; margin: 0 auto 16px; background: var(--g); color: var(--y); font-size: 1.6rem; display: flex; align-items: center; justify-content: center; }
    .track-card h5 { font-weight: 700; font-size: 1.02rem; }
    .track-card p { color: var(--muted); font-size: .88rem; margin: 0; }

    /* --- VALUES --- */
    .value-card { background: #fff; border: 1px solid var(--line); border-radius: 18px; padding: 32px 24px; text-align: center; height: 100%; transition: .3s; }
    .value-card:hover { transform: translateY(-8px); box-shadow: 0 15px 35px rgba(0,0,0,.09); border-color: var(--y); }
    .value-icon { width: 70px; height: 70px; border-radius: 50%; margin: 0 auto 18px; background: rgba(255,188,59,.16); color: var(--y-h); font-size: 1.8rem; display: flex; align-items: center; justify-content: center; }
    .value-card h5 { font-weight: 700; }
    .value-card p { color: var(--muted); font-size: .92rem; margin: 0; }

    /* --- CTA --- */
    .cta-section { background: linear-gradient(120deg, var(--g) 0%, var(--g-dark) 100%); text-align: center; padding: 75px 0; position: relative; overflow: hidden; }
    .cta-section::before { content: ""; position: absolute; width: 360px; height: 360px; border-radius: 50%; background: rgba(255,188,59,.09); top: -130px; right: -80px; }
    .cta-section h2 { color: #fff; font-weight: 800; position: relative; }
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
      .page-title-section h1 { font-size: 2.1rem; }
      .stat-item { border-right: 0; border-bottom: 1px solid var(--line); }
      .about-img-page { height: 300px; }
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
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/public/about.jsp">About Us</a></li>
            <li class="nav-item"><a class="nav-link" href="#ensa-agadir">ENSA Agadir</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/index.jsp#courses-section">Courses</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/public/contact.jsp">Contact</a></li>
            <li class="nav-item"><a class="btn-login" href="${pageContext.request.contextPath}/public/login.jsp">Login</a></li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</header>

<!-- ================= PAGE TITLE ================= -->
<section class="page-title-section">
  <div class="container">
    <div class="row">
      <div class="col-md-9">
        <div class="crumbs"><a href="${pageContext.request.contextPath}/public/index.jsp">Home</a> / About Us</div>
        <h1 data-aos="fade-up">About <span>ENSA</span></h1>
        <p data-aos="fade-up" data-aos-delay="100">Our history, mission, and values.</p>
      </div>
    </div>
  </div>
</section>

<!-- ================= OUR STORY ================= -->
<section class="py-5">
  <div class="container py-4">
    <div class="row align-items-center">
      <div class="col-lg-6 mb-4 mb-lg-0" data-aos="fade-right">
        <img class="about-img-page" src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80" alt="ENSA students">
      </div>
      <div class="col-lg-6 story-text" data-aos="fade-left">
        <div class="section-eyebrow">Our Story</div>
        <h2 class="mb-3" style="font-weight:800;">Training the engineers of tomorrow</h2>
        <p class="lead">ENSA (National School of Applied Sciences) is a higher education institution dedicated to training high-level engineers.</p>
        <p>The ENSA network is a group of Moroccan public engineering schools. The first one opened in Tangier in 1997, and the network has grown across the country since then. All ENSA schools share the same model: an integrated preparatory cycle followed by an engineering cycle.</p>
        <p>We are committed to an education of excellence that combines theory and practice. Our programs are designed to meet current and future technological and industrial challenges, with a strong focus on innovation, applied research and openness to the world.</p>
      </div>
    </div>
  </div>
</section>

<!-- ================= STATS ================= -->
<section>
  <div class="container">
    <div class="stats-card" data-aos="fade-up">
      <div class="row no-gutters">
        <div class="col-6 col-md-3"><div class="stat-item"><div class="stat-number">1997</div><div class="stat-label">First ENSA opened</div></div></div>
        <div class="col-6 col-md-3"><div class="stat-item"><div class="stat-number">1999</div><div class="stat-label">ENSA Agadir created</div></div></div>
        <div class="col-6 col-md-3"><div class="stat-item"><div class="stat-number">1500<span>+</span></div><div class="stat-label">Students in Agadir</div></div></div>
        <div class="col-6 col-md-3"><div class="stat-item"><div class="stat-number">5<span> yrs</span></div><div class="stat-label">Integrated curriculum</div></div></div>
      </div>
    </div>
  </div>
</section>

<!-- ================= TIMELINE ================= -->
<section class="py-5 mt-4">
  <div class="container py-4">
    <div class="section-head" data-aos="fade-up">
      <div class="section-eyebrow">History</div>
      <h2>Key Milestones</h2>
      <p>From the first ENSA to a national network of engineering schools.</p>
    </div>
    <div class="timeline">
      <div class="tl-item" data-aos="fade-up">
        <span class="tl-year">1997</span>
        <h5>The first ENSA opens in Tangier</h5>
        <p>The National School of Applied Sciences of Tangier is created and becomes the starting point of the ENSA network.</p>
      </div>
      <div class="tl-item" data-aos="fade-up">
        <span class="tl-year">SEPTEMBER 1999</span>
        <h5>ENSA Agadir is created</h5>
        <p>Ibn Zohr University opens ENSA Agadir, the first engineering school of the region.</p>
      </div>
      <div class="tl-item" data-aos="fade-up">
        <span class="tl-year">TODAY</span>
        <h5>A growing engineering school</h5>
        <p>ENSA Agadir welcomes more than 1,500 students across several engineering tracks, with active student clubs and sports teams.</p>
      </div>
    </div>
  </div>
</section>

<!-- ================= ENSA AGADIR ================= -->
<section class="agadir-section py-5" id="ensa-agadir">
  <div class="container py-4">
    <div class="section-head" data-aos="fade-up">
      <div class="section-eyebrow">Our School</div>
      <h2>ENSA Agadir</h2>
      <p>A public engineering school of Ibn Zohr University, training multidisciplinary state engineers in Agadir, Morocco.</p>
    </div>

    <div class="row mb-5">
      <div class="col-md-6 col-lg-3 mb-3" data-aos="fade-up">
        <div class="info-card"><div class="info-icon"><i class="ti-calendar"></i></div><div><div class="info-label">Created</div><div class="info-value">September 1999</div></div></div>
      </div>
      <div class="col-md-6 col-lg-3 mb-3" data-aos="fade-up" data-aos-delay="100">
        <div class="info-card"><div class="info-icon"><i class="ti-home"></i></div><div><div class="info-label">University</div><div class="info-value">Ibn Zohr University</div></div></div>
      </div>
      <div class="col-md-6 col-lg-3 mb-3" data-aos="fade-up" data-aos-delay="200">
        <div class="info-card"><div class="info-icon"><i class="ti-user"></i></div><div><div class="info-label">Students</div><div class="info-value">1,500+</div></div></div>
      </div>
      <div class="col-md-6 col-lg-3 mb-3" data-aos="fade-up" data-aos-delay="300">
        <div class="info-card"><div class="info-icon"><i class="ti-location-pin"></i></div><div><div class="info-label">Address</div><div class="info-value">Avenue Tamsoult, B.P. 1136, Agadir</div></div></div>
      </div>
    </div>

    <div class="text-center mb-4" data-aos="fade-up">
      <div class="section-eyebrow">Engineering cycle</div>
      <h4 class="mt-2" style="font-weight:800;">Our engineering tracks</h4>
      <p class="text-muted">2 years of integrated preparatory cycle, then 3 years in one of the tracks below.</p>
    </div>
    <div class="row">
      <div class="col-md-6 col-lg-3 mb-4" data-aos="fade-up">
        <div class="track-card"><div class="track-icon"><i class="ti-desktop"></i></div><h5>Computer Engineering</h5><p>Software, networks, data and intelligent systems.</p></div>
      </div>
      <div class="col-md-6 col-lg-3 mb-4" data-aos="fade-up" data-aos-delay="100">
        <div class="track-card"><div class="track-icon"><i class="ti-settings"></i></div><h5>Industrial Engineering</h5><p>Production, logistics and quality management.</p></div>
      </div>
      <div class="col-md-6 col-lg-3 mb-4" data-aos="fade-up" data-aos-delay="200">
        <div class="track-card"><div class="track-icon"><i class="ti-bolt"></i></div><h5>Electrical Engineering</h5><p>Electrical systems, electronics and automation.</p></div>
      </div>
      <div class="col-md-6 col-lg-3 mb-4" data-aos="fade-up" data-aos-delay="300">
        <div class="track-card"><div class="track-icon"><i class="ti-world"></i></div><h5>Process, Energy &amp; Environment</h5><p>Clean processes, energy efficiency and sustainability.</p></div>
      </div>
    </div>
  </div>
</section>

<!-- ================= VALUES ================= -->
<section class="py-5">
  <div class="container py-4">
    <div class="section-head" data-aos="fade-up">
      <div class="section-eyebrow">What drives us</div>
      <h2>Our Values</h2>
    </div>
    <div class="row">
      <div class="col-md-4 mb-4" data-aos="fade-up">
        <div class="value-card"><div class="value-icon"><i class="ti-medall"></i></div><h5>Excellence</h5><p>A demanding education that combines solid theory with hands-on practice.</p></div>
      </div>
      <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="100">
        <div class="value-card"><div class="value-icon"><i class="ti-light-bulb"></i></div><h5>Innovation</h5><p>Applied research and modern infrastructure to prepare students for new challenges.</p></div>
      </div>
      <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="200">
        <div class="value-card"><div class="value-icon"><i class="ti-world"></i></div><h5>Openness</h5><p>Strong ties with industry and the world, so graduates become tomorrow's leaders.</p></div>
      </div>
    </div>
  </div>
</section>

<!-- ================= CTA ================= -->
<section class="cta-section">
  <div class="container">
    <h2 class="mb-4" data-aos="fade-up">Join the ENSA community</h2>
    <a href="${pageContext.request.contextPath}/public/contact.jsp" class="btn-ensa" data-aos="fade-up" data-aos-delay="100">Contact Us</a>
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
  if (typeof AOS !== 'undefined') { AOS.init({ duration: 700, once: true }); }
</script>
</body>
</html>