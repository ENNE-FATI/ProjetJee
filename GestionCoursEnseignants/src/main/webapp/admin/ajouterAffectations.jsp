<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Assignment - Kiaalap Dashboard</title>
    
    <script type="module" crossorigin src="assets/main-ZZRh_wak.js"></script>
    <link rel="stylesheet" crossorigin href="assets/main-BV-wpnXD.css">
    <link rel="stylesheet" crossorigin href="assets/main-DVYj-QCH.css">
    
    <style>
        *{box-sizing:border-box;margin:0;padding:0}
        body{background:#f5f7fa;font-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,sans-serif}
        .sidebar{z-index:1040;background:#1f2937;width:260px;height:100vh;position:fixed;top:0;left:0}
        .main-wrapper{min-height:100vh;margin-left:260px;transition:margin-left .3s}
        .top-navbar{background:#fff;height:60px;padding:0 1rem;box-shadow:0 1px 3px #0000001a}
        .dashboard-content{padding:24px}
    </style>
</head>
<body>
    <div class="sidebar-overlay" id="sidebarOverlay"></div>

<!-- Sidebar -->
<aside class="sidebar" id="sidebar">
    <div class="sidebar-header">
        <div class="sidebar-brand">
            <h5><i class="bi bi-mortarboard-fill"></i> Kiaalap</h5>
            <button type="button" class="sidebar-close" id="sidebarClose"><i class="bi bi-x-lg"></i></button>
        </div>
    </div>
    <nav class="sidebar-nav">
        <div class="menu-section">
            <div class="menu-section-title">Main</div>
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link" href="dashboard.jsp"><i class="bi bi-speedometer2"></i><span>Dashboard</span></a></li>
            </ul>
        </div>
        <div class="menu-section">
            <div class="menu-section-title">Academic</div>
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link" href="listeEnseignants.jsp"><i class="bi bi-person-badge"></i><span>Teachers</span></a></li>
                <li class="nav-item"><a class="nav-link" href="listeCours.jsp"><i class="bi bi-book"></i><span>Courses</span></a></li>
                <li class="nav-item">
                    <a class="nav-link has-submenu active" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#affectationsSubmenu" aria-expanded="true">
                        <i class="bi bi-link-45deg"></i><span>Assignments</span>
                    </a>
                    <ul id="affectationsSubmenu" class="submenu collapse show list-unstyled">
                        <li><a class="nav-link" href="affectations.jsp">All Assignments</a></li>
                        <li><a class="nav-link active" href="ajouterAffectation.jsp">New Assignment</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</aside>

<div class="main-wrapper" id="mainWrapper">
    <header class="navbar top-navbar">
        <div class="container-fluid d-flex align-items-center h-100">
            <button type="button" class="hamburger-menu" id="sidebarToggle"><i class="bi bi-list"></i></button>
            <nav class="d-none d-lg-block ms-3">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="affectations.jsp">Assignments</a></li>
                    <li class="breadcrumb-item active">New Assignment</li>
                </ol>
            </nav>
        </div>
    </header>

    <main class="dashboard-content" id="main-content">
        <div class="container-fluid">
            <div class="mb-4">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h1 class="h3 font-bold">New Assignment</h1>
                        <p class="text-muted text-sm">Assign a teacher to a course for a specific semester.</p>
                    </div>
                    <div>
                        <a href="affectations.jsp" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left me-2"></i>Back to List
                        </a>
                    </div>
                </div>
            </div>

            <!-- Formulaire -->
            <form id="addAffectationForm" action="ajouterAffectation" method="POST" class="needs-validation" novalidate>
                <div class="dashboard-row">
                    <div class="dashboard-card">
                        <div class="dashboard-card-header">
                            <h5 class="mb-0">Assignment Details</h5>
                        </div>
                        <div class="dashboard-card-body">
                            <div class="dashboard-grid grid-cols-2 gap-3">
                                
                                <!-- Choix du Cours (Nom des champs importants pour le Servlet) -->
                                <div>
                                    <label for="idCours" class="form-label">Course <span class="text-danger">*</span></label>
                                    <select class="form-select" id="idCours" name="idCours" required>
                                        <option value="">Select a course...</option>
                                        <!-- C'est ici que votre binôme injectera la liste des cours via JSTL (c:forEach) -->
                                        <option value="1">CS101 - Java Programming</option>
                                        <option value="2">MATH201 - Linear Algebra</option>
                                        <option value="3">PHY301 - Quantum Mechanics</option>
                                    </select>
                                    <div class="invalid-feedback">Please select a course.</div>
                                </div>

                                <!-- Choix de l'Enseignant -->
                                <div>
                                    <label for="idEnseignant" class="form-label">Teacher <span class="text-danger">*</span></label>
                                    <select class="form-select" id="idEnseignant" name="idEnseignant" required>
                                        <option value="">Select a teacher...</option>
                                        <!-- C'est ici que votre binôme injectera la liste des enseignants via JSTL -->
                                        <option value="1">Dr. John Smith (CS)</option>
                                        <option value="2">Dr. Sarah Johnson (Math)</option>
                                        <option value="3">Prof. Michael Brown (Physics)</option>
                                    </select>
                                    <div class="invalid-feedback">Please select a teacher.</div>
                                </div>

                                <!-- Semestre -->
                                <div>
                                    <label for="semestre" class="form-label">Semester <span class="text-danger">*</span></label>
                                    <select class="form-select" id="semestre" name="semestre" required>
                                        <option value="">Select a semester...</option>
                                        <option value="Fall 2025">Fall 2025</option>
                                        <option value="Spring 2026">Spring 2026</option>
                                        <option value="Summer 2026">Summer 2026</option>
                                    </select>
                                    <div class="invalid-feedback">Please select a semester.</div>
                                </div>

                                <!-- Nombre d'heures -->
                                <div>
                                    <label for="heures" class="form-label">Number of Hours <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" id="heures" name="heures" min="1" max="200" placeholder="e.g., 40" required>
                                    <div class="invalid-feedback">Please enter a valid number of hours.</div>
                                </div>

                                <!-- Date de début -->
                                <div>
                                    <label for="dateDebut" class="form-label">Start Date</label>
                                    <input type="date" class="form-control" id="dateDebut" name="dateDebut">
                                </div>

                                <!-- Date de fin -->
                                <div>
                                    <label for="dateFin" class="form-label">End Date</label>
                                    <input type="date" class="form-control" id="dateFin" name="dateFin">
                                </div>

                                <!-- Commentaires -->
                                <div class="col-span-2">
                                    <label for="commentaires" class="form-label">Comments / Remarks</label>
                                    <textarea class="form-control" id="commentaires" name="commentaires" rows="3" placeholder="Add any additional details if necessary..."></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Boutons d'action -->
                <div class="dashboard-row">
                    <div class="dashboard-card">
                        <div class="dashboard-card-body d-flex justify-content-end gap-2">
                            <button type="button" class="btn btn-outline-secondary" onclick="window.location.href='affectations.jsp'">Cancel</button>
                            <button type="reset" class="btn btn-outline-warning">Reset</button>
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-check-circle me-2"></i>Save Assignment
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </main>
    
    <footer class="dashboard-footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6"><p class="mb-0">&copy; 2026 Kiaalap. All rights reserved.</p></div>
            </div>
        </div>
    </footer>
</div>
</body>
</html>