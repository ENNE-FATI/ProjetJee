<!DOCTYPE html>
<html lang="en">
<head>
    <script>document.documentElement.classList.add('js');(function(){try{var d=document.documentElement,t=localStorage.getItem('gradebook-theme');if(!t&&window.matchMedia&&window.matchMedia('(prefers-color-scheme: dark)').matches)t='dark';d.setAttribute('data-bs-theme',t==='dark'?'dark':'light');if(localStorage.getItem('gradebook-sidebar')==='collapsed')d.classList.add('sidebar-collapsed')}catch(e){}})();</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gradebook — Free Teacher Dashboard Template</title>
    <meta name="description" content="Teacher dashboard for Harbourview Academy: today’s timetable, marking queue, class averages, recent submissions and a quick attendance register.">
    <meta name="theme-color" content="#173d2d">
    <link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='8' fill='%23c2603c'/%3E%3Cpath d='M6 10.5c2.6-1.1 6-1 10 .9 4-1.9 7.4-2 10-.9v12.6c-2.6-1.1-6-1-10 .9-4-1.9-7.4-2-10-.9Z' fill='none' stroke='%23fbf6ea' stroke-width='2' stroke-linejoin='round'/%3E%3C/svg%3E">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,600;1,6..72,400;1,6..72,500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/style.css?v=20261103.1">
</head>
<body class="page-dashboard">
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
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/index.jsp" aria-current="page" data-tip="Dashboard"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="7" height="9" rx="1.5"/><rect x="14" y="3" width="7" height="5" rx="1.5"/><rect x="14" y="12" width="7" height="9" rx="1.5"/><rect x="3" y="16" width="7" height="5" rx="1.5"/></svg><span class="side-label">Dashboard</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/classes.jsp" data-tip="Classes"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg><span class="side-label">Classes</span></a></li>
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
                    <p class="eyebrow"><span data-term-label>Autumn term</span> · Week 4 · Thursday 24 September</p>
                    <h1 id="page-title">Good morning, <em>Daniel</em>.</h1>
                    <p class="lede">Four lessons today, 38 scripts waiting to be marked, and Year 11 parents’ evening at 16:30.</p>
                </div>
                <div class="page-head-actions">
                    <a class="btn btn-accent" href="#attendance"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="m16 11 2 2 4-4"/></svg>Take register</a>
                    <a class="btn btn-outline" href="${pageContext.request.contextPath}/enseignant/assignments.jsp#new-assignment"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M12 5v14M5 12h14"/></svg>New assignment</a>
                </div>
            </section>

            <section class="stat-row" aria-label="Today at a glance">
                <div class="stat">
                    <p class="stat-label"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18"/></svg>Lessons today</p>
                    <p class="stat-value">4</p>
                    <p class="stat-note">Next: <strong>10B Physics</strong> at 11:10</p>
                </div>
                <div class="stat">
                    <p class="stat-label"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M22 12h-6l-2 3h-4l-2-3H2"/><path d="M5.45 5.11 2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11Z"/></svg>Awaiting marking</p>
                    <p class="stat-value">38</p>
                    <p class="stat-note">Across 4 assignments · oldest 2 days</p>
                </div>
                <div class="stat">
                    <p class="stat-label"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><circle cx="12" cy="12" r="5"/><circle cx="12" cy="12" r="1"/></svg>Average across classes</p>
                    <p class="stat-value">70.1<small>%</small></p>
                    <p class="stat-note"><span class="delta delta-up"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="m22 7-8.5 8.5-5-5L2 17"/><path d="M16 7h6v6"/></svg>+2.2 pts</span> vs Summer term</p>
                </div>
                <div class="stat">
                    <p class="stat-label"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="m16 11 2 2 4-4"/></svg>Attendance this week</p>
                    <p class="stat-value">96.1<small>%</small></p>
                    <p class="stat-note"><span class="delta delta-down"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z"/><path d="M12 9v4M12 17h.01"/></svg>3 absences</span> flagged today</p>
                </div>
            </section>

            <div class="row g-4">
                <div class="col-xl-7">
                    <section class="card-desk h-100" aria-labelledby="today-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">Thursday timetable</p>
                                <h2 id="today-title" class="card-title">Today’s classes</h2>
                            </div>
                            <a class="link-more" href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp">Lesson plans <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M5 12h14M13 6l6 6-6 6"/></svg></a>
                        </header>
                        <ol class="timeline">
                            <li class="tl-item tl-admin is-done">
                                <div class="tl-time"><time datetime="08:30">08:30</time><span class="tl-end">08:50</span></div>
                                <div class="tl-node" aria-hidden="true"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M20 6 9 17l-5-5"/></svg></div>
                                <div class="tl-body">
                                    <p class="tl-title"><span>Registration · Tutor group 9R</span></p>
                                    <p class="tl-meta">Room S12</p>


                                </div>
                                <span class="tl-state state-done">Done</span>
                            </li>
                            <li class="tl-item tl-lesson is-done">
                                <div class="tl-time"><time datetime="08:50">08:50</time><span class="tl-end">09:50</span></div>
                                <div class="tl-node" aria-hidden="true"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M20 6 9 17l-5-5"/></svg></div>
                                <div class="tl-body">
                                    <p class="tl-title"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>11B</span> <span>Rates of reaction: collision theory</span></p>
                                    <p class="tl-meta">P1 · Lab 2 · 24 students</p>


                                </div>
                                <span class="tl-state state-done">Done</span>
                            </li>
                            <li class="tl-item tl-lesson is-now" aria-current="time">
                                <div class="tl-time"><time datetime="09:50">09:50</time><span class="tl-end">10:50</span></div>
                                <div class="tl-node" aria-hidden="true"></div>
                                <div class="tl-body">
                                    <p class="tl-title"><span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>7H</span> <span>Separating mixtures: evaporation and crystallisation</span></p>
                                    <p class="tl-meta">P2 · Lab 1 · 28 students</p>
                                    <div class="tl-progress" role="img" aria-label="Lesson 50% through"><span style="width:50%"></span></div>

                                </div>
                                <span class="tl-state state-now">Now</span>
                            </li>
                            <li class="tl-item tl-break">
                                <div class="tl-time"><time datetime="10:50">10:50</time><span class="tl-end">11:10</span></div>
                                <div class="tl-node" aria-hidden="true"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 8h1a4 4 0 1 1 0 8h-1"/><path d="M3 8h14v9a4 4 0 0 1-4 4H7a4 4 0 0 1-4-4Z"/><path d="M6 2v2M10 2v2M14 2v2"/></svg></div>
                                <div class="tl-body">
                                    <p class="tl-title"><span>Break duty</span></p>
                                    <p class="tl-meta">Science corridor, ground floor</p>


                                </div>

                            </li>
                            <li class="tl-item tl-lesson is-next">
                                <div class="tl-time"><time datetime="11:10">11:10</time><span class="tl-end">12:10</span></div>
                                <div class="tl-node" aria-hidden="true"></div>
                                <div class="tl-body">
                                    <p class="tl-title"><span class="chip chip-phys"><span class="chip-dot" aria-hidden="true"></span>10B</span> <span>Specific heat capacity practical</span></p>
                                    <p class="tl-meta">P3 · Lab 4 · 24 students</p>

                                    <a class="tl-link" href="#attendance">Take register <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M5 12h14M13 6l6 6-6 6"/></svg></a>
                                </div>
                                <span class="tl-state state-next">Next</span>
                            </li>
                            <li class="tl-item tl-break">
                                <div class="tl-time"><time datetime="12:10">12:10</time><span class="tl-end">13:00</span></div>
                                <div class="tl-node" aria-hidden="true"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 8h1a4 4 0 1 1 0 8h-1"/><path d="M3 8h14v9a4 4 0 0 1-4 4H7a4 4 0 0 1-4-4Z"/><path d="M6 2v2M10 2v2M14 2v2"/></svg></div>
                                <div class="tl-body">
                                    <p class="tl-title"><span>Lunch</span></p>
                                    <p class="tl-meta">Science club in Lab 3 from 12:30</p>


                                </div>

                            </li>
                            <li class="tl-item tl-admin">
                                <div class="tl-time"><time datetime="13:00">13:00</time><span class="tl-end">14:00</span></div>
                                <div class="tl-node" aria-hidden="true"></div>
                                <div class="tl-body">
                                    <p class="tl-title"><span>PPA · Mark 11B rates write-ups</span></p>
                                    <p class="tl-meta">Free period · Science office</p>


                                </div>

                            </li>
                            <li class="tl-item tl-lesson">
                                <div class="tl-time"><time datetime="14:00">14:00</time><span class="tl-end">15:00</span></div>
                                <div class="tl-node" aria-hidden="true"></div>
                                <div class="tl-body">
                                    <p class="tl-title"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>12C</span> <span>Born–Haber cycles</span></p>
                                    <p class="tl-meta">P5 · Lab 5 · 14 students</p>


                                </div>

                            </li>
                            <li class="tl-item tl-event">
                                <div class="tl-time"><time datetime="16:30">16:30</time><span class="tl-end">19:00</span></div>
                                <div class="tl-node" aria-hidden="true"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></div>
                                <div class="tl-body">
                                    <p class="tl-title"><span>Year 11 parents’ evening</span></p>
                                    <p class="tl-meta">Main hall · 9 appointments booked</p>


                                </div>

                            </li>
                        </ol>
                    </section>
                </div>

                <div class="col-xl-5">
                    <section class="card-desk h-100" id="marking" aria-labelledby="marking-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">Marking queue</p>
                                <h2 id="marking-title" class="card-title">38 scripts to mark</h2>
                            </div>
                            <a class="link-more" href="${pageContext.request.contextPath}/enseignant/assignments.jsp">All assignments <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M5 12h14M13 6l6 6-6 6"/></svg></a>
                        </header>
                        <ul class="queue">
                            <li class="queue-item">
                                <div class="queue-count is-urgent"><span class="queue-num">9</span><span class="queue-num-label">to mark</span></div>
                                <div class="queue-body">
                                    <p class="queue-title"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>11B</span> <a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=11B">Rates of reaction write-up</a></p>
                                    <p class="queue-meta">Practical · Return by Fri 25 Sep</p>
                                    <div class="meter" role="img" aria-label="15 of 24 marked"><span style="width:63%"></span></div>
                                    <p class="queue-progress">15 of 24 marked</p>
                                </div>
                            </li>
                            <li class="queue-item">
                                <div class="queue-count"><span class="queue-num">6</span><span class="queue-num-label">to mark</span></div>
                                <div class="queue-body">
                                    <p class="queue-title"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>12C</span> <a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=12C">Kinetics homework</a></p>
                                    <p class="queue-meta">Homework · Return by Mon 28 Sep</p>
                                    <div class="meter" role="img" aria-label="8 of 14 marked"><span style="width:57%"></span></div>
                                    <p class="queue-progress">8 of 14 marked</p>
                                </div>
                            </li>
                            <li class="queue-item">
                                <div class="queue-count"><span class="queue-num">14</span><span class="queue-num-label">to mark</span></div>
                                <div class="queue-body">
                                    <p class="queue-title"><span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>9R</span> <a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=9R">Diffusion practical</a></p>
                                    <p class="queue-meta">Practical · Return by Wed 30 Sep</p>
                                    <div class="meter" role="img" aria-label="13 of 27 marked"><span style="width:48%"></span></div>
                                    <p class="queue-progress">13 of 27 marked</p>
                                </div>
                            </li>
                            <li class="queue-item">
                                <div class="queue-count"><span class="queue-num">9</span><span class="queue-num-label">to mark</span></div>
                                <div class="queue-body">
                                    <p class="queue-title"><span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>8K</span> <a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=8K">Acids and alkalis quiz</a></p>
                                    <p class="queue-meta">Quiz · Return by Thu 1 Oct</p>
                                    <div class="meter" role="img" aria-label="21 of 30 marked"><span style="width:70%"></span></div>
                                    <p class="queue-progress">21 of 30 marked</p>
                                </div>
                            </li>
                        </ul>
                        <p class="card-foot-note"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 16v-4M12 8h.01"/></svg>Oldest first. Rates of reaction write-ups are due back to 11B tomorrow.</p>
                    </section>
                </div>

                <div class="col-xl-5">
                    <section class="card-desk h-100" aria-labelledby="avg-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">Autumn term to date</p>
                                <h2 id="avg-title" class="card-title">Class averages</h2>
                            </div>
                            <button type="button" class="link-btn js-only" data-table-toggle="avg-table" aria-expanded="false" aria-controls="avg-table">Show table</button>
                        </header>
                        <figure class="chart" data-chart="class-averages">
                            <div class="chart-plot" id="avg-chart"></div>
                            <figcaption class="chart-caption">Mean of each student’s average across the term’s assessments. The terracotta line marks the department target of 70%.</figcaption>
                            <dl class="chart-facts" id="avg-facts">
                                <div><dt>Highest</dt><dd><span data-fact="hi">11B · 74.4%</span></dd></div>
                                <div><dt>Lowest</dt><dd><span data-fact="lo">12C · 65.4%</span></dd></div>
                                <div><dt>At or above target</dt><dd><span data-fact="on">4 of 7</span></dd></div>
                            </dl>
                            <div class="chart-table-wrap" id="avg-table"><table class="chart-table">
                                <caption class="visually-hidden">Class averages, Autumn term</caption>
                                <thead><tr><th scope="col">Class</th><th scope="col">Average</th><th scope="col">Target</th></tr></thead>
                                <tbody><tr><th scope="row">7H Science</th><td>73.7%</td><td>70%</td></tr><tr><th scope="row">8K Science</th><td>65.7%</td><td>70%</td></tr><tr><th scope="row">9R Science</th><td>71.6%</td><td>70%</td></tr><tr><th scope="row">10B Physics</th><td>70.3%</td><td>70%</td></tr><tr><th scope="row">11B Chemistry</th><td>74.4%</td><td>70%</td></tr><tr><th scope="row">12C Chemistry</th><td>65.4%</td><td>70%</td></tr><tr><th scope="row">13C Chemistry</th><td>69.8%</td><td>70%</td></tr></tbody>
                            </table></div>
                        </figure>
                    </section>
                </div>

                <div class="col-xl-7">
                    <section class="card-desk h-100" id="attendance" aria-labelledby="register-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">Quick attendance · P3 11:10 · Lab 4</p>
                                <h2 id="register-title" class="card-title">10B Physics register</h2>
                            </div>
                        </header>
                        <form class="register" id="register-form" novalidate>
                            <div class="register-tally" aria-live="polite">
                                <span class="tally tally-present"><strong data-count="present">24</strong> present</span>
                                <span class="tally tally-absent"><strong data-count="absent">0</strong> absent</span>
                                <span class="tally tally-late"><strong data-count="late">0</strong> late</span>
                            </div>
                            <p class="register-hint">Select a student to cycle present, absent and late.</p>
                            <ul class="register-grid">
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Bethany Carter" aria-label="Bethany Carter: present"><span class="avatar av-2" aria-hidden="true">BC</span><span class="reg-name">Bethany C.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Ayaan Lindqvist" aria-label="Ayaan Lindqvist: present"><span class="avatar av-4" aria-hidden="true">AL</span><span class="reg-name">Ayaan L.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Lottie Adeyemi" aria-label="Lottie Adeyemi: present"><span class="avatar av-5" aria-hidden="true">LA</span><span class="reg-name">Lottie A.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Eli Doyle" aria-label="Eli Doyle: present"><span class="avatar av-1" aria-hidden="true">ED</span><span class="reg-name">Eli D.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Nadia Price" aria-label="Nadia Price: present"><span class="avatar av-4" aria-hidden="true">NP</span><span class="reg-name">Nadia P.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Archie Pearce" aria-label="Archie Pearce: present"><span class="avatar av-4" aria-hidden="true">AP</span><span class="reg-name">Archie P.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Selin Holloway" aria-label="Selin Holloway: present"><span class="avatar av-2" aria-hidden="true">SH</span><span class="reg-name">Selin H.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Rory Pritchard" aria-label="Rory Pritchard: present"><span class="avatar av-3" aria-hidden="true">RP</span><span class="reg-name">Rory P.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Iqra Walsh" aria-label="Iqra Walsh: present"><span class="avatar av-2" aria-hidden="true">IW</span><span class="reg-name">Iqra W.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Max Grant" aria-label="Max Grant: present"><span class="avatar av-0" aria-hidden="true">MG</span><span class="reg-name">Max G.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Willow Owusu" aria-label="Willow Owusu: present"><span class="avatar av-3" aria-hidden="true">WO</span><span class="reg-name">Willow O.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Hamza Young" aria-label="Hamza Young: present"><span class="avatar av-1" aria-hidden="true">HY</span><span class="reg-name">Hamza Y.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Beatrix Fitzgerald" aria-label="Beatrix Fitzgerald: present"><span class="avatar av-1" aria-hidden="true">BF</span><span class="reg-name">Beatrix F.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Arlo Nguyen" aria-label="Arlo Nguyen: present"><span class="avatar av-2" aria-hidden="true">AN</span><span class="reg-name">Arlo N.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Amira Boateng" aria-label="Amira Boateng: present"><span class="avatar av-0" aria-hidden="true">AB</span><span class="reg-name">Amira B.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Jude Raman" aria-label="Jude Raman: present"><span class="avatar av-1" aria-hidden="true">JR</span><span class="reg-name">Jude R.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Clara Brennan" aria-label="Clara Brennan: present"><span class="avatar av-1" aria-hidden="true">CB</span><span class="reg-name">Clara B.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Tariq Begum" aria-label="Tariq Begum: present"><span class="avatar av-1" aria-hidden="true">TB</span><span class="reg-name">Tariq B.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Violet O'Connell" aria-label="Violet O'Connell: present"><span class="avatar av-0" aria-hidden="true">VO</span><span class="reg-name">Violet O.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Owen Osei" aria-label="Owen Osei: present"><span class="avatar av-3" aria-hidden="true">OO</span><span class="reg-name">Owen O.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Sana Ferreira" aria-label="Sana Ferreira: present"><span class="avatar av-5" aria-hidden="true">SF</span><span class="reg-name">Sana F.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Sebastian Nwosu" aria-label="Sebastian Nwosu: present"><span class="avatar av-2" aria-hidden="true">SN</span><span class="reg-name">Sebastian N.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Harriet Varga" aria-label="Harriet Varga: present"><span class="avatar av-0" aria-hidden="true">HV</span><span class="reg-name">Harriet V.</span><span class="reg-state">Present</span></button></li>
                                <li><button type="button" class="reg-chip" data-state="present" data-name="Ezra Farouk" aria-label="Ezra Farouk: present"><span class="avatar av-0" aria-hidden="true">EF</span><span class="reg-name">Ezra F.</span><span class="reg-state">Present</span></button></li>
                            </ul>
                            <div class="register-actions">
                                <button type="button" class="btn btn-quiet btn-sm" data-register-reset>Mark all present</button>
                                <button type="submit" class="btn btn-primary btn-sm"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M20 6 9 17l-5-5"/></svg>Save register</button>
                            </div>
                            <p class="form-success" id="register-success" role="status" tabindex="-1" hidden></p>
                        </form>
                    </section>
                </div>

                <div class="col-xl-8">
                    <section class="card-desk h-100" aria-labelledby="subs-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">Last 24 hours</p>
                                <h2 id="subs-title" class="card-title">Recent submissions</h2>
                            </div>
                            <a class="link-more" href="${pageContext.request.contextPath}/enseignant/assignments.jsp">Assignments <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M5 12h14M13 6l6 6-6 6"/></svg></a>
                        </header>
                        <ul class="subs">
                            <li class="sub-item">
                                <span class="avatar av-0" aria-hidden="true">AO</span>
                                <div class="sub-main">
                                    <p class="sub-name">Amara Okafor</p>
                                    <p class="sub-work"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>11B</span> Rates of reaction write-up</p>
                                </div>
                                <p class="sub-when"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg>12 min ago</p>
                                <span class="pill pill-ok"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M20 6 9 17l-5-5"/></svg>On time</span>
                                <a class="btn btn-sm btn-quiet" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=11B&amp;student=Amara%20Okafor" aria-label="Mark Rates of reaction write-up for Amara Okafor">Mark</a>
                            </li>
                            <li class="sub-item">
                                <span class="avatar av-4" aria-hidden="true">TL</span>
                                <div class="sub-main">
                                    <p class="sub-name">Theo Lindqvist</p>
                                    <p class="sub-work"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>12C</span> Kinetics homework</p>
                                </div>
                                <p class="sub-when"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg>40 min ago</p>
                                <span class="pill pill-ok"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M20 6 9 17l-5-5"/></svg>On time</span>
                                <a class="btn btn-sm btn-quiet" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=12C&amp;student=Theo%20Lindqvist" aria-label="Mark Kinetics homework for Theo Lindqvist">Mark</a>
                            </li>
                            <li class="sub-item">
                                <span class="avatar av-4" aria-hidden="true">PR</span>
                                <div class="sub-main">
                                    <p class="sub-name">Priya Raman</p>
                                    <p class="sub-work"><span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>9R</span> Diffusion practical</p>
                                </div>
                                <p class="sub-when"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg>1 hour ago</p>
                                <span class="pill pill-ok"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M20 6 9 17l-5-5"/></svg>On time</span>
                                <a class="btn btn-sm btn-quiet" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=9R&amp;student=Priya%20Raman" aria-label="Mark Diffusion practical for Priya Raman">Mark</a>
                            </li>
                            <li class="sub-item">
                                <span class="avatar av-3" aria-hidden="true">JW</span>
                                <div class="sub-main">
                                    <p class="sub-name">Jonah Whitaker</p>
                                    <p class="sub-work"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>11B</span> Rates of reaction write-up</p>
                                </div>
                                <p class="sub-when"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg>2 hours ago</p>
                                <span class="pill pill-late"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z"/><path d="M12 9v4M12 17h.01"/></svg>Late · 1 day</span>
                                <a class="btn btn-sm btn-quiet" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=11B&amp;student=Jonah%20Whitaker" aria-label="Mark Rates of reaction write-up for Jonah Whitaker">Mark</a>
                            </li>
                            <li class="sub-item">
                                <span class="avatar av-1" aria-hidden="true">SM</span>
                                <div class="sub-main">
                                    <p class="sub-name">Sofia Marchetti</p>
                                    <p class="sub-work"><span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>8K</span> Acids and alkalis quiz</p>
                                </div>
                                <p class="sub-when"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg>Yesterday, 18:42</p>
                                <span class="pill pill-ok"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M20 6 9 17l-5-5"/></svg>On time</span>
                                <a class="btn btn-sm btn-quiet" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=8K&amp;student=Sofia%20Marchetti" aria-label="Mark Acids and alkalis quiz for Sofia Marchetti">Mark</a>
                            </li>
                            <li class="sub-item">
                                <span class="avatar av-3" aria-hidden="true">KM</span>
                                <div class="sub-main">
                                    <p class="sub-name">Kwame Mensah</p>
                                    <p class="sub-work"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>12C</span> Kinetics homework</p>
                                </div>
                                <p class="sub-when"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg>Yesterday, 16:05</p>
                                <span class="pill pill-ok"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M20 6 9 17l-5-5"/></svg>On time</span>
                                <a class="btn btn-sm btn-quiet" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=12C&amp;student=Kwame%20Mensah" aria-label="Mark Kinetics homework for Kwame Mensah">Mark</a>
                            </li>
                        </ul>
                    </section>
                </div>

                <div class="col-xl-4">
                    <section class="card-desk card-next h-100" aria-labelledby="next-title">
                        <img class="next-photo" src="img/lab-bench.jpg" alt="Laboratory bench set with glassware ready for a practical" width="800" height="520">
                        <div class="next-body">
                            <p class="card-eyebrow">Up next · 11:10</p>
                            <h2 id="next-title" class="card-title">Specific heat capacity</h2>
                            <p class="next-meta"><span class="chip chip-phys"><span class="chip-dot" aria-hidden="true"></span>10B</span> Required practical · Lab 4</p>
                            <fieldset class="prep">
                                <legend>Prep checklist <span class="prep-count" id="prep-count" aria-live="polite">2 of 5 ready</span></legend>
                                <label class="prep-item"><input type="checkbox" checked> Aluminium blocks × 8</label>
                                <label class="prep-item"><input type="checkbox" checked> Immersion heaters × 8</label>
                                <label class="prep-item"><input type="checkbox"> Joulemeters × 8</label>
                                <label class="prep-item"><input type="checkbox"> Thermometers and glycerol</label>
                                <label class="prep-item"><input type="checkbox"> Results sheet 6.2 printed</label>
                            </fieldset>
                            <a class="link-more" href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp">Open lesson plan <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M5 12h14M13 6l6 6-6 6"/></svg></a>
                        </div>
                    </section>
                </div>
            </div>
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
