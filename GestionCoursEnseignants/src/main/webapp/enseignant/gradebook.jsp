<!DOCTYPE html>
<html lang="en">
<head>
    <script>document.documentElement.classList.add('js');(function(){try{var d=document.documentElement,t=localStorage.getItem('gradebook-theme');if(!t&&window.matchMedia&&window.matchMedia('(prefers-color-scheme: dark)').matches)t='dark';d.setAttribute('data-bs-theme',t==='dark'?'dark':'light');if(localStorage.getItem('gradebook-sidebar')==='collapsed')d.classList.add('sidebar-collapsed')}catch(e){}})();</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Markbook — Gradebook Teacwher Dashboard</title>
    <meta name="description" content="Spreadsheet-style markbook with editable scores, keyboard navigation, live averages, a colour scale and CSV export.">
    <meta name="theme-color" content="#173d2d">
    <link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='8' fill='%23c2603c'/%3E%3Cpath d='M6 10.5c2.6-1.1 6-1 10 .9 4-1.9 7.4-2 10-.9v12.6c-2.6-1.1-6-1-10 .9-4-1.9-7.4-2-10-.9Z' fill='none' stroke='%23fbf6ea' stroke-width='2' stroke-linejoin='round'/%3E%3C/svg%3E">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,600;1,6..72,400;1,6..72,500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/style.css?v=20261103.1">
</head>
<body class="page-gradebook">
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
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/gradebook.jsp" aria-current="page" data-tip="Gradebook"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M3 15h18M9 3v18M15 9v12"/></svg><span class="side-label">Gradebook</span></a></li>
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

        <main id="main" class="page page-wide" tabindex="-1">
            <section class="page-head" aria-labelledby="page-title">
                <div class="page-head-text">
                    <p class="eyebrow"><span data-term-label>Autumn term</span> · Markbook</p>
                    <h1 id="page-title">Gradebook</h1>
                    <p class="lede">Enter marks straight into the grid. Averages, colours and the class summary recalculate as you type.</p>
                </div>
                <div class="page-head-actions js-only">
                    <button type="button" class="btn btn-outline" id="gb-undo" disabled><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M9 14 4 9l5-5"/><path d="M4 9h10.5a5.5 5.5 0 0 1 0 11H11"/></svg>Undo</button>
                    <button type="button" class="btn btn-outline" id="gb-reset"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 12a9 9 0 1 0 3-6.7L3 8"/><path d="M3 3v5h5"/></svg>Reset marks</button>
                    <button type="button" class="btn btn-primary" id="gb-export"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><path d="m7 10 5 5 5-5"/><path d="M12 15V3"/></svg>Export CSV</button>
                </div>
            </section>

            <div class="toolbar gb-toolbar js-only" role="group" aria-label="Gradebook controls">
                <div class="toolbar-field">
                    <label for="gb-class">Class</label>
                    <select id="gb-class" class="form-select form-select-sm"><option value="7H">7H Science · Year 7</option><option value="8K">8K Science · Year 8</option><option value="9R">9R Science · Year 9</option><option value="10B">10B Physics · Year 10</option><option value="11B" selected>11B Chemistry · Year 11</option><option value="12C">12C Chemistry · Year 12</option><option value="13C">13C Chemistry · Year 13</option></select>
                </div>
                <div class="toolbar-field toolbar-grow">
                    <label for="gb-filter">Find student</label>
                    <input type="search" id="gb-filter" class="form-control form-control-sm" placeholder="Type a name" autocomplete="off">
                </div>
                <div class="toolbar-field">
                    <label for="gb-show">Show</label>
                    <select id="gb-show" class="form-select form-select-sm">
                        <option value="all">All students</option>
                        <option value="missing">Missing work</option>
                        <option value="low">Average below 55%</option>
                    </select>
                </div>
                <div class="toolbar-field">
                    <span class="toolbar-label" id="gb-view-label">Display</span>
                    <div class="seg seg-sm" role="group" aria-labelledby="gb-view-label">
                        <button type="button" class="seg-btn" data-view="marks" aria-pressed="true">Marks</button>
                        <button type="button" class="seg-btn" data-view="pct" aria-pressed="false">Percent</button>
                    </div>
                </div>
                <div class="toolbar-field toolbar-switch">
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="gb-colour" checked>
                        <label class="form-check-label" for="gb-colour">Colour scale</label>
                    </div>
                </div>
            </div>

            <section class="gb-summary" aria-label="Class summary">
                <div class="gb-sum"><p class="gb-sum-label">Class average</p><p class="gb-sum-value" data-sum="avg">74.4%</p></div>
                <div class="gb-sum"><p class="gb-sum-label">Highest</p><p class="gb-sum-value" data-sum="hi">95.0%</p><p class="gb-sum-note" data-sum="hi-name">Florence Hussain</p></div>
                <div class="gb-sum"><p class="gb-sum-label">Lowest</p><p class="gb-sum-value" data-sum="lo">46.7%</p><p class="gb-sum-note" data-sum="lo-name">Jonah Whitaker</p></div>
                <div class="gb-sum"><p class="gb-sum-label">Missing entries</p><p class="gb-sum-value" data-sum="missing">17</p><p class="gb-sum-note">Shown as –</p></div>
                <div class="gb-sum gb-sum-status"><p class="gb-sum-label">Edits</p><p class="gb-sum-value" data-sum="edits">0</p><p class="gb-sum-note" data-sum="saved">Kept in this browser</p></div>
            </section>

            <div class="gb-frame">
                <div class="gb-scroll" id="gb-scroll">
                    <table class="gb-table" id="gb-table" role="grid" aria-labelledby="gb-caption" aria-describedby="gb-kbd-summary">
                        <caption id="gb-caption" class="visually-hidden">11B Chemistry marks, Autumn term</caption>
                        <thead>
                        <tr>
                            <th scope="col" class="gb-corner" aria-sort="none"><button type="button" class="gb-sort" data-sort="name">Student <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="m6 9 6 6 6-6"/></svg></button></th><th scope="col" class="gb-col" data-c="0"><span class="gb-type t-test">Test</span><span class="gb-col-title">Atomic structure test</span><span class="gb-col-meta">4 Sep · /40</span></th><th scope="col" class="gb-col" data-c="1"><span class="gb-type t-homework">Homework</span><span class="gb-col-title">Bonding homework</span><span class="gb-col-meta">8 Sep · /20</span></th><th scope="col" class="gb-col" data-c="2"><span class="gb-type t-practical">Practical</span><span class="gb-col-title">Titration practical write-up</span><span class="gb-col-meta">11 Sep · /30</span></th><th scope="col" class="gb-col" data-c="3"><span class="gb-type t-quiz">Quiz</span><span class="gb-col-title">Quantitative chemistry quiz</span><span class="gb-col-meta">15 Sep · /15</span></th><th scope="col" class="gb-col" data-c="4"><span class="gb-type t-homework">Homework</span><span class="gb-col-title">Energy changes homework</span><span class="gb-col-meta">18 Sep · /20</span></th><th scope="col" class="gb-col" data-c="5"><span class="gb-type t-practical">Practical</span><span class="gb-col-title">Rates of reaction write-up</span><span class="gb-col-meta">22 Sep · /30</span></th>
                            <th scope="col" class="gb-avg-head" aria-sort="none"><button type="button" class="gb-sort" data-sort="avg">Average <svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="m6 9 6 6 6-6"/></svg></button></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr data-r="0">
                            <th scope="row" class="gb-student"><span class="avatar av-0" aria-hidden="true">AO</span><span class="gb-name">Amara Okafor</span><abbr class="flag" title="Pupil Premium">PP</abbr></th><td class="gb-cell s5" data-c="0">36</td><td class="gb-cell s5" data-c="1">19</td><td class="gb-cell s4" data-c="2">25</td><td class="gb-cell s5" data-c="3">15</td><td class="gb-cell s5" data-c="4">20</td><td class="gb-cell s5" data-c="5">29</td><td class="gb-avg s5" aria-readonly="true">94.2%</td>
                        </tr>
                        <tr data-r="1">
                            <th scope="row" class="gb-student"><span class="avatar av-3" aria-hidden="true">JW</span><span class="gb-name">Jonah Whitaker</span><abbr class="flag" title="Pupil Premium">PP</abbr></th><td class="gb-cell sx" data-c="0"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-cell sx" data-c="1"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-cell s3" data-c="2">17</td><td class="gb-cell s2" data-c="3">6</td><td class="gb-cell sx" data-c="4"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-cell s2" data-c="5">13</td><td class="gb-avg s2" aria-readonly="true">46.7%</td>
                        </tr>
                        <tr data-r="2">
                            <th scope="row" class="gb-student"><span class="avatar av-2" aria-hidden="true">MN</span><span class="gb-name">Maisie Nash</span><abbr class="flag" title="Pupil Premium">PP</abbr></th><td class="gb-cell s5" data-c="0">34</td><td class="gb-cell s5" data-c="1">20</td><td class="gb-cell s5" data-c="2">26</td><td class="gb-cell s5" data-c="3">13</td><td class="gb-cell s5" data-c="4">20</td><td class="gb-cell sx" data-c="5"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-avg s5" aria-readonly="true">91.7%</td>
                        </tr>
                        <tr data-r="3">
                            <th scope="row" class="gb-student"><span class="avatar av-1" aria-hidden="true">AW</span><span class="gb-name">Adam Webb</span></th><td class="gb-cell s4" data-c="0">30</td><td class="gb-cell s4" data-c="1">16</td><td class="gb-cell s4" data-c="2">24</td><td class="gb-cell s5" data-c="3">13</td><td class="gb-cell s4" data-c="4">14</td><td class="gb-cell s4" data-c="5">23</td><td class="gb-avg s4" aria-readonly="true">78.1%</td>
                        </tr>
                        <tr data-r="4">
                            <th scope="row" class="gb-student"><span class="avatar av-0" aria-hidden="true">EE</span><span class="gb-name">Eden Edwards</span><abbr class="flag" title="Special educational needs">SEND</abbr></th><td class="gb-cell s4" data-c="0">28</td><td class="gb-cell s2" data-c="1">10</td><td class="gb-cell s2" data-c="2">16</td><td class="gb-cell s2" data-c="3">8</td><td class="gb-cell sx" data-c="4"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-cell s2" data-c="5">15</td><td class="gb-avg s3" aria-readonly="true">55.3%</td>
                        </tr>
                        <tr data-r="5">
                            <th scope="row" class="gb-student"><span class="avatar av-5" aria-hidden="true">LM</span><span class="gb-name">Luke Moreno</span></th><td class="gb-cell s2" data-c="0">21</td><td class="gb-cell s3" data-c="1">11</td><td class="gb-cell s3" data-c="2">18</td><td class="gb-cell s2" data-c="3">8</td><td class="gb-cell s3" data-c="4">12</td><td class="gb-cell s3" data-c="5">19</td><td class="gb-avg s3" aria-readonly="true">57.4%</td>
                        </tr>
                        <tr data-r="6">
                            <th scope="row" class="gb-student"><span class="avatar av-0" aria-hidden="true">YA</span><span class="gb-name">Yasmin Ashby</span></th><td class="gb-cell s5" data-c="0">40</td><td class="gb-cell s5" data-c="1">18</td><td class="gb-cell s4" data-c="2">21</td><td class="gb-cell s4" data-c="3">11</td><td class="gb-cell s5" data-c="4">17</td><td class="gb-cell sx" data-c="5"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-avg s4" aria-readonly="true">83.7%</td>
                        </tr>
                        <tr data-r="7">
                            <th scope="row" class="gb-student"><span class="avatar av-5" aria-hidden="true">CW</span><span class="gb-name">Charlie Whitaker</span></th><td class="gb-cell s3" data-c="0">26</td><td class="gb-cell s4" data-c="1">14</td><td class="gb-cell s3" data-c="2">17</td><td class="gb-cell s3" data-c="3">9</td><td class="gb-cell s3" data-c="4">13</td><td class="gb-cell s4" data-c="5">22</td><td class="gb-avg s3" aria-readonly="true">65.0%</td>
                        </tr>
                        <tr data-r="8">
                            <th scope="row" class="gb-student"><span class="avatar av-2" aria-hidden="true">AN</span><span class="gb-name">Anjali Novak</span></th><td class="gb-cell s3" data-c="0">23</td><td class="gb-cell s3" data-c="1">13</td><td class="gb-cell s3" data-c="2">20</td><td class="gb-cell s3" data-c="3">10</td><td class="gb-cell sx" data-c="4"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-cell sx" data-c="5"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-avg s3" aria-readonly="true">64.0%</td>
                        </tr>
                        <tr data-r="9">
                            <th scope="row" class="gb-student"><span class="avatar av-4" aria-hidden="true">FH</span><span class="gb-name">Frankie Harrington</span><abbr class="flag" title="Special educational needs">SEND</abbr></th><td class="gb-cell s4" data-c="0">31</td><td class="gb-cell s5" data-c="1">19</td><td class="gb-cell s5" data-c="2">29</td><td class="gb-cell s4" data-c="3">12</td><td class="gb-cell s4" data-c="4">16</td><td class="gb-cell sx" data-c="5"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-avg s5" aria-readonly="true">85.8%</td>
                        </tr>
                        <tr data-r="10">
                            <th scope="row" class="gb-student"><span class="avatar av-1" aria-hidden="true">EM</span><span class="gb-name">Elsie Mahmood</span></th><td class="gb-cell s3" data-c="0">24</td><td class="gb-cell s5" data-c="1">17</td><td class="gb-cell s4" data-c="2">21</td><td class="gb-cell s4" data-c="3">12</td><td class="gb-cell s4" data-c="4">14</td><td class="gb-cell sx" data-c="5"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-avg s4" aria-readonly="true">73.0%</td>
                        </tr>
                        <tr data-r="11">
                            <th scope="row" class="gb-student"><span class="avatar av-4" aria-hidden="true">AM</span><span class="gb-name">Ahmed MacLeod</span></th><td class="gb-cell s3" data-c="0">23</td><td class="gb-cell s3" data-c="1">13</td><td class="gb-cell s2" data-c="2">16</td><td class="gb-cell s3" data-c="3">10</td><td class="gb-cell s3" data-c="4">13</td><td class="gb-cell s2" data-c="5">14</td><td class="gb-avg s3" aria-readonly="true">59.0%</td>
                        </tr>
                        <tr data-r="12">
                            <th scope="row" class="gb-student"><span class="avatar av-2" aria-hidden="true">LB</span><span class="gb-name">Lola Byrne</span></th><td class="gb-cell s4" data-c="0">29</td><td class="gb-cell s4" data-c="1">15</td><td class="gb-cell s4" data-c="2">23</td><td class="gb-cell s4" data-c="3">11</td><td class="gb-cell s4" data-c="4">15</td><td class="gb-cell sx" data-c="5"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-avg s4" aria-readonly="true">74.5%</td>
                        </tr>
                        <tr data-r="13">
                            <th scope="row" class="gb-student"><span class="avatar av-5" aria-hidden="true">RM</span><span class="gb-name">Rafael Morgan</span></th><td class="gb-cell s3" data-c="0">24</td><td class="gb-cell s4" data-c="1">14</td><td class="gb-cell s3" data-c="2">20</td><td class="gb-cell s3" data-c="3">10</td><td class="gb-cell s4" data-c="4">14</td><td class="gb-cell s2" data-c="5">16</td><td class="gb-avg s3" aria-readonly="true">64.4%</td>
                        </tr>
                        <tr data-r="14">
                            <th scope="row" class="gb-student"><span class="avatar av-1" aria-hidden="true">HU</span><span class="gb-name">Heidi Usman</span></th><td class="gb-cell s4" data-c="0">31</td><td class="gb-cell sx" data-c="1"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-cell s4" data-c="2">25</td><td class="gb-cell s4" data-c="3">11</td><td class="gb-cell s5" data-c="4">20</td><td class="gb-cell s5" data-c="5">26</td><td class="gb-avg s4" aria-readonly="true">84.2%</td>
                        </tr>
                        <tr data-r="15">
                            <th scope="row" class="gb-student"><span class="avatar av-5" aria-hidden="true">LE</span><span class="gb-name">Louis Ellis</span><abbr class="flag" title="Special educational needs">SEND</abbr></th><td class="gb-cell s5" data-c="0">39</td><td class="gb-cell s5" data-c="1">18</td><td class="gb-cell s4" data-c="2">25</td><td class="gb-cell s5" data-c="3">13</td><td class="gb-cell s5" data-c="4">17</td><td class="gb-cell s5" data-c="5">27</td><td class="gb-avg s5" aria-readonly="true">88.8%</td>
                        </tr>
                        <tr data-r="16">
                            <th scope="row" class="gb-student"><span class="avatar av-5" aria-hidden="true">TM</span><span class="gb-name">Tia Murphy</span></th><td class="gb-cell s5" data-c="0">36</td><td class="gb-cell s5" data-c="1">17</td><td class="gb-cell s4" data-c="2">24</td><td class="gb-cell s4" data-c="3">11</td><td class="gb-cell s4" data-c="4">16</td><td class="gb-cell sx" data-c="5"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-avg s4" aria-readonly="true">81.7%</td>
                        </tr>
                        <tr data-r="17">
                            <th scope="row" class="gb-student"><span class="avatar av-2" aria-hidden="true">KV</span><span class="gb-name">Kieran Vaughan</span><abbr class="flag" title="Special educational needs">SEND</abbr></th><td class="gb-cell s4" data-c="0">28</td><td class="gb-cell s5" data-c="1">17</td><td class="gb-cell s4" data-c="2">22</td><td class="gb-cell s4" data-c="3">12</td><td class="gb-cell s4" data-c="4">16</td><td class="gb-cell s4" data-c="5">21</td><td class="gb-avg s4" aria-readonly="true">76.4%</td>
                        </tr>
                        <tr data-r="18">
                            <th scope="row" class="gb-student"><span class="avatar av-2" aria-hidden="true">OD</span><span class="gb-name">Olivia Dhillon</span><abbr class="flag" title="Special educational needs">SEND</abbr></th><td class="gb-cell sx" data-c="0"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-cell s5" data-c="1">18</td><td class="gb-cell s4" data-c="2">24</td><td class="gb-cell s5" data-c="3">13</td><td class="gb-cell s5" data-c="4">18</td><td class="gb-cell s5" data-c="5">28</td><td class="gb-avg s5" aria-readonly="true">88.0%</td>
                        </tr>
                        <tr data-r="19">
                            <th scope="row" class="gb-student"><span class="avatar av-3" aria-hidden="true">HL</span><span class="gb-name">Hugo Lewis</span><abbr class="flag" title="English as an additional language">EAL</abbr></th><td class="gb-cell s2" data-c="0">20</td><td class="gb-cell s3" data-c="1">12</td><td class="gb-cell s3" data-c="2">20</td><td class="gb-cell s2" data-c="3">7</td><td class="gb-cell s3" data-c="4">11</td><td class="gb-cell sx" data-c="5"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-avg s3" aria-readonly="true">55.7%</td>
                        </tr>
                        <tr data-r="20">
                            <th scope="row" class="gb-student"><span class="avatar av-0" aria-hidden="true">NW</span><span class="gb-name">Naomi Ward</span></th><td class="gb-cell s4" data-c="0">28</td><td class="gb-cell s4" data-c="1">14</td><td class="gb-cell s4" data-c="2">23</td><td class="gb-cell s3" data-c="3">9</td><td class="gb-cell s4" data-c="4">14</td><td class="gb-cell sx" data-c="5"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-avg s3" aria-readonly="true">69.3%</td>
                        </tr>
                        <tr data-r="21">
                            <th scope="row" class="gb-student"><span class="avatar av-5" aria-hidden="true">IO</span><span class="gb-name">Isaac Okafor</span><abbr class="flag" title="Pupil Premium">PP</abbr></th><td class="gb-cell s3" data-c="0">25</td><td class="gb-cell s4" data-c="1">14</td><td class="gb-cell s3" data-c="2">19</td><td class="gb-cell s4" data-c="3">12</td><td class="gb-cell s4" data-c="4">15</td><td class="gb-cell s4" data-c="5">21</td><td class="gb-avg s4" aria-readonly="true">70.1%</td>
                        </tr>
                        <tr data-r="22">
                            <th scope="row" class="gb-student"><span class="avatar av-1" aria-hidden="true">FH</span><span class="gb-name">Florence Hussain</span></th><td class="gb-cell sx" data-c="0"><span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span></td><td class="gb-cell s5" data-c="1">20</td><td class="gb-cell s5" data-c="2">28</td><td class="gb-cell s5" data-c="3">13</td><td class="gb-cell s5" data-c="4">19</td><td class="gb-cell s5" data-c="5">30</td><td class="gb-avg s5" aria-readonly="true">95.0%</td>
                        </tr>
                        <tr data-r="23">
                            <th scope="row" class="gb-student"><span class="avatar av-1" aria-hidden="true">AO</span><span class="gb-name">Aiden Oduya</span></th><td class="gb-cell s5" data-c="0">36</td><td class="gb-cell s5" data-c="1">19</td><td class="gb-cell s5" data-c="2">26</td><td class="gb-cell s4" data-c="3">11</td><td class="gb-cell s4" data-c="4">16</td><td class="gb-cell s4" data-c="5">24</td><td class="gb-avg s4" aria-readonly="true">84.2%</td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th scope="row" class="gb-student gb-foot-label">Class average</th><td class="gb-foot s4" data-c="0" aria-readonly="true">72.9%</td><td class="gb-foot s4" data-c="1" aria-readonly="true">79.1%</td><td class="gb-foot s4" data-c="2" aria-readonly="true">73.5%</td><td class="gb-foot s4" data-c="3" aria-readonly="true">72.2%</td><td class="gb-foot s4" data-c="4" aria-readonly="true">78.6%</td><td class="gb-foot s4" data-c="5" aria-readonly="true">72.9%</td><td class="gb-foot gb-foot-avg s4" aria-readonly="true">74.4%</td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>

            <div class="gb-under">
                <ul class="legend" aria-label="Colour scale">
                    <li><span class="sw s1" aria-hidden="true"></span>Below 40%</li>
                    <li><span class="sw s2" aria-hidden="true"></span>40–54%</li>
                    <li><span class="sw s3" aria-hidden="true"></span>55–69%</li>
                    <li><span class="sw s4" aria-hidden="true"></span>70–84%</li>
                    <li><span class="sw s5" aria-hidden="true"></span>85% and above</li>
                    <li><span class="sw sx" aria-hidden="true"></span>Not submitted</li>
                </ul>
                <p class="gb-flags-key"><abbr class="flag" title="Pupil Premium">PP</abbr> Pupil Premium <abbr class="flag" title="English as an additional language">EAL</abbr> English as an additional language <abbr class="flag" title="Special educational needs">SEND</abbr> Special educational needs</p>
            </div>

            <details class="kbd-help js-only">
                <summary><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="2" y="5" width="20" height="14" rx="2"/><path d="M6 9h.01M10 9h.01M14 9h.01M18 9h.01M8 13h.01M12 13h.01M16 13h.01M7 16h10"/></svg>Keyboard shortcuts</summary>
                <p id="gb-kbd-summary" class="visually-hidden">Use arrow keys to move between marks. Type a number or press Enter to edit. Enter saves and moves down, Tab saves and moves right, Escape cancels.</p>
                <dl class="kbd-list">
                    <div><dt><kbd>←</kbd> <kbd>→</kbd> <kbd>↑</kbd> <kbd>↓</kbd></dt><dd>Move between marks</dd></div>
                    <div><dt><kbd>0</kbd>–<kbd>9</kbd> or <kbd>Enter</kbd></dt><dd>Start editing the selected mark</dd></div>
                    <div><dt><kbd>Enter</kbd> / <kbd>Shift</kbd> <kbd>Enter</kbd></dt><dd>Save and move down / up</dd></div>
                    <div><dt><kbd>Tab</kbd> / <kbd>Shift</kbd> <kbd>Tab</kbd></dt><dd>Save and move right / left</dd></div>
                    <div><dt><kbd>Esc</kbd></dt><dd>Cancel the edit</dd></div>
                    <div><dt><kbd>Delete</kbd></dt><dd>Clear a mark (not submitted)</dd></div>
                    <div><dt><kbd>Home</kbd> / <kbd>End</kbd></dt><dd>First / last mark in the row</dd></div>
                    <div><dt><kbd>Ctrl</kbd> <kbd>Z</kbd></dt><dd>Undo the last change</dd></div>
                </dl>
            </details>
            <p class="visually-hidden" id="gb-live" aria-live="polite"></p>
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
