<!DOCTYPE html>
<html lang="en">
<head>
    <script>document.documentElement.classList.add('js');(function(){try{var d=document.documentElement,t=localStorage.getItem('gradebook-theme');if(!t&&window.matchMedia&&window.matchMedia('(prefers-color-scheme: dark)').matches)t='dark';d.setAttribute('data-bs-theme',t==='dark'?'dark':'light');if(localStorage.getItem('gradebook-sidebar')==='collapsed')d.classList.add('sidebar-collapsed')}catch(e){}})();</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Assignments — Gradebook Teacher Dashboard</title>
    <meta name="description" content="Assignment list with hand-in and marking progress, plus a create-assignment form with a rubric builder.">
    <meta name="theme-color" content="#173d2d">
    <link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='8' fill='%23c2603c'/%3E%3Cpath d='M6 10.5c2.6-1.1 6-1 10 .9 4-1.9 7.4-2 10-.9v12.6c-2.6-1.1-6-1-10 .9-4-1.9-7.4-2-10-.9Z' fill='none' stroke='%23fbf6ea' stroke-width='2' stroke-linejoin='round'/%3E%3C/svg%3E">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,600;1,6..72,400;1,6..72,500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/enseignant/css/style.css?v=20261103.1">
</head>
<body class="page-assignments">
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
                <li><a class="side-link" href="${pageContext.request.contextPath}/enseignant/assignments.jsp" aria-current="page" data-tip="Assignments"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><rect x="8" y="2" width="8" height="4" rx="1"/><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><path d="m9 14 2 2 4-4"/></svg><span class="side-label">Assignments</span><span class="side-count">38<span class="visually-hidden"> scripts to mark</span></span></a></li>
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
                    <p class="eyebrow"><span data-term-label>Autumn term</span> · 12 assignments this fortnight</p>
                    <h1 id="page-title">Assignments</h1>
                    <p class="lede">Set work, track what has come in and what still needs marking. New tasks can carry a rubric so marks add up the same way every time.</p>
                </div>
                <div class="page-head-actions">
                    <a class="btn btn-accent" href="#new-assignment"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M12 5v14M5 12h14"/></svg>Create assignment</a>
                </div>
            </section>

            <div class="row g-4 align-items-start">
                <div class="col-xl-7">
                    <section class="card-desk" aria-labelledby="list-title">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">All classes</p>
                                <h2 id="list-title" class="card-title">Set work</h2>
                            </div>
                        </header>
                        <div class="toolbar toolbar-inset js-only">
                            <div class="seg seg-sm" role="group" aria-label="Filter by status">
                                <button type="button" class="seg-btn" data-status-filter="all" aria-pressed="true">All <span data-status-count="all">12</span></button>
                                <button type="button" class="seg-btn" data-status-filter="marking" aria-pressed="false">To mark <span data-status-count="marking">4</span></button>
                                <button type="button" class="seg-btn" data-status-filter="open" aria-pressed="false">Open <span data-status-count="open">4</span></button>
                                <button type="button" class="seg-btn" data-status-filter="returned" aria-pressed="false">Returned <span data-status-count="returned">4</span></button>
                            </div>
                            <div class="toolbar-field toolbar-grow">
                                <label class="visually-hidden" for="assign-search">Search assignments</label>
                                <input type="search" class="form-control form-control-sm" id="assign-search" placeholder="Search by class or title" autocomplete="off">
                            </div>
                        </div>
                        <ul class="assign-list" id="assign-list">
                            <li class="assign-item" data-status="marking" data-search="11b rates of reaction write-up practical">
                                <div class="assign-main">
                                    <p class="assign-kicker"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>11B</span><span class="gb-type t-practical">Practical</span></p>
                                    <h3 class="assign-title"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=11B">Rates of reaction write-up</a></h3>
                                    <p class="assign-meta"><span>Set Tue 22 Sep</span><span>Due Thu 24 Sep</span><span>30 marks</span><span>4 criteria</span></p>
                                </div>
                                <div class="assign-progress">
                                    <p><span>Handed in</span><strong>24/24</strong></p>
                                    <div class="meter" role="img" aria-label="24 of 24 handed in"><span style="width:100%"></span></div>
                                    <p><span>Marked</span><strong>15/24</strong></p>
                                    <div class="meter meter-accent" role="img" aria-label="15 of 24 marked"><span style="width:63%"></span></div>
                                </div>
                                <span class="pill pill-marking">To mark</span>
                            </li>
                            <li class="assign-item" data-status="marking" data-search="12c kinetics homework homework">
                                <div class="assign-main">
                                    <p class="assign-kicker"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>12C</span><span class="gb-type t-homework">Homework</span></p>
                                    <h3 class="assign-title"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=12C">Kinetics homework</a></h3>
                                    <p class="assign-meta"><span>Set Tue 22 Sep</span><span>Due Thu 24 Sep</span><span>25 marks</span><span>3 criteria</span></p>
                                </div>
                                <div class="assign-progress">
                                    <p><span>Handed in</span><strong>14/14</strong></p>
                                    <div class="meter" role="img" aria-label="14 of 14 handed in"><span style="width:100%"></span></div>
                                    <p><span>Marked</span><strong>8/14</strong></p>
                                    <div class="meter meter-accent" role="img" aria-label="8 of 14 marked"><span style="width:57%"></span></div>
                                </div>
                                <span class="pill pill-marking">To mark</span>
                            </li>
                            <li class="assign-item" data-status="marking" data-search="9r diffusion practical practical">
                                <div class="assign-main">
                                    <p class="assign-kicker"><span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>9R</span><span class="gb-type t-practical">Practical</span></p>
                                    <h3 class="assign-title"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=9R">Diffusion practical</a></h3>
                                    <p class="assign-meta"><span>Set Tue 22 Sep</span><span>Due Wed 23 Sep</span><span>25 marks</span><span>4 criteria</span></p>
                                </div>
                                <div class="assign-progress">
                                    <p><span>Handed in</span><strong>27/27</strong></p>
                                    <div class="meter" role="img" aria-label="27 of 27 handed in"><span style="width:100%"></span></div>
                                    <p><span>Marked</span><strong>13/27</strong></p>
                                    <div class="meter meter-accent" role="img" aria-label="13 of 27 marked"><span style="width:48%"></span></div>
                                </div>
                                <span class="pill pill-marking">To mark</span>
                            </li>
                            <li class="assign-item" data-status="marking" data-search="8k acids and alkalis quiz quiz">
                                <div class="assign-main">
                                    <p class="assign-kicker"><span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>8K</span><span class="gb-type t-quiz">Quiz</span></p>
                                    <h3 class="assign-title"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=8K">Acids and alkalis quiz</a></h3>
                                    <p class="assign-meta"><span>Set Wed 23 Sep</span><span>Due Wed 23 Sep</span><span>15 marks</span><span>1 criterion</span></p>
                                </div>
                                <div class="assign-progress">
                                    <p><span>Handed in</span><strong>30/30</strong></p>
                                    <div class="meter" role="img" aria-label="30 of 30 handed in"><span style="width:100%"></span></div>
                                    <p><span>Marked</span><strong>21/30</strong></p>
                                    <div class="meter meter-accent" role="img" aria-label="21 of 30 marked"><span style="width:70%"></span></div>
                                </div>
                                <span class="pill pill-marking">To mark</span>
                            </li>
                            <li class="assign-item" data-status="open" data-search="10b specific heat capacity write-up practical">
                                <div class="assign-main">
                                    <p class="assign-kicker"><span class="chip chip-phys"><span class="chip-dot" aria-hidden="true"></span>10B</span><span class="gb-type t-practical">Practical</span></p>
                                    <h3 class="assign-title"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=10B">Specific heat capacity write-up</a></h3>
                                    <p class="assign-meta"><span>Set Thu 24 Sep</span><span>Due Thu 1 Oct</span><span>30 marks</span><span>5 criteria</span></p>
                                </div>
                                <div class="assign-progress">
                                    <p><span>Handed in</span><strong>0/24</strong></p>
                                    <div class="meter" role="img" aria-label="0 of 24 handed in"><span style="width:0%"></span></div>
                                    <p><span>Marked</span><strong>0/0</strong></p>
                                    <div class="meter meter-accent" role="img" aria-label="0 of 0 marked"><span style="width:0%"></span></div>
                                </div>
                                <span class="pill pill-open">Open</span>
                            </li>
                            <li class="assign-item" data-status="open" data-search="13c electrode potentials problem set homework">
                                <div class="assign-main">
                                    <p class="assign-kicker"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>13C</span><span class="gb-type t-homework">Homework</span></p>
                                    <h3 class="assign-title"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=13C">Electrode potentials problem set</a></h3>
                                    <p class="assign-meta"><span>Set Tue 22 Sep</span><span>Due Tue 29 Sep</span><span>30 marks</span><span>3 criteria</span></p>
                                </div>
                                <div class="assign-progress">
                                    <p><span>Handed in</span><strong>4/11</strong></p>
                                    <div class="meter" role="img" aria-label="4 of 11 handed in"><span style="width:36%"></span></div>
                                    <p><span>Marked</span><strong>0/4</strong></p>
                                    <div class="meter meter-accent" role="img" aria-label="0 of 4 marked"><span style="width:0%"></span></div>
                                </div>
                                <span class="pill pill-open">Open</span>
                            </li>
                            <li class="assign-item" data-status="open" data-search="11b electrolysis homework homework">
                                <div class="assign-main">
                                    <p class="assign-kicker"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>11B</span><span class="gb-type t-homework">Homework</span></p>
                                    <h3 class="assign-title"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=11B">Electrolysis homework</a></h3>
                                    <p class="assign-meta"><span>Set Wed 23 Sep</span><span>Due Wed 30 Sep</span><span>20 marks</span><span>3 criteria</span></p>
                                </div>
                                <div class="assign-progress">
                                    <p><span>Handed in</span><strong>6/24</strong></p>
                                    <div class="meter" role="img" aria-label="6 of 24 handed in"><span style="width:25%"></span></div>
                                    <p><span>Marked</span><strong>0/6</strong></p>
                                    <div class="meter meter-accent" role="img" aria-label="0 of 6 marked"><span style="width:0%"></span></div>
                                </div>
                                <span class="pill pill-open">Open</span>
                            </li>
                            <li class="assign-item" data-status="open" data-search="7h distillation worksheet homework">
                                <div class="assign-main">
                                    <p class="assign-kicker"><span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>7H</span><span class="gb-type t-homework">Homework</span></p>
                                    <h3 class="assign-title"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=7H">Distillation worksheet</a></h3>
                                    <p class="assign-meta"><span>Set Fri 25 Sep</span><span>Due Fri 2 Oct</span><span>20 marks</span><span>2 criteria</span></p>
                                </div>
                                <div class="assign-progress">
                                    <p><span>Handed in</span><strong>0/28</strong></p>
                                    <div class="meter" role="img" aria-label="0 of 28 handed in"><span style="width:0%"></span></div>
                                    <p><span>Marked</span><strong>0/0</strong></p>
                                    <div class="meter meter-accent" role="img" aria-label="0 of 0 marked"><span style="width:0%"></span></div>
                                </div>
                                <span class="pill pill-open">Open</span>
                            </li>
                            <li class="assign-item" data-status="returned" data-search="10b energy and circuits test test">
                                <div class="assign-main">
                                    <p class="assign-kicker"><span class="chip chip-phys"><span class="chip-dot" aria-hidden="true"></span>10B</span><span class="gb-type t-test">Test</span></p>
                                    <h3 class="assign-title"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=10B">Energy and circuits test</a></h3>
                                    <p class="assign-meta"><span>Set Tue 22 Sep</span><span>Due Tue 22 Sep</span><span>50 marks</span><span>1 criterion</span></p>
                                </div>
                                <div class="assign-progress">
                                    <p><span>Handed in</span><strong>24/24</strong></p>
                                    <div class="meter" role="img" aria-label="24 of 24 handed in"><span style="width:100%"></span></div>
                                    <p><span>Marked</span><strong>24/24</strong></p>
                                    <div class="meter meter-accent" role="img" aria-label="24 of 24 marked"><span style="width:100%"></span></div>
                                </div>
                                <span class="pill pill-returned">Returned</span>
                            </li>
                            <li class="assign-item" data-status="returned" data-search="13c electrochemistry test test">
                                <div class="assign-main">
                                    <p class="assign-kicker"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>13C</span><span class="gb-type t-test">Test</span></p>
                                    <h3 class="assign-title"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=13C">Electrochemistry test</a></h3>
                                    <p class="assign-meta"><span>Set Tue 22 Sep</span><span>Due Tue 22 Sep</span><span>50 marks</span><span>1 criterion</span></p>
                                </div>
                                <div class="assign-progress">
                                    <p><span>Handed in</span><strong>11/11</strong></p>
                                    <div class="meter" role="img" aria-label="11 of 11 handed in"><span style="width:100%"></span></div>
                                    <p><span>Marked</span><strong>11/11</strong></p>
                                    <div class="meter meter-accent" role="img" aria-label="11 of 11 marked"><span style="width:100%"></span></div>
                                </div>
                                <span class="pill pill-returned">Returned</span>
                            </li>
                            <li class="assign-item" data-status="returned" data-search="7h chromatography write-up practical">
                                <div class="assign-main">
                                    <p class="assign-kicker"><span class="chip chip-sci"><span class="chip-dot" aria-hidden="true"></span>7H</span><span class="gb-type t-practical">Practical</span></p>
                                    <h3 class="assign-title"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=7H">Chromatography write-up</a></h3>
                                    <p class="assign-meta"><span>Set Tue 22 Sep</span><span>Due Tue 22 Sep</span><span>25 marks</span><span>4 criteria</span></p>
                                </div>
                                <div class="assign-progress">
                                    <p><span>Handed in</span><strong>28/28</strong></p>
                                    <div class="meter" role="img" aria-label="28 of 28 handed in"><span style="width:100%"></span></div>
                                    <p><span>Marked</span><strong>28/28</strong></p>
                                    <div class="meter meter-accent" role="img" aria-label="28 of 28 marked"><span style="width:100%"></span></div>
                                </div>
                                <span class="pill pill-returned">Returned</span>
                            </li>
                            <li class="assign-item" data-status="returned" data-search="12c energetics test test">
                                <div class="assign-main">
                                    <p class="assign-kicker"><span class="chip chip-chem"><span class="chip-dot" aria-hidden="true"></span>12C</span><span class="gb-type t-test">Test</span></p>
                                    <h3 class="assign-title"><a href="${pageContext.request.contextPath}/enseignant/gradebook.jsp?class=12C">Energetics test</a></h3>
                                    <p class="assign-meta"><span>Set Fri 18 Sep</span><span>Due Fri 18 Sep</span><span>50 marks</span><span>1 criterion</span></p>
                                </div>
                                <div class="assign-progress">
                                    <p><span>Handed in</span><strong>14/14</strong></p>
                                    <div class="meter" role="img" aria-label="14 of 14 handed in"><span style="width:100%"></span></div>
                                    <p><span>Marked</span><strong>14/14</strong></p>
                                    <div class="meter meter-accent" role="img" aria-label="14 of 14 marked"><span style="width:100%"></span></div>
                                </div>
                                <span class="pill pill-returned">Returned</span>
                            </li>
                        </ul>
                        <p class="empty-note" id="assign-empty" hidden>No assignments match. Try another filter.</p>
                    </section>
                </div>

                <div class="col-xl-5">
                    <section class="card-desk card-form" id="new-assignment" aria-labelledby="new-title" tabindex="-1">
                        <header class="card-desk-head">
                            <div>
                                <p class="card-eyebrow">New task</p>
                                <h2 id="new-title" class="card-title">Create assignment</h2>
                            </div>
                        </header>
                        <form id="assign-form" class="desk-form" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="as-title">Title</label>
                                <input type="text" class="form-control" id="as-title" name="title" placeholder="e.g. Electrolysis of brine write-up" required aria-describedby="as-title-err">
                                <p class="field-error" id="as-title-err">Give the assignment a title.</p>
                            </div>
                            <div class="row g-3 mb-3">
                                <div class="col-sm-7">
                                    <label class="form-label" for="as-class">Class</label>
                                    <select class="form-select" id="as-class" name="class" required aria-describedby="as-class-err">
                                        <option value="">Choose a class</option><option value="7H">7H Science · Year 7</option><option value="8K">8K Science · Year 8</option><option value="9R">9R Science · Year 9</option><option value="10B">10B Physics · Year 10</option><option value="11B">11B Chemistry · Year 11</option><option value="12C">12C Chemistry · Year 12</option><option value="13C">13C Chemistry · Year 13</option>
                                    </select>
                                    <p class="field-error" id="as-class-err">Choose which class this is for.</p>
                                </div>
                                <div class="col-sm-5">
                                    <label class="form-label" for="as-type">Type</label>
                                    <select class="form-select" id="as-type" name="type">
                                        <option>Homework</option><option>Practical</option><option>Test</option><option>Quiz</option><option>Essay</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row g-3 mb-3">
                                <div class="col-sm-6">
                                    <label class="form-label" for="as-set">Set on</label>
                                    <input type="date" class="form-control" id="as-set" name="set" value="2026-09-24">
                                </div>
                                <div class="col-sm-6">
                                    <label class="form-label" for="as-due">Due</label>
                                    <input type="date" class="form-control" id="as-due" name="due" required aria-describedby="as-due-err">
                                    <p class="field-error" id="as-due-err">Pick a due date on or after the set date.</p>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="as-notes">Instructions for students <span class="optional">optional</span></label>
                                <textarea class="form-control" id="as-notes" name="notes" rows="3" placeholder="What to hand in, word limits, safety notes"></textarea>
                            </div>

                            <fieldset class="rubric" aria-describedby="rubric-err">
                                <legend class="rubric-legend">Rubric <span class="rubric-total" id="rubric-total" aria-live="polite"><strong>30</strong> points in total</span></legend>
                                <div class="rubric-bar" id="rubric-bar" aria-hidden="true"></div>
                                <ol class="rubric-list" id="rubric-list">
                                    <li class="rubric-row">
                                        <span class="rubric-num" aria-hidden="true">1</span>
                                        <div class="rubric-field rubric-name">
                                            <label class="visually-hidden" for="crit-name-1">Criterion 1</label>
                                            <input type="text" class="form-control" id="crit-name-1" value="Hypothesis and variables" required>
                                        </div>
                                        <div class="rubric-field rubric-points">
                                            <label class="visually-hidden" for="crit-pts-1">Points for criterion 1</label>
                                            <input type="number" class="form-control" id="crit-pts-1" value="6" min="1" max="100" step="1" inputmode="numeric" required>
                                            <span class="rubric-unit" aria-hidden="true">pts</span>
                                        </div>
                                        <button type="button" class="icon-btn icon-btn-sm rubric-remove" aria-label="Remove criterion 1"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 6h18M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg></button>
                                    </li>
                                    <li class="rubric-row">
                                        <span class="rubric-num" aria-hidden="true">2</span>
                                        <div class="rubric-field rubric-name">
                                            <label class="visually-hidden" for="crit-name-2">Criterion 2</label>
                                            <input type="text" class="form-control" id="crit-name-2" value="Method and risk assessment" required>
                                        </div>
                                        <div class="rubric-field rubric-points">
                                            <label class="visually-hidden" for="crit-pts-2">Points for criterion 2</label>
                                            <input type="number" class="form-control" id="crit-pts-2" value="8" min="1" max="100" step="1" inputmode="numeric" required>
                                            <span class="rubric-unit" aria-hidden="true">pts</span>
                                        </div>
                                        <button type="button" class="icon-btn icon-btn-sm rubric-remove" aria-label="Remove criterion 2"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 6h18M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg></button>
                                    </li>
                                    <li class="rubric-row">
                                        <span class="rubric-num" aria-hidden="true">3</span>
                                        <div class="rubric-field rubric-name">
                                            <label class="visually-hidden" for="crit-name-3">Criterion 3</label>
                                            <input type="text" class="form-control" id="crit-name-3" value="Results table and graph" required>
                                        </div>
                                        <div class="rubric-field rubric-points">
                                            <label class="visually-hidden" for="crit-pts-3">Points for criterion 3</label>
                                            <input type="number" class="form-control" id="crit-pts-3" value="10" min="1" max="100" step="1" inputmode="numeric" required>
                                            <span class="rubric-unit" aria-hidden="true">pts</span>
                                        </div>
                                        <button type="button" class="icon-btn icon-btn-sm rubric-remove" aria-label="Remove criterion 3"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 6h18M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg></button>
                                    </li>
                                    <li class="rubric-row">
                                        <span class="rubric-num" aria-hidden="true">4</span>
                                        <div class="rubric-field rubric-name">
                                            <label class="visually-hidden" for="crit-name-4">Criterion 4</label>
                                            <input type="text" class="form-control" id="crit-name-4" value="Conclusion and evaluation" required>
                                        </div>
                                        <div class="rubric-field rubric-points">
                                            <label class="visually-hidden" for="crit-pts-4">Points for criterion 4</label>
                                            <input type="number" class="form-control" id="crit-pts-4" value="6" min="1" max="100" step="1" inputmode="numeric" required>
                                            <span class="rubric-unit" aria-hidden="true">pts</span>
                                        </div>
                                        <button type="button" class="icon-btn icon-btn-sm rubric-remove" aria-label="Remove criterion 4"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M3 6h18M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg></button>
                                    </li>
                                </ol>
                                <button type="button" class="btn btn-quiet btn-sm" id="rubric-add"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M12 5v14M5 12h14"/></svg>Add criterion</button>
                                <p class="field-error" id="rubric-err">Each criterion needs a name and between 1 and 100 points.</p>
                            </fieldset>

                            <div class="form-check mt-3">
                                <input class="form-check-input" type="checkbox" id="as-share" checked>
                                <label class="form-check-label" for="as-share">Show the rubric to students with the task</label>
                            </div>
                            <div class="form-check mb-4">
                                <input class="form-check-input" type="checkbox" id="as-late">
                                <label class="form-check-label" for="as-late">Accept late hand-ins</label>
                            </div>
                            <div class="form-actions">
                                <button type="reset" class="btn btn-outline">Clear</button>
                                <button type="submit" class="btn btn-primary"><svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false"><path d="M20 6 9 17l-5-5"/></svg>Create assignment</button>
                            </div>
                            <p class="form-success" id="assign-success" role="status" tabindex="-1" hidden></p>
                        </form>
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
