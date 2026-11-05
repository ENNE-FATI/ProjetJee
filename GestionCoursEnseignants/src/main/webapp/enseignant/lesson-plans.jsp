<!DOCTYPE html>
<html lang="en">
<head>
    <script>document.documentElement.classList.add('js');(function(){try{var d=document.documentElement,t=localStorage.getItem('gradebook-theme');if(!t&&window.matchMedia&&window.matchMedia('(prefers-color-scheme: dark)').matches)t='dark';d.setAttribute('data-bs-theme',t==='dark'?'dark':'light');if(localStorage.getItem('gradebook-sidebar')==='collapsed')d.classList.add('sidebar-collapsed')}catch(e){}})();</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lesson plans — Gradebook Teacher Dashboard</title>
    <meta name="description" content="Weekly lesson plan board from Monday to Friday with objectives, resources and an add or edit dialog.">
    <meta name="theme-color" content="#173d2d">
    <link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='8' fill='%23c2603c'/%3E%3Cpath d='M6 10.5c2.6-1.1 6-1 10 .9 4-1.9 7.4-2 10-.9v12.6c-2.6-1.1-6-1-10 .9-4-1.9-7.4-2-10-.9Z' fill='none' stroke='%23fbf6ea' stroke-width='2' stroke-linejoin='round'/%3E%3C/svg%3E">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,600;1,6..72,400;1,6..72,500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/style.css?v=20261103.1">
</head>
<body class="page-plans">
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
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/classes.jsp" data-tip="Classes"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg><span class="side-label">Classes</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp" data-tip="Gradebook"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg><span class="side-label">Gradebook</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/assignments.jsp" data-tip="Assignments"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="8" y="2" width="8" height="4" rx="1"/><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><path d="m9 14 2 2 4-4"/></svg><span class="side-label">Assignments</span><span class="side-count">38<span class="visually-hidden"> scripts to mark</span></span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp" aria-current="page" data-tip="Lesson plans"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/></svg><span class="side-label">Lesson plans</span></a></li>
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

        <main id="main" class="page page-wide" tabindex="-1">
            <section class="page-head" aria-labelledby="page-title">
                <div class="page-head-text">
                    <p class="eyebrow">Week 4 · Monday 21 to Friday 25 September</p>
                    <h1 id="page-title">Lesson plans</h1>
                    <p class="lede">The week at a glance, lesson by lesson. Each card carries its objectives and the resources to have on the bench.</p>
                </div>
                <div class="page-head-actions js-only">
                    <button type="button" class="btn btn-accent" data-add-day="fri"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M12 5v14M5 12h14"/></svg>New plan</button>
                </div>
            </section>

            <div class="toolbar plan-toolbar">
                <ul class="plan-stats" aria-label="Week summary">
                    <li><strong data-plan-stat="total">21</strong> lessons</li>
                    <li><span class="sdot sdot-taught" aria-hidden="true"></span><strong data-plan-stat="taught">14</strong> taught</li>
                    <li><span class="sdot sdot-ready" aria-hidden="true"></span><strong data-plan-stat="ready">5</strong> ready</li>
                    <li><span class="sdot sdot-draft" aria-hidden="true"></span><strong data-plan-stat="draft">2</strong> drafts</li>
                </ul>
                <div class="toolbar-field js-only">
                    <label for="plan-filter">Class</label>
                    <select id="plan-filter" class="form-select form-select-sm">
                        <option value="all">All classes</option><option value="7H">7H Science</option><option value="8K">8K Science</option><option value="9R">9R Science</option><option value="10B">10B Physics</option><option value="11B">11B Chemistry</option><option value="12C">12C Chemistry</option><option value="13C">13C Chemistry</option>
                    </select>
                </div>
            </div>

            <div class="board-wrap" id="board-wrap">
                <div class="board" id="board">
                    <section class="day-col" data-day="mon" aria-labelledby="day-mon">
                        <header class="day-head">
                            <h2 class="day-name" id="day-mon">Monday <span class="day-date">21 Sep</span></h2>

                            <span class="day-count" data-day-count>4 lessons</span>
                        </header>
                        <div class="day-cards">
                            <article class="plan-card status-taught" data-id="plan-1" data-day="mon" data-period="1" data-class="9R" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P1 · 08:50</span>
                                    <span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>9R</span>
                                </div>
                                <h3 class="plan-title">Specialised cells</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Describe how nerve, sperm and root hair cells are adapted</li><li>Link structure to function in an unfamiliar cell</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Slides 3.2</li><li>Prepared slides set B</li><li>Exit ticket</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 9R Specialised cells"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                            <article class="plan-card status-taught" data-id="plan-2" data-day="mon" data-period="2" data-class="12C" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P2 · 09:50</span>
                                    <span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>12C</span>
                                </div>
                                <h3 class="plan-title">Enthalpy of combustion</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Calculate ΔcH from calorimetry data</li><li>Evaluate the main sources of heat loss</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Spirit burners × 6</li><li>Data sheet 1.4</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 12C Enthalpy of combustion"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                            <article class="plan-card status-taught" data-id="plan-3" data-day="mon" data-period="3" data-class="8K" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P3 · 11:10</span>
                                    <span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>8K</span>
                                </div>
                                <h3 class="plan-title">Distance–time graphs</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Plot and read distance–time graphs</li><li>Find speed from the gradient</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Graph paper</li><li>Motion sensor demo</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 8K Distance–time graphs"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                            <article class="plan-card status-taught" data-id="plan-4" data-day="mon" data-period="5" data-class="13C" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P5 · 14:00</span>
                                    <span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>13C</span>
                                </div>
                                <h3 class="plan-title">Electrochemical cells</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Draw and label a cell diagram</li><li>Explain the job of the salt bridge</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Half-cell kit</li><li>Past paper Q4</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 13C Electrochemical cells"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                        </div>
                        <button type="button" class="plan-add js-only" data-add-day="mon"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M12 5v14M5 12h14"/></svg>Add plan<span class="visually-hidden"> for Monday</span></button>
                    </section>
                    <section class="day-col" data-day="tue" aria-labelledby="day-tue">
                        <header class="day-head">
                            <h2 class="day-name" id="day-tue">Tuesday <span class="day-date">22 Sep</span></h2>

                            <span class="day-count" data-day-count>4 lessons</span>
                        </header>
                        <div class="day-cards">
                            <article class="plan-card status-taught" data-id="plan-5" data-day="tue" data-period="1" data-class="10B" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P1 · 08:50</span>
                                    <span class="chip chip-phys"><span class="chip-dot" aria-hidden="true"></span>10B</span>
                                </div>
                                <h3 class="plan-title">Unit test: energy and circuits</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Sit the 50-mark unit test in exam conditions</li><li>Self-assess using the mark scheme next lesson</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Test papers × 24</li><li>Spare calculators</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 10B Unit test: energy and circuits"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                            <article class="plan-card status-taught" data-id="plan-6" data-day="tue" data-period="2" data-class="11B" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P2 · 09:50</span>
                                    <span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>11B</span>
                                </div>
                                <h3 class="plan-title">Rates of reaction practical</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Measure rate by collecting gas</li><li>Record results with units and repeats</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Magnesium ribbon</li><li>HCl 0.5–2.0 M</li><li>Gas syringes × 8</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 11B Rates of reaction practical"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                            <article class="plan-card status-taught" data-id="plan-7" data-day="tue" data-period="3" data-class="7H" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P3 · 11:10</span>
                                    <span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>7H</span>
                                </div>
                                <h3 class="plan-title">Chromatography</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Separate inks by paper chromatography</li><li>Calculate Rf values</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Chromatography paper</li><li>Felt-tip set</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 7H Chromatography"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                            <article class="plan-card status-taught" data-id="plan-8" data-day="tue" data-period="4" data-class="13C" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P4 · 13:00</span>
                                    <span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>13C</span>
                                </div>
                                <h3 class="plan-title">Standard electrode potentials</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Use E⦵ values to predict feasibility</li><li>Write overall cell equations</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Data booklet</li><li>Worksheet 8.3</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 13C Standard electrode potentials"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                        </div>
                        <button type="button" class="plan-add js-only" data-add-day="tue"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M12 5v14M5 12h14"/></svg>Add plan<span class="visually-hidden"> for Tuesday</span></button>
                    </section>
                    <section class="day-col" data-day="wed" aria-labelledby="day-wed">
                        <header class="day-head">
                            <h2 class="day-name" id="day-wed">Wednesday <span class="day-date">23 Sep</span></h2>

                            <span class="day-count" data-day-count>4 lessons</span>
                        </header>
                        <div class="day-cards">
                            <article class="plan-card status-taught" data-id="plan-9" data-day="wed" data-period="1" data-class="12C" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P1 · 08:50</span>
                                    <span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>12C</span>
                                </div>
                                <h3 class="plan-title">Hess’s law cycles</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Build Hess cycles from formation data</li><li>Spot sign errors in worked examples</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Hess cycle scaffold</li><li>Mini whiteboards</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 12C Hess’s law cycles"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                            <article class="plan-card status-taught" data-id="plan-10" data-day="wed" data-period="2" data-class="9R" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P2 · 09:50</span>
                                    <span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>9R</span>
                                </div>
                                <h3 class="plan-title">Diffusion practical</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Investigate diffusion in agar cubes</li><li>Relate surface area to volume</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Agar cubes</li><li>Phenolphthalein</li><li>Rulers</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 9R Diffusion practical"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                            <article class="plan-card status-taught" data-id="plan-11" data-day="wed" data-period="4" data-class="8K" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P4 · 13:00</span>
                                    <span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>8K</span>
                                </div>
                                <h3 class="plan-title">Acids and alkalis</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Use indicators and the pH scale</li><li>Name the salts from neutralisation</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Universal indicator</li><li>Quiz, 15 marks</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 8K Acids and alkalis"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                            <article class="plan-card status-taught" data-id="plan-12" data-day="wed" data-period="5" data-class="11B" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P5 · 14:00</span>
                                    <span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>11B</span>
                                </div>
                                <h3 class="plan-title">Rates practical: analysis</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Plot volume of gas against time</li><li>Calculate mean rate from the gradient</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Results from Tuesday</li><li>Graph template</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 11B Rates practical: analysis"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                        </div>
                        <button type="button" class="plan-add js-only" data-add-day="wed"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M12 5v14M5 12h14"/></svg>Add plan<span class="visually-hidden"> for Wednesday</span></button>
                    </section>
                    <section class="day-col is-today" data-day="thu" aria-labelledby="day-thu">
                        <header class="day-head">
                            <h2 class="day-name" id="day-thu">Thursday <span class="day-date">24 Sep</span></h2>
                            <span class="today-badge">Today</span>
                            <span class="day-count" data-day-count>4 lessons</span>
                        </header>
                        <div class="day-cards">
                            <article class="plan-card status-taught" data-id="plan-13" data-day="thu" data-period="1" data-class="11B" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P1 · 08:50</span>
                                    <span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>11B</span>
                                </div>
                                <h3 class="plan-title">Collision theory</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Explain rate changes using collision theory</li><li>Sketch rate graphs for different conditions</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Animation 5.1</li><li>Exam question pack</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 11B Collision theory"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                            <article class="plan-card status-taught" data-id="plan-14" data-day="thu" data-period="2" data-class="7H" data-status="taught">
                                <div class="plan-top">
                                    <span class="plan-period">P2 · 09:50</span>
                                    <span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>7H</span>
                                </div>
                                <h3 class="plan-title">Evaporation and crystallisation</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Separate salt from rock salt</li><li>Explain why we heat gently near the end</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Rock salt</li><li>Evaporating basins × 14</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 7H Evaporation and crystallisation"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Taught</span>
                                </div>
                            </article>
                            <article class="plan-card status-ready" data-id="plan-15" data-day="thu" data-period="3" data-class="10B" data-status="ready">
                                <div class="plan-top">
                                    <span class="plan-period">P3 · 11:10</span>
                                    <span class="chip chip-phys"><span class="chip-dot" aria-hidden="true"></span>10B</span>
                                </div>
                                <h3 class="plan-title">Specific heat capacity practical</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Measure the SHC of an aluminium block</li><li>Identify errors from heat loss</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Aluminium blocks × 8</li><li>Immersion heaters</li><li>Joulemeters</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 10B Specific heat capacity practical"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Ready</span>
                                </div>
                            </article>
                            <article class="plan-card status-ready" data-id="plan-16" data-day="thu" data-period="5" data-class="12C" data-status="ready">
                                <div class="plan-top">
                                    <span class="plan-period">P5 · 14:00</span>
                                    <span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>12C</span>
                                </div>
                                <h3 class="plan-title">Born–Haber cycles</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Construct a Born–Haber cycle for NaCl</li><li>Calculate a lattice enthalpy</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Cycle cards</li><li>Worksheet 2.3</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 12C Born–Haber cycles"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Ready</span>
                                </div>
                            </article>
                        </div>
                        <button type="button" class="plan-add js-only" data-add-day="thu"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M12 5v14M5 12h14"/></svg>Add plan<span class="visually-hidden"> for Thursday</span></button>
                    </section>
                    <section class="day-col" data-day="fri" aria-labelledby="day-fri">
                        <header class="day-head">
                            <h2 class="day-name" id="day-fri">Friday <span class="day-date">25 Sep</span></h2>

                            <span class="day-count" data-day-count>5 lessons</span>
                        </header>
                        <div class="day-cards">
                            <article class="plan-card status-ready" data-id="plan-17" data-day="fri" data-period="1" data-class="11B" data-status="ready">
                                <div class="plan-top">
                                    <span class="plan-period">P1 · 08:50</span>
                                    <span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>11B</span>
                                </div>
                                <h3 class="plan-title">Rates: effect of concentration</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Predict the effect of concentration on rate</li><li>Interpret a disappearing-cross experiment</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Sodium thiosulfate</li><li>Cross cards</li><li>Stopwatches</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 11B Rates: effect of concentration"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Ready</span>
                                </div>
                            </article>
                            <article class="plan-card status-ready" data-id="plan-18" data-day="fri" data-period="2" data-class="7H" data-status="ready">
                                <div class="plan-top">
                                    <span class="plan-period">P2 · 09:50</span>
                                    <span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>7H</span>
                                </div>
                                <h3 class="plan-title">Distillation</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Describe how simple distillation works</li><li>Label the apparatus and explain each part</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Distillation demo kit</li><li>Worksheet 4.6</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 7H Distillation"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Ready</span>
                                </div>
                            </article>
                            <article class="plan-card status-draft" data-id="plan-19" data-day="fri" data-period="3" data-class="12C" data-status="draft">
                                <div class="plan-top">
                                    <span class="plan-period">P3 · 11:10</span>
                                    <span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>12C</span>
                                </div>
                                <h3 class="plan-title">Lattice enthalpy and solubility</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Link hydration enthalpy to solubility</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Data booklet</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 12C Lattice enthalpy and solubility"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Draft</span>
                                </div>
                            </article>
                            <article class="plan-card status-ready" data-id="plan-20" data-day="fri" data-period="4" data-class="9R" data-status="ready">
                                <div class="plan-top">
                                    <span class="plan-period">P4 · 13:00</span>
                                    <span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>9R</span>
                                </div>
                                <h3 class="plan-title">Diffusion and osmosis</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Explain osmosis as the diffusion of water</li><li>Predict changes in potato cylinders</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Potato cylinders</li><li>Sucrose solutions</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 9R Diffusion and osmosis"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Ready</span>
                                </div>
                            </article>
                            <article class="plan-card status-draft" data-id="plan-21" data-day="fri" data-period="5" data-class="10B" data-status="draft">
                                <div class="plan-top">
                                    <span class="plan-period">P5 · 14:00</span>
                                    <span class="chip chip-phys"><span class="chip-dot" aria-hidden="true"></span>10B</span>
                                </div>
                                <h3 class="plan-title">Specific heat capacity: analysis</h3>
                                <p class="plan-label">Objectives</p>
                                <ul class="plan-obj"><li>Calculate SHC from class results</li></ul>
                                <p class="plan-label">Resources</p>
                                <ul class="plan-res"><li>Class results sheet</li></ul>
                                <div class="plan-foot">
                                    <button type="button" class="plan-edit js-only" aria-label="Edit plan: 10B Specific heat capacity: analysis"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/></svg>Edit</button>
                                    <span class="plan-status">Draft</span>
                                </div>
                            </article>
                        </div>
                        <button type="button" class="plan-add js-only" data-add-day="fri"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M12 5v14M5 12h14"/></svg>Add plan<span class="visually-hidden"> for Friday</span></button>
                    </section>
                </div>
            </div>

            <dialog class="desk-dialog" id="plan-dialog" aria-labelledby="plan-dialog-title">
                <form id="plan-form" class="desk-form" novalidate>
                    <div class="dialog-head">
                        <h2 id="plan-dialog-title" class="card-title">New lesson plan</h2>
                        <button type="button" class="icon-btn" data-dialog-close aria-label="Close"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M18 6 6 18M6 6l12 12"/></svg></button>
                    </div>
                    <div class="dialog-body">
                        <div class="row g-3 mb-3">
                            <div class="col-4">
                                <label class="form-label" for="pl-day">Day</label>
                                <select class="form-select" id="pl-day" name="day">
                                    <option value="mon">Monday</option><option value="tue">Tuesday</option><option value="wed">Wednesday</option><option value="thu">Thursday</option><option value="fri">Friday</option>
                                </select>
                            </div>
                            <div class="col-4">
                                <label class="form-label" for="pl-period">Period</label>
                                <select class="form-select" id="pl-period" name="period">
                                    <option value="1">P1 · 08:50</option><option value="2">P2 · 09:50</option><option value="3">P3 · 11:10</option><option value="4">P4 · 13:00</option><option value="5">P5 · 14:00</option>
                                </select>
                            </div>
                            <div class="col-4">
                                <label class="form-label" for="pl-class">Class</label>
                                <select class="form-select" id="pl-class" name="class"><option value="7H">7H Science</option><option value="8K">8K Science</option><option value="9R">9R Science</option><option value="10B">10B Physics</option><option value="11B">11B Chemistry</option><option value="12C">12C Chemistry</option><option value="13C">13C Chemistry</option></select>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="pl-title">Lesson title</label>
                            <input type="text" class="form-control" id="pl-title" name="title" required aria-describedby="pl-title-err" placeholder="e.g. Electrolysis of copper sulfate">
                            <p class="field-error" id="pl-title-err">Give the lesson a title.</p>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="pl-obj">Objectives <span class="optional">one per line</span></label>
                            <textarea class="form-control" id="pl-obj" name="objectives" rows="3" required aria-describedby="pl-obj-err"></textarea>
                            <p class="field-error" id="pl-obj-err">Add at least one objective.</p>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="pl-res">Resources <span class="optional">separate with commas</span></label>
                            <input type="text" class="form-control" id="pl-res" name="resources" placeholder="Slides 4.1, Worksheet 4.2, Copper sulfate">
                        </div>
                        <fieldset class="mb-1">
                            <legend class="form-label">Status</legend>
                            <div class="seg seg-radio">
                                <input type="radio" class="visually-hidden-focusable-radio" name="status" id="pl-st-draft" value="draft" checked><label for="pl-st-draft">Draft</label>
                                <input type="radio" class="visually-hidden-focusable-radio" name="status" id="pl-st-ready" value="ready"><label for="pl-st-ready">Ready</label>
                                <input type="radio" class="visually-hidden-focusable-radio" name="status" id="pl-st-taught" value="taught"><label for="pl-st-taught">Taught</label>
                            </div>
                        </fieldset>
                    </div>
                    <div class="dialog-foot">
                        <button type="button" class="btn btn-quiet btn-danger-text me-auto" id="plan-delete" hidden><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 6h18M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg>Delete</button>
                        <button type="button" class="btn btn-outline" data-dialog-close>Cancel</button>
                        <button type="submit" class="btn btn-primary"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M20 6 9 17l-5-5"/></svg>Save plan</button>
                    </div>
                </form>
            </dialog>
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
