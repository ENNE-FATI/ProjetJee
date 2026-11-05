<!DOCTYPE html>
<html lang="en">
<head>
    <script>document.documentElement.classList.add('js');(function(){try{var d=document.documentElement,t=localStorage.getItem('gradebook-theme');if(!t&&window.matchMedia&&window.matchMedia('(prefers-color-scheme: dark)').matches)t='dark';d.setAttribute('data-bs-theme',t==='dark'?'dark':'light');if(localStorage.getItem('gradebook-sidebar')==='collapsed')d.classList.add('sidebar-collapsed')}catch(e){}})();</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Reports — Gradebook Teacher Dashboard</title>
    <meta name="description" content="Class performance report with a grade distribution histogram, top and at-risk students and a comparison across classes.">
    <meta name="theme-color" content="#173d2d">
    <link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='8' fill='%23c2603c'/%3E%3Cpath d='M6 10.5c2.6-1.1 6-1 10 .9 4-1.9 7.4-2 10-.9v12.6c-2.6-1.1-6-1-10 .9-4-1.9-7.4-2-10-.9Z' fill='none' stroke='%23fbf6ea' stroke-width='2' stroke-linejoin='round'/%3E%3C/svg%3E">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,600;1,6..72,400;1,6..72,500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/style.css?v=20261103.1">
</head>
<body class="page-reports">
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
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/lesson-plans.jsp" data-tip="Lesson plans"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/></svg><span class="side-label">Lesson plans</span></a></li>
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/reports.jsp" aria-current="page" data-tip="Reports"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg><span class="side-label">Reports</span></a></li>
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
                    <p class="eyebrow"><span data-term-label>Autumn term</span> to date · 6 assessments per class</p>
                    <h1 id="page-title">Class performance</h1>
                    <p class="lede">How the class is spread, who is flying and who needs a conversation. Figures update from the gradebook.</p>
                </div>
                <div class="page-head-actions js-only">
                    <button type="button" class="btn btn-outline" id="print-report"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M6 9V2h12v7"/><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"/><rect x="6" y="14" width="12" height="8"/></svg>Print report</button>
                </div>
            </section>

            <div class="toolbar js-only">
                <div class="toolbar-field">
                    <label for="report-class">Class</label>
                    <select id="report-class" class="form-select form-select-sm"><option value="7H">7H Science · Year 7</option><option value="8K">8K Science · Year 8</option><option value="9R">9R Science · Year 9</option><option value="10B">10B Physics · Year 10</option><option value="11B" selected>11B Chemistry · Year 11</option><option value="12C">12C Chemistry · Year 12</option><option value="13C">13C Chemistry · Year 13</option></select>
                </div>
                <p class="toolbar-note" id="report-note">Year 11 · GCSE Triple Science · 24 students · target 71%</p>
            </div>

            <section class="stat-row" aria-label="Class summary">
                <div class="stat"><p class="stat-label"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="9"/><circle cx="12" cy="12" r="5"/><circle cx="12" cy="12" r="1"/></svg>Class average</p><p class="stat-value" data-r="avg">74.4<small>%</small></p><p class="stat-note" data-r="avg-note">+3.4 pts vs 71% target</p></div>
                <div class="stat"><p class="stat-label"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 3v18h18"/><path d="M8 17v-4M13 17V8M18 17v-7"/></svg>Median student</p><p class="stat-value" data-r="median">75.4<small>%</small></p><p class="stat-note">Half the class is above this</p></div>
                <div class="stat"><p class="stat-label"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M20 6 9 17l-5-5"/></svg>At or above target</p><p class="stat-value" data-r="on">14<small> of 24</small></p><p class="stat-note" data-r="on-note">58% of the class</p></div>
                <div class="stat"><p class="stat-label"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z"/><path d="M12 9v4M12 17h.01"/></svg>Missing work</p><p class="stat-value" data-r="missing">17</p><p class="stat-note">Entries not yet marked or handed in</p></div>
            </section>

            <div class="row g-4">
                <div class="col-xl-7">
                    <section class="card-desk h-100" aria-labelledby="hist-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">Student averages</p>
                                <h2 id="hist-title" class="card-title">Grade distribution</h2>
                            </div>
                            <button type="button" class="link-btn js-only" data-table-toggle="hist-table" aria-expanded="false" aria-controls="hist-table">Show table</button>
                        </header>
                        <figure class="chart">
                            <ul class="chart-legend js-only" aria-hidden="true">
                                <li><span class="sw sw-ok"></span>50% and above</li>
                                <li><span class="sw sw-low"></span>Below 50%, needs support</li>
                            </ul>
                            <div class="chart-plot" id="hist-chart"></div>
                            <figcaption class="chart-caption">Number of students in each band of term average.</figcaption>
                            <div class="chart-table-wrap" id="hist-table"><table class="chart-table">
                                <caption class="visually-hidden">Students per average band</caption>
                                <thead><tr><th scope="col">Average band</th><th scope="col">Students</th></tr></thead>
                                <tbody><tr><th scope="row">Below 40%</th><td>0</td></tr><tr><th scope="row">40–49%</th><td>1</td></tr><tr><th scope="row">50–59%</th><td>4</td></tr><tr><th scope="row">60–69%</th><td>4</td></tr><tr><th scope="row">70–79%</th><td>5</td></tr><tr><th scope="row">80–89%</th><td>7</td></tr><tr><th scope="row">90+%</th><td>3</td></tr></tbody>
                            </table></div>
                        </figure>
                    </section>
                </div>
                <div class="col-xl-5">
                    <section class="card-desk h-100" aria-labelledby="br-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">Mean score per task</p>
                                <h2 id="br-title" class="card-title">Assessment breakdown</h2>
                            </div>
                        </header>
                        <ul class="br-list" id="br-list">
                            <li class="br-item">
                                <p class="br-title"><span class="gb-type t-test">Test</span>Atomic structure test</p>
                                <div class="br-bar" role="img" aria-label="Atomic structure test: 72.9%"><span style="width:72.9%"></span></div>
                                <p class="br-val">72.9%</p>
                            </li>
                            <li class="br-item">
                                <p class="br-title"><span class="gb-type t-homework">Homework</span>Bonding homework</p>
                                <div class="br-bar" role="img" aria-label="Bonding homework: 79.1%"><span style="width:79.1%"></span></div>
                                <p class="br-val">79.1%</p>
                            </li>
                            <li class="br-item">
                                <p class="br-title"><span class="gb-type t-practical">Practical</span>Titration practical write-up</p>
                                <div class="br-bar" role="img" aria-label="Titration practical write-up: 73.5%"><span style="width:73.5%"></span></div>
                                <p class="br-val">73.5%</p>
                            </li>
                            <li class="br-item">
                                <p class="br-title"><span class="gb-type t-quiz">Quiz</span>Quantitative chemistry quiz</p>
                                <div class="br-bar" role="img" aria-label="Quantitative chemistry quiz: 72.2%"><span style="width:72.2%"></span></div>
                                <p class="br-val">72.2%</p>
                            </li>
                            <li class="br-item">
                                <p class="br-title"><span class="gb-type t-homework">Homework</span>Energy changes homework</p>
                                <div class="br-bar" role="img" aria-label="Energy changes homework: 78.6%"><span style="width:78.6%"></span></div>
                                <p class="br-val">78.6%</p>
                            </li>
                            <li class="br-item">
                                <p class="br-title"><span class="gb-type t-practical">Practical</span>Rates of reaction write-up</p>
                                <div class="br-bar" role="img" aria-label="Rates of reaction write-up: 72.9%"><span style="width:72.9%"></span></div>
                                <p class="br-val">72.9%</p>
                            </li>
                        </ul>
                    </section>
                </div>

                <div class="col-lg-6">
                    <section class="card-desk h-100" aria-labelledby="top-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">Highest term averages</p>
                                <h2 id="top-title" class="card-title">Top of the class</h2>
                            </div>
                        </header>
                        <ol class="people" id="top-list">
                            <li class="person">
                                <span class="avatar av-1" aria-hidden="true">FH</span>
                                <div class="person-main">
                                    <p class="person-name">Florence Hussain</p>
                                    <p class="person-note"><svg class="ic ic-up" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="m22 7-8.5 8.5-5-5L2 17"/><path d="M16 7h6v6"/></svg>Recent work up 2.5 pts</p>
                                </div>
                                <p class="person-avg s5">95.0%</p>
                            </li>
                            <li class="person">
                                <span class="avatar av-0" aria-hidden="true">AO</span>
                                <div class="person-main">
                                    <p class="person-name">Amara Okafor <abbr class="flag" title="Pupil Premium">PP</abbr></p>
                                    <p class="person-note"><svg class="ic ic-up" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="m22 7-8.5 8.5-5-5L2 17"/><path d="M16 7h6v6"/></svg>Recent work up 4.2 pts</p>
                                </div>
                                <p class="person-avg s5">94.2%</p>
                            </li>
                            <li class="person">
                                <span class="avatar av-2" aria-hidden="true">MN</span>
                                <div class="person-main">
                                    <p class="person-name">Maisie Nash <abbr class="flag" title="Pupil Premium">PP</abbr></p>
                                    <p class="person-note"><svg class="ic ic-up" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="m22 7-8.5 8.5-5-5L2 17"/><path d="M16 7h6v6"/></svg>Recent work up 1.7 pts</p>
                                </div>
                                <p class="person-avg s5">91.7%</p>
                            </li>
                            <li class="person">
                                <span class="avatar av-5" aria-hidden="true">LE</span>
                                <div class="person-main">
                                    <p class="person-name">Louis Ellis <abbr class="flag" title="Special educational needs">SEND</abbr></p>
                                    <p class="person-note"><svg class="ic ic-down" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="m22 17-8.5-8.5-5 5L2 7"/><path d="M16 17h6v-6"/></svg>Recent work down 1.3 pts</p>
                                </div>
                                <p class="person-avg s5">88.8%</p>
                            </li>
                            <li class="person">
                                <span class="avatar av-2" aria-hidden="true">OD</span>
                                <div class="person-main">
                                    <p class="person-name">Olivia Dhillon <abbr class="flag" title="Special educational needs">SEND</abbr></p>
                                    <p class="person-note"><svg class="ic ic-up" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="m22 7-8.5 8.5-5-5L2 17"/><path d="M16 7h6v6"/></svg>Recent work up 3.7 pts</p>
                                </div>
                                <p class="person-avg s5">88.0%</p>
                            </li>
                        </ol>
                    </section>
                </div>
                <div class="col-lg-6">
                    <section class="card-desk h-100" aria-labelledby="risk-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">10+ pts below target, 2+ missing, or falling</p>
                                <h2 id="risk-title" class="card-title">Needs support</h2>
                            </div>
                        </header>
                        <ul class="people" id="risk-list">
                            <li class="person">
                                <span class="avatar av-3" aria-hidden="true">JW</span>
                                <div class="person-main">
                                    <p class="person-name">Jonah Whitaker <abbr class="flag" title="Pupil Premium">PP</abbr></p>
                                    <p class="person-tags"><span class="tag-risk">24 pts below target</span><span class="tag-risk">3 missing</span></p>
                                </div>
                                <p class="person-avg s2">46.7%</p>
                            </li>
                            <li class="person">
                                <span class="avatar av-0" aria-hidden="true">EE</span>
                                <div class="person-main">
                                    <p class="person-name">Eden Edwards <abbr class="flag" title="Special educational needs">SEND</abbr></p>
                                    <p class="person-tags"><span class="tag-risk">16 pts below target</span></p>
                                </div>
                                <p class="person-avg s3">55.3%</p>
                            </li>
                            <li class="person">
                                <span class="avatar av-3" aria-hidden="true">HL</span>
                                <div class="person-main">
                                    <p class="person-name">Hugo Lewis <abbr class="flag" title="English as an additional language">EAL</abbr></p>
                                    <p class="person-tags"><span class="tag-risk">15 pts below target</span></p>
                                </div>
                                <p class="person-avg s3">55.7%</p>
                            </li>
                            <li class="person">
                                <span class="avatar av-5" aria-hidden="true">LM</span>
                                <div class="person-main">
                                    <p class="person-name">Luke Moreno</p>
                                    <p class="person-tags"><span class="tag-risk">14 pts below target</span></p>
                                </div>
                                <p class="person-avg s3">57.4%</p>
                            </li>
                            <li class="person">
                                <span class="avatar av-4" aria-hidden="true">AM</span>
                                <div class="person-main">
                                    <p class="person-name">Ahmed MacLeod</p>
                                    <p class="person-tags"><span class="tag-risk">12 pts below target</span></p>
                                </div>
                                <p class="person-avg s3">59.0%</p>
                            </li>
                        </ul>
                        <p class="empty-note" id="risk-empty" hidden>No students meet the support criteria.</p>
                    </section>
                </div>

                <div class="col-12">
                    <section class="card-desk" aria-labelledby="cmp-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">All classes · Summer term to Autumn term</p>
                                <h2 id="cmp-title" class="card-title">Comparison across classes</h2>
                            </div>
                            <button type="button" class="link-btn js-only" data-table-toggle="cmp-table" aria-expanded="false" aria-controls="cmp-table">Show table</button>
                        </header>
                        <figure class="chart">
                            <ul class="chart-legend js-only" aria-hidden="true">
                                <li><span class="sw-dot sw-dot-hollow"></span>Summer term</li>
                                <li><span class="sw-dot"></span>Autumn term</li>
                                <li><span class="sw-tick"></span>Class target</li>
                            </ul>
                            <div class="chart-plot" id="cmp-chart"></div>
                            <figcaption class="chart-caption">Year 7 and Year 12 are new cohorts, so they have no Summer term figure.</figcaption>
                            <div class="chart-table-wrap" id="cmp-table"><table class="chart-table">
                                <caption class="visually-hidden">Class averages, Summer and Autumn term</caption>
                                <thead><tr><th scope="col">Class</th><th scope="col">Summer term</th><th scope="col">Autumn term</th><th scope="col">Target</th></tr></thead>
                                <tbody><tr><th scope="row">7H Science</th><td>New cohort</td><td>73.7%</td><td>75%</td></tr><tr><th scope="row">8K Science</th><td>66.0%</td><td>65.7%</td><td>68%</td></tr><tr><th scope="row">9R Science</th><td>73.4%</td><td>71.6%</td><td>72%</td></tr><tr><th scope="row">10B Physics</th><td>63.8%</td><td>70.3%</td><td>68%</td></tr><tr><th scope="row">11B Chemistry</th><td>67.2%</td><td>74.4%</td><td>71%</td></tr><tr><th scope="row">12C Chemistry</th><td>New cohort</td><td>65.4%</td><td>64%</td></tr><tr><th scope="row">13C Chemistry</th><td>70.5%</td><td>69.8%</td><td>73%</td></tr></tbody>
                            </table></div>
                        </figure>
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
