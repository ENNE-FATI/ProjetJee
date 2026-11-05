<!DOCTYPE html>
<html lang="en">
<head>
    <script>document.documentElement.classList.add('js');(function(){try{var d=document.documentElement,t=localStorage.getItem('gradebook-theme');if(!t&&window.matchMedia&&window.matchMedia('(prefers-color-scheme: dark)').matches)t='dark';d.setAttribute('data-bs-theme',t==='dark'?'dark':'light');if(localStorage.getItem('gradebook-sidebar')==='collapsed')d.classList.add('sidebar-collapsed')}catch(e){}})();</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Classes — Gradebook Teacher Dashboard</title>
    <meta name="description" content="Every class Mr. Reyes teaches, with year group, student count, class average, trend and next lesson.">
    <meta name="theme-color" content="#173d2d">
    <link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='8' fill='%23c2603c'/%3E%3Cpath d='M6 10.5c2.6-1.1 6-1 10 .9 4-1.9 7.4-2 10-.9v12.6c-2.6-1.1-6-1-10 .9-4-1.9-7.4-2-10-.9Z' fill='none' stroke='%23fbf6ea' stroke-width='2' stroke-linejoin='round'/%3E%3C/svg%3E">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,600;1,6..72,400;1,6..72,500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/style.css?v=20261103.1">
</head>
<body class="page-classes">
<a class="skip-link" href="#main">Skip to main content</a>

<div class="app">
    <aside class="sidebar offcanvas-lg offcanvas-start" id="sidebar" tabindex="-1" aria-label="Sidebar">
        <div class="sidebar-head">
            <a class="brand" href="${pageContext.request.contextPath}/enseignant/index.jsp" aria-label="Gradebook, Harbourview Academy teacher portal — dashboard">
                <span class="brand-mark" aria-hidden="true"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M2 5.5C4.8 4.3 8.6 4.4 12 6.3c3.4-1.9 7.2-2 10-.8V19c-2.8-1.2-6.6-1.1-10 .8-3.4-1.9-7.2-2-10-.8Z"/><path d="M12 6.3v13.5"/></svg></span>
                <span class="brand-text">
            <span class="brand-name">Gradebook</span>
            <span class="brand-sub">Harbourview Academy</span>
          </span>
            </a>
            <button type="button" class="icon-btn sidebar-close d-lg-none js-only" data-bs-dismiss="offcanvas" data-bs-target="#sidebar" aria-label="Close menu"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M18 6 6 18M6 6l12 12"/></svg></button>
        </div>

        <nav class="sidebar-nav" aria-label="Main">
            <p class="side-heading">Teaching</p>
            <ul class="side-list">
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/index.jsp" data-tip="Dashboard"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="7" height="9" rx="1.5"/><rect x="14" y="3" width="7" height="5" rx="1.5"/><rect x="14" y="12" width="7" height="9" rx="1.5"/><rect x="3" y="16" width="7" height="5" rx="1.5"/></svg><span class="side-label">Dashboard</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/classes.jsp" aria-current="page" data-tip="Classes"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg><span class="side-label">Classes</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp" data-tip="Gradebook"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg><span class="side-label">Gradebook</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/assignments.jsp" data-tip="Assignments"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="8" y="2" width="8" height="4" rx="1"/><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><path d="m9 14 2 2 4-4"/></svg><span class="side-label">Assignments</span><span class="side-count">38<span class="visually-hidden"> scripts to mark</span></span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp" data-tip="Lesson plans"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/></svg><span class="side-label">Lesson plans</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/reports.jsp" data-tip="Reports"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg><span class="side-label">Reports</span></a></li>
            </ul>
            <p class="side-heading">Shortcuts</p>
            <ul class="side-list">
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/index.jsp#attendance" data-tip="Take register"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="m16 11 2 2 4-4"/></svg><span class="side-label">Take register</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/index.jsp#marking" data-tip="Marking queue"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M22 12h-6l-2 3h-4l-2-3H2"/><path d="M5.45 5.11 2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11Z"/></svg><span class="side-label">Marking queue</span></a></li>
            </ul>
        </nav>

        <div class="sidebar-foot">
            <div class="term-card">
                <p class="term-card-label"><span data-term-label>Autumn term</span> <span class="term-card-week">Week 4 of 15</span></p>
                <div class="term-track" role="img" aria-label="Term progress: week 4 of 15"><span style="width:27%"></span></div>
                <p class="term-card-note">Half term starts Mon 26 Oct</p>
            </div>
            <div class="side-profile">
                <span class="avatar avatar-me" aria-hidden="true">DR</span>
                <span class="side-profile-text"><span class="side-profile-name">Mr. Daniel Reyes</span><span class="side-profile-role">Science · Head of Chemistry</span></span>
            </div>
        </div>
    </aside>

    <div class="app-main">
        <header class="topbar">
            <button type="button" class="icon-btn d-lg-none js-only" data-bs-toggle="offcanvas" data-bs-target="#sidebar" aria-controls="sidebar" aria-label="Open menu"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M4 6h16M4 12h16M4 18h16"/></svg></button>
            <button type="button" class="icon-btn d-none d-lg-inline-flex js-only" id="sidebar-collapse" aria-controls="sidebar" aria-expanded="true" aria-label="Collapse sidebar"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M9 3v18"/><path d="m16 15-3-3 3-3"/></svg></button>

            <form class="topbar-search d-none d-md-flex js-only" role="search" action="${pageContext.request.contextPath}/enseignant/gradebook.jsp" id="global-search-form">
                <label class="visually-hidden" for="global-search">Search students, classes and pages</label>
                <svg class="ic search-ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="11" cy="11" r="7"/><path d="m21 21-4.3-4.3"/></svg>
                <input type="search" id="global-search" name="student" placeholder="Search students, classes…" autocomplete="off" role="combobox" aria-expanded="false" aria-controls="search-results" aria-autocomplete="list">
                <kbd class="search-kbd" aria-hidden="true">/</kbd>
                <ul class="search-results" id="search-results" role="listbox" aria-label="Search suggestions" hidden></ul>
            </form>

            <div class="topbar-end">
                <div class="term-select js-only">
                    <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18"/></svg>
                    <label class="visually-hidden" for="term-select">Term</label>
                    <select id="term-select" class="form-select">
                        <option value="autumn" selected>Autumn term</option>
                        <option value="summer">Summer term</option>
                        <option value="spring">Spring term</option>
                    </select>
                </div>

                <button type="button" class="icon-btn theme-toggle js-only" id="theme-toggle" aria-label="Switch to dark theme">
                    <span class="theme-ic-light"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z"/></svg></span><span class="theme-ic-dark"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41 1.41"/></svg></span>
                </button>

                <div class="dropdown js-only">
                    <button type="button" class="icon-btn has-dot" id="notify-btn" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false" aria-label="Notifications, 3 unread"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"/><path d="M10.3 21a1.94 1.94 0 0 0 3.4 0"/></svg><span class="dot" aria-hidden="true"></span></button>
                    <div class="dropdown-menu dropdown-menu-end notify-menu" aria-labelledby="notify-btn">
                        <div class="notify-head"><span class="notify-title">Notifications</span><button type="button" class="link-btn" id="notify-clear">Mark all read</button></div>
                        <ul class="notify-list">
                            <li class="is-unread"><span class="notify-ic tone-accent"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg></span><span><strong>Jonah Whitaker</strong> handed in <em>Rates of reaction write-up</em> a day late.<span class="notify-time">2 hours ago</span></span></li>
                            <li class="is-unread"><span class="notify-ic"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8Z"/><path d="M14 2v6h6M16 13H8M16 17H8M10 9H8"/></svg></span><span><strong>Ms. Anika Patel</strong> shared <em>Year 11 mock exam timetable</em> with the Science team.<span class="notify-time">This morning</span></span></li>
                            <li class="is-unread"><span class="notify-ic"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18"/></svg></span><span>Year 11 parents’ evening starts at <strong>16:30</strong> in the main hall. 9 appointments booked.<span class="notify-time">Reminder</span></span></li>
                        </ul>
                    </div>
                </div>

                <div class="dropdown d-none d-sm-block js-only">
                    <button type="button" class="avatar-btn" data-bs-toggle="dropdown" aria-expanded="false" aria-label="Account menu for Mr. Daniel Reyes"><span class="avatar avatar-me" aria-hidden="true">DR</span></button>
                    <ul class="dropdown-menu dropdown-menu-end account-menu">
                        <li class="account-head"><span class="account-name">Mr. Daniel Reyes</span><span class="account-mail">d.reyes@example.com</span></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/enseignant/classes.jsp"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>My classes</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/enseignant/reports.jsp"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg>Reports</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4M16 17l5-5-5-5M21 12H9"/></svg>Sign out</a></li>
                    </ul>
                </div>
            </div>
        </header>

        <div class="term-banner" id="term-banner" role="status" hidden>
            <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 16v-4M12 8h.01"/></svg>
            <p>You are viewing the <strong data-term-label>Summer term</strong>, which is archived. Marks are read-only.</p>
            <button type="button" class="btn btn-sm btn-quiet" id="term-reset">Back to Autumn term</button>
        </div>

        <main id="main" class="page" tabindex="-1">
            <section class="page-head" aria-labelledby="page-title">
                <div class="page-head-text">
                    <p class="eyebrow"><span data-term-label>Autumn term</span> · 7 classes · 158 students</p>
                    <h1 id="page-title">Your classes</h1>
                    <p class="lede">Every group you teach this year, from Year 7 Science to A level Chemistry. Averages come straight from the gradebook.</p>
                </div>
                <div class="page-head-actions">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg>Open gradebook</a>
                </div>
            </section>

            <div class="toolbar" role="group" aria-label="Filter and sort classes">
                <div class="seg" role="group" aria-label="Key stage">
                    <button type="button" class="seg-btn" data-filter="all" aria-pressed="true">All <span>7</span></button>
                    <button type="button" class="seg-btn" data-filter="ks3" aria-pressed="false">Key Stage 3 <span>3</span></button>
                    <button type="button" class="seg-btn" data-filter="gcse" aria-pressed="false">GCSE <span>2</span></button>
                    <button type="button" class="seg-btn" data-filter="alevel" aria-pressed="false">A level <span>2</span></button>
                </div>
                <div class="toolbar-field">
                    <label for="class-sort">Sort by</label>
                    <select id="class-sort" class="form-select form-select-sm">
                        <option value="order">Year group</option>
                        <option value="avg-desc">Average, highest first</option>
                        <option value="avg-asc">Average, lowest first</option>
                        <option value="size">Class size</option>
                    </select>
                </div>
                <p class="toolbar-status visually-hidden" id="class-status" aria-live="polite"></p>
            </div>

            <ul class="class-grid" id="class-grid">
                <li class="class-col" data-code="7H" data-stage="ks3" data-order="0" data-avg="73.7" data-size="28">
                    <article class="class-card" aria-labelledby="cls-7H">
                        <div class="class-cover cover-sci">
                            <span class="class-code" aria-hidden="true">7H</span>
                            <span class="class-stage">Key Stage 3</span>
                            <svg class="cover-art" viewBox="0 0 200 120" aria-hidden="true" focusable="false"><g fill="none" stroke="currentColor" stroke-width="1.2"><circle cx="160" cy="58" r="34"/><circle cx="160" cy="58" r="22" opacity=".7"/><ellipse cx="160" cy="58" rx="46" ry="14" transform="rotate(-25 160 58)"/><ellipse cx="160" cy="58" rx="46" ry="14" transform="rotate(35 160 58)" opacity=".7"/></g><circle cx="160" cy="58" r="4" fill="currentColor"/></svg>
                        </div>
                        <div class="class-body">
                            <h2 class="class-title" id="cls-7H"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=7H">7H Science</a></h2>
                            <p class="class-course">Year 7 · Key Stage 3</p>
                            <dl class="class-facts">
                                <div><dt>Students</dt><dd>28</dd></div>
                                <div><dt>Room</dt><dd>Lab 1</dd></div>
                                <div><dt>Target</dt><dd>75%</dd></div>
                            </dl>
                            <div class="class-avg">
                                <div>
                                    <p class="class-avg-label">Class average</p>
                                    <p class="class-avg-value">73.7<small>%</small></p>
                                    <p class="class-avg-diff is-down">−1.3 pts vs target</p>
                                </div>
                                <svg class="spark" viewBox="0 0 120 34" width="120" height="34" role="img" aria-label="Assessment averages this term: 79%, 77%, 70%, 72%, 74%, 72%"><path d="M4.0 11.6 L26.4 13.5 L48.8 22.4 L71.2 19.6 L93.6 17.6 L116.0 20.1" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><circle cx="116.0" cy="20.1" r="4"/></svg>
                            </div>
                            <p class="class-next"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg><span><span class="class-next-when">Fri 25 Sep · P2 09:50</span><span class="class-next-topic">Separating mixtures: distillation</span></span></p>
                        </div>
                        <div class="class-actions">
                            <a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=7H"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg>Gradebook</a>
                            <a href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp?class=7H"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/></svg>Plans</a>
                            <a href="${pageContext.request.contextPath}/enseignant/reports.jsp?class=7H"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg>Report</a>
                        </div>
                    </article>
                </li>
                <li class="class-col" data-code="8K" data-stage="ks3" data-order="1" data-avg="65.7" data-size="30">
                    <article class="class-card" aria-labelledby="cls-8K">
                        <div class="class-cover cover-sci">
                            <span class="class-code" aria-hidden="true">8K</span>
                            <span class="class-stage">Key Stage 3</span>
                            <svg class="cover-art" viewBox="0 0 200 120" aria-hidden="true" focusable="false"><g fill="none" stroke="currentColor" stroke-width="1.2"><circle cx="160" cy="58" r="34"/><circle cx="160" cy="58" r="22" opacity=".7"/><ellipse cx="160" cy="58" rx="46" ry="14" transform="rotate(-25 160 58)"/><ellipse cx="160" cy="58" rx="46" ry="14" transform="rotate(35 160 58)" opacity=".7"/></g><circle cx="160" cy="58" r="4" fill="currentColor"/></svg>
                        </div>
                        <div class="class-body">
                            <h2 class="class-title" id="cls-8K"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=8K">8K Science</a></h2>
                            <p class="class-course">Year 8 · Key Stage 3</p>
                            <dl class="class-facts">
                                <div><dt>Students</dt><dd>30</dd></div>
                                <div><dt>Room</dt><dd>Lab 3</dd></div>
                                <div><dt>Target</dt><dd>68%</dd></div>
                            </dl>
                            <div class="class-avg">
                                <div>
                                    <p class="class-avg-label">Class average</p>
                                    <p class="class-avg-value">65.7<small>%</small></p>
                                    <p class="class-avg-diff is-down">−2.3 pts vs target</p>
                                </div>
                                <svg class="spark" viewBox="0 0 120 34" width="120" height="34" role="img" aria-label="Assessment averages this term: 64%, 69%, 64%, 67%, 63%, 69%"><path d="M4.0 19.6 L26.4 12.6 L48.8 19.4 L71.2 15.5 L93.6 21.4 L116.0 12.9" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><circle cx="116.0" cy="12.9" r="4"/></svg>
                            </div>
                            <p class="class-next"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg><span><span class="class-next-when">Mon 28 Sep · P3 11:10</span><span class="class-next-topic">Acids and alkalis: neutralisation</span></span></p>
                        </div>
                        <div class="class-actions">
                            <a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=8K"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg>Gradebook</a>
                            <a href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp?class=8K"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/></svg>Plans</a>
                            <a href="${pageContext.request.contextPath}/enseignant/reports.jsp?class=8K"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg>Report</a>
                        </div>
                    </article>
                </li>
                <li class="class-col" data-code="9R" data-stage="ks3" data-order="2" data-avg="71.6" data-size="27">
                    <article class="class-card" aria-labelledby="cls-9R">
                        <div class="class-cover cover-sci">
                            <span class="class-code" aria-hidden="true">9R</span>
                            <span class="class-stage">Key Stage 3</span>
                            <svg class="cover-art" viewBox="0 0 200 120" aria-hidden="true" focusable="false"><g fill="none" stroke="currentColor" stroke-width="1.2"><circle cx="160" cy="58" r="34"/><circle cx="160" cy="58" r="22" opacity=".7"/><ellipse cx="160" cy="58" rx="46" ry="14" transform="rotate(-25 160 58)"/><ellipse cx="160" cy="58" rx="46" ry="14" transform="rotate(35 160 58)" opacity=".7"/></g><circle cx="160" cy="58" r="4" fill="currentColor"/></svg>
                        </div>
                        <div class="class-body">
                            <h2 class="class-title" id="cls-9R"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=9R">9R Science</a></h2>
                            <p class="class-course">Year 9 · Key Stage 3</p>
                            <dl class="class-facts">
                                <div><dt>Students</dt><dd>27</dd></div>
                                <div><dt>Room</dt><dd>Lab 2</dd></div>
                                <div><dt>Target</dt><dd>72%</dd></div>
                            </dl>
                            <div class="class-avg">
                                <div>
                                    <p class="class-avg-label">Class average</p>
                                    <p class="class-avg-value">71.6<small>%</small></p>
                                    <p class="class-avg-diff is-down">−0.4 pts vs target</p>
                                </div>
                                <svg class="spark" viewBox="0 0 120 34" width="120" height="34" role="img" aria-label="Assessment averages this term: 69%, 78%, 72%, 71%, 71%, 70%"><path d="M4.0 22.6 L26.4 11.4 L48.8 18.9 L71.2 20.6 L93.6 20.2 L116.0 20.8" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><circle cx="116.0" cy="20.8" r="4"/></svg>
                            </div>
                            <p class="class-next"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg><span><span class="class-next-when">Fri 25 Sep · P4 13:00</span><span class="class-next-topic">Diffusion and osmosis</span></span></p>
                        </div>
                        <div class="class-actions">
                            <a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=9R"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg>Gradebook</a>
                            <a href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp?class=9R"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/></svg>Plans</a>
                            <a href="${pageContext.request.contextPath}/enseignant/reports.jsp?class=9R"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg>Report</a>
                        </div>
                    </article>
                </li>
                <li class="class-col" data-code="10B" data-stage="gcse" data-order="3" data-avg="70.3" data-size="24">
                    <article class="class-card" aria-labelledby="cls-10B">
                        <div class="class-cover cover-phys">
                            <span class="class-code" aria-hidden="true">10B</span>
                            <span class="class-stage">GCSE</span>
                            <svg class="cover-art" viewBox="0 0 200 120" aria-hidden="true" focusable="false"><g fill="none" stroke="currentColor" stroke-width="1.2"><path d="M90 40c10-18 20-18 30 0s20 18 30 0 20-18 30 0 20 18 30 0"/><path d="M90 64c10-18 20-18 30 0s20 18 30 0 20-18 30 0 20 18 30 0" opacity=".7"/><path d="M90 88c10-18 20-18 30 0s20 18 30 0 20-18 30 0 20 18 30 0" opacity=".45"/></g></svg>
                        </div>
                        <div class="class-body">
                            <h2 class="class-title" id="cls-10B"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=10B">10B Physics</a></h2>
                            <p class="class-course">Year 10 · GCSE Triple Science</p>
                            <dl class="class-facts">
                                <div><dt>Students</dt><dd>24</dd></div>
                                <div><dt>Room</dt><dd>Lab 4</dd></div>
                                <div><dt>Target</dt><dd>68%</dd></div>
                            </dl>
                            <div class="class-avg">
                                <div>
                                    <p class="class-avg-label">Class average</p>
                                    <p class="class-avg-value">70.3<small>%</small></p>
                                    <p class="class-avg-diff is-up">+2.3 pts vs target</p>
                                </div>
                                <svg class="spark" viewBox="0 0 120 34" width="120" height="34" role="img" aria-label="Assessment averages this term: 70%, 72%, 69%, 73%, 71%, 68%"><path d="M4.0 17.5 L26.4 13.8 L48.8 18.3 L71.2 13.2 L93.6 15.0 L116.0 20.8" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><circle cx="116.0" cy="20.8" r="4"/></svg>
                            </div>
                            <p class="class-next"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg><span><span class="class-next-when">Today · P3 11:10</span><span class="class-next-topic">Specific heat capacity practical</span></span></p>
                        </div>
                        <div class="class-actions">
                            <a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=10B"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg>Gradebook</a>
                            <a href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp?class=10B"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/></svg>Plans</a>
                            <a href="${pageContext.request.contextPath}/enseignant/reports.jsp?class=10B"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg>Report</a>
                        </div>
                    </article>
                </li>
                <li class="class-col" data-code="11B" data-stage="gcse" data-order="4" data-avg="74.4" data-size="24">
                    <article class="class-card" aria-labelledby="cls-11B">
                        <div class="class-cover cover-chem">
                            <span class="class-code" aria-hidden="true">11B</span>
                            <span class="class-stage">GCSE</span>
                            <svg class="cover-art" viewBox="0 0 200 120" aria-hidden="true" focusable="false"><g fill="none" stroke="currentColor" stroke-width="1.2"><path d="M130 20l17 10v20l-17 10-17-10V30z"/><path d="M147 50l17 10v20l-17 10-17-10V60z"/><path d="M164 20l17 10v20l-17 10-17-10V30z"/><path d="M181 50l17 10v20l-17 10-17-10V60z"/><path d="M130 80l17 10v20"/><path d="M164 80l17 10v20"/><path d="M147 50h0"/></g><g fill="currentColor"><circle cx="130" cy="20" r="2.4"/><circle cx="164" cy="60" r="2.4"/><circle cx="181" cy="50" r="2.4"/></g></svg>
                        </div>
                        <div class="class-body">
                            <h2 class="class-title" id="cls-11B"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=11B">11B Chemistry</a></h2>
                            <p class="class-course">Year 11 · GCSE Triple Science</p>
                            <dl class="class-facts">
                                <div><dt>Students</dt><dd>24</dd></div>
                                <div><dt>Room</dt><dd>Lab 2</dd></div>
                                <div><dt>Target</dt><dd>71%</dd></div>
                            </dl>
                            <div class="class-avg">
                                <div>
                                    <p class="class-avg-label">Class average</p>
                                    <p class="class-avg-value">74.4<small>%</small></p>
                                    <p class="class-avg-diff is-up">+3.4 pts vs target</p>
                                </div>
                                <svg class="spark" viewBox="0 0 120 34" width="120" height="34" role="img" aria-label="Assessment averages this term: 73%, 79%, 73%, 72%, 79%, 73%"><path d="M4.0 20.9 L26.4 12.3 L48.8 20.0 L71.2 21.7 L93.6 13.0 L116.0 20.8" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><circle cx="116.0" cy="20.8" r="4"/></svg>
                            </div>
                            <p class="class-next"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg><span><span class="class-next-when">Fri 25 Sep · P1 08:50</span><span class="class-next-topic">Rates of reaction: concentration</span></span></p>
                        </div>
                        <div class="class-actions">
                            <a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=11B"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg>Gradebook</a>
                            <a href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp?class=11B"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/></svg>Plans</a>
                            <a href="${pageContext.request.contextPath}/enseignant/reports.jsp?class=11B"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg>Report</a>
                        </div>
                    </article>
                </li>
                <li class="class-col" data-code="12C" data-stage="alevel" data-order="5" data-avg="65.4" data-size="14">
                    <article class="class-card" aria-labelledby="cls-12C">
                        <div class="class-cover cover-chem">
                            <span class="class-code" aria-hidden="true">12C</span>
                            <span class="class-stage">A level</span>
                            <svg class="cover-art" viewBox="0 0 200 120" aria-hidden="true" focusable="false"><g fill="none" stroke="currentColor" stroke-width="1.2"><path d="M130 20l17 10v20l-17 10-17-10V30z"/><path d="M147 50l17 10v20l-17 10-17-10V60z"/><path d="M164 20l17 10v20l-17 10-17-10V30z"/><path d="M181 50l17 10v20l-17 10-17-10V60z"/><path d="M130 80l17 10v20"/><path d="M164 80l17 10v20"/><path d="M147 50h0"/></g><g fill="currentColor"><circle cx="130" cy="20" r="2.4"/><circle cx="164" cy="60" r="2.4"/><circle cx="181" cy="50" r="2.4"/></g></svg>
                        </div>
                        <div class="class-body">
                            <h2 class="class-title" id="cls-12C"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=12C">12C Chemistry</a></h2>
                            <p class="class-course">Year 12 · A level</p>
                            <dl class="class-facts">
                                <div><dt>Students</dt><dd>14</dd></div>
                                <div><dt>Room</dt><dd>Lab 5</dd></div>
                                <div><dt>Target</dt><dd>64%</dd></div>
                            </dl>
                            <div class="class-avg">
                                <div>
                                    <p class="class-avg-label">Class average</p>
                                    <p class="class-avg-value">65.4<small>%</small></p>
                                    <p class="class-avg-diff is-up">+1.4 pts vs target</p>
                                </div>
                                <svg class="spark" viewBox="0 0 120 34" width="120" height="34" role="img" aria-label="Assessment averages this term: 65%, 62%, 64%, 70%, 63%, 71%"><path d="M4.0 18.9 L26.4 22.5 L48.8 20.6 L71.2 13.2 L93.6 21.7 L116.0 11.5" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><circle cx="116.0" cy="11.5" r="4"/></svg>
                            </div>
                            <p class="class-next"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg><span><span class="class-next-when">Today · P5 14:00</span><span class="class-next-topic">Born–Haber cycles</span></span></p>
                        </div>
                        <div class="class-actions">
                            <a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=12C"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg>Gradebook</a>
                            <a href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp?class=12C"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/></svg>Plans</a>
                            <a href="${pageContext.request.contextPath}/enseignant/reports.jsp?class=12C"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg>Report</a>
                        </div>
                    </article>
                </li>
                <li class="class-col" data-code="13C" data-stage="alevel" data-order="6" data-avg="69.8" data-size="11">
                    <article class="class-card" aria-labelledby="cls-13C">
                        <div class="class-cover cover-chem">
                            <span class="class-code" aria-hidden="true">13C</span>
                            <span class="class-stage">A level</span>
                            <svg class="cover-art" viewBox="0 0 200 120" aria-hidden="true" focusable="false"><g fill="none" stroke="currentColor" stroke-width="1.2"><path d="M130 20l17 10v20l-17 10-17-10V30z"/><path d="M147 50l17 10v20l-17 10-17-10V60z"/><path d="M164 20l17 10v20l-17 10-17-10V30z"/><path d="M181 50l17 10v20l-17 10-17-10V60z"/><path d="M130 80l17 10v20"/><path d="M164 80l17 10v20"/><path d="M147 50h0"/></g><g fill="currentColor"><circle cx="130" cy="20" r="2.4"/><circle cx="164" cy="60" r="2.4"/><circle cx="181" cy="50" r="2.4"/></g></svg>
                        </div>
                        <div class="class-body">
                            <h2 class="class-title" id="cls-13C"><a href="gradebook.jsp?class=13C">13C Chemistry</a></h2>
                            <p class="class-course">Year 13 · A level</p>
                            <dl class="class-facts">
                                <div><dt>Students</dt><dd>11</dd></div>
                                <div><dt>Room</dt><dd>Lab 5</dd></div>
                                <div><dt>Target</dt><dd>73%</dd></div>
                            </dl>
                            <div class="class-avg">
                                <div>
                                    <p class="class-avg-label">Class average</p>
                                    <p class="class-avg-value">69.8<small>%</small></p>
                                    <p class="class-avg-diff is-down">−3.2 pts vs target</p>
                                </div>
                                <svg class="spark" viewBox="0 0 120 34" width="120" height="34" role="img" aria-label="Assessment averages this term: 67%, 70%, 73%, 69%, 72%, 69%"><path d="M4.0 21.3 L26.4 17.0 L48.8 12.7 L71.2 18.4 L93.6 13.5 L116.0 18.2" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><circle cx="116.0" cy="18.2" r="4"/></svg>
                            </div>
                            <p class="class-next"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg><span><span class="class-next-when">Mon 28 Sep · P5 14:00</span><span class="class-next-topic">Electrode potentials</span></span></p>
                        </div>
                        <div class="class-actions">
                            <a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=13C"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg>Gradebook</a>
                            <a href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp?class=13C"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/></svg>Plans</a>
                            <a href="${pageContext.request.contextPath}/enseignant/reports.jsp?class=13C"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg>Report</a>
                        </div>
                    </article>
                </li>
                <li class="class-col class-col-note" data-stage="all" data-order="99" data-avg="-1" data-size="-1">
                    <section class="glance-card" aria-labelledby="glance-title">
                        <p class="card-eyebrow">Week 4 at a glance</p>
                        <h2 class="card-title" id="glance-title">21 lessons across 7 classes</h2>
                        <p class="glance-lede">Periods taught per class this week, out of 25 on the timetable. The other 4 are PPA and duty.</p>
                        <ul class="glance-list">
                            <li><span class="glance-name"><span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>7H</span> Science</span><span class="glance-bar" aria-hidden="true"><span></span><span></span><span></span></span><span class="glance-num">3<span class="visually-hidden"> lessons</span></span></li>
                            <li><span class="glance-name"><span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>8K</span> Science</span><span class="glance-bar" aria-hidden="true"><span></span><span></span></span><span class="glance-num">2<span class="visually-hidden"> lessons</span></span></li>
                            <li><span class="glance-name"><span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>9R</span> Science</span><span class="glance-bar" aria-hidden="true"><span></span><span></span><span></span></span><span class="glance-num">3<span class="visually-hidden"> lessons</span></span></li>
                            <li><span class="glance-name"><span class="chip chip-phys"><span class="chip-dot" aria-hidden="true"></span>10B</span> Physics</span><span class="glance-bar" aria-hidden="true"><span></span><span></span><span></span></span><span class="glance-num">3<span class="visually-hidden"> lessons</span></span></li>
                            <li><span class="glance-name"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>11B</span> Chemistry</span><span class="glance-bar" aria-hidden="true"><span></span><span></span><span></span><span></span></span><span class="glance-num">4<span class="visually-hidden"> lessons</span></span></li>
                            <li><span class="glance-name"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>12C</span> Chemistry</span><span class="glance-bar" aria-hidden="true"><span></span><span></span><span></span><span></span></span><span class="glance-num">4<span class="visually-hidden"> lessons</span></span></li>
                            <li><span class="glance-name"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>13C</span> Chemistry</span><span class="glance-bar" aria-hidden="true"><span></span><span></span></span><span class="glance-num">2<span class="visually-hidden"> lessons</span></span></li>
                        </ul>
                        <a class="link-more" href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp">Open lesson plans <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M5 12h14M13 6l6 6-6 6"/></svg></a>
                    </section>
                </li>
            </ul>
        </main>

        <footer class="app-footer">
            <p>© Harbourview Academy · Gradebook teacher portal · Demo data, all names fictional</p>
            <p>Template by <a href="https://uicookies.com/">uiCookies</a></p>
        </footer>
    </div>
</div>

<div class="toast-stack" id="toast-stack" aria-live="polite" aria-atomic="false"></div>

<script src="js/vendor/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
