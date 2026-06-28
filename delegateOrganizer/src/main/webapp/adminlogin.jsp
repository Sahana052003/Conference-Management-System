<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Confynity – Collaborate · Grow</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;900&family=DM+Serif+Display:ital@0;1&display=swap" rel="stylesheet"/>

  <style>
    :root {
      --cyan:    #5ee7e7;
      --purple:  #7b6fc4;
      --gold:    #f59e0b;
      --nav-bg:  #0e1422;
      --bg:      #0b101c;
      --card-bg: #0f172a;
      --border:  rgba(94,231,231,0.12);
      --err:     #f87171;
      --ok:      #34d399;
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    html { scroll-behavior: smooth; }

    body {
      font-family: 'Outfit', sans-serif;
      background: var(--bg);
      color: #e2e8f0;
      padding-top: 68px;
      overflow-x: hidden;
    }

    /* ── ERROR SPANS (matching adminregister.jsp) ── */
    .err-span {
      color: var(--err);
      font-size: .73rem;
      display: flex;
      align-items: center;
      gap: 4px;
      margin-top: 5px;
      min-height: 16px;
    }
    .err-span:empty { display: none; }
    .ok-span {
      color: var(--ok);
      font-size: .73rem;
      display: flex;
      align-items: center;
      gap: 4px;
      margin-top: 5px;
      min-height: 16px;
    }
    .ok-span:empty { display: none; }

    /* NAVBAR  */
    .navbar {
      background: rgba(14,20,34,0.95);
      backdrop-filter: blur(12px);
      border-bottom: 1px solid var(--border);
      padding: 0.5rem 1.5rem;
      position: fixed; top: 0; width: 100%; z-index: 1000;
      transition: background 0.3s;
    }
    .navbar-brand img { width: 44px; height: 44px; border-radius: 50%; }
    .brand-name {
      font-weight: 700; font-size: 1.25rem;
      background: linear-gradient(135deg, var(--cyan), var(--purple));
      -webkit-background-clip: text; -webkit-text-fill-color: transparent;
    }
    .brand-tag { font-size: 0.6rem; color: rgba(94,231,231,0.5); letter-spacing: 1px; }
    .nav-link { color: rgba(226,232,240,0.7) !important; font-size: 0.88rem; transition: color 0.2s; padding: 0.4rem 0.75rem !important; }
    .nav-link:hover, .nav-link.active { color: var(--cyan) !important; }
    .dropdown-menu { background: #151d30; border: 1px solid var(--border); border-radius: 10px; padding: 6px; }
    .dropdown-item { color: #e2e8f0; border-radius: 6px; font-size: 0.85rem; padding: 7px 14px; }
    .dropdown-item:hover { background: rgba(94,231,231,0.08); color: var(--cyan); }
    .btn-admin {
      background: linear-gradient(135deg, var(--cyan), var(--purple));
      border: none; color: #000; font-weight: 700;
      border-radius: 8px; padding: 6px 18px; font-size: 0.82rem;
      transition: opacity 0.2s, transform 0.15s;
    }
    .btn-admin:hover { opacity: 0.88; transform: translateY(-1px); color: #000; }

    /* ── HERO ── */
    .hero {
      position: relative; min-height: 92vh;
      display: flex; align-items: center; justify-content: flex-start;
      padding: 0 8% 0;
      overflow: hidden;
    }
    .hero-bg {
      position: absolute; inset: 0;
      background: url('https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=1600') center/cover no-repeat;
      filter: blur(6px) brightness(0.35);
      transform: scale(1.08);
      z-index: 0;
    }
    .hero-overlay {
      position: absolute; inset: 0; z-index: 1;
      background: linear-gradient(135deg, rgba(11,16,28,0.85) 40%, rgba(94,231,231,0.08) 100%);
    }
    .hero-particles { position: absolute; inset: 0; z-index: 1; overflow: hidden; }
    .particle {
      position: absolute; border-radius: 50%;
      background: var(--cyan); opacity: 0.12;
      animation: float-up linear infinite;
    }
    @keyframes float-up {
      from { transform: translateY(100vh) scale(0); opacity: 0; }
      10%  { opacity: 0.15; }
      90%  { opacity: 0.08; }
      to   { transform: translateY(-10vh) scale(1); opacity: 0; }
    }
    .hero-content {
      position: relative; z-index: 3;
      max-width: 660px;
      animation: fadeInUp 0.9s ease both;
    }
    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(40px); }
      to   { opacity: 1; transform: translateY(0); }
    }
    .hero-badge {
      display: inline-flex; align-items: center; gap: 8px;
      background: rgba(94,231,231,0.1); border: 1px solid rgba(94,231,231,0.25);
      border-radius: 100px; padding: 5px 16px;
      font-size: 0.75rem; color: var(--cyan); letter-spacing: 1px;
      text-transform: uppercase; margin-bottom: 24px;
      animation: fadeInUp 0.9s 0.1s ease both;
    }
    .hero-badge span { width: 6px; height: 6px; border-radius: 50%; background: var(--cyan); animation: pulse 2s infinite; }
    @keyframes pulse { 0%,100% { opacity: 1; } 50% { opacity: 0.3; } }
    .hero h1 {
      font-family: 'DM Serif Display', serif;
      font-size: clamp(2.4rem, 5vw, 4rem);
      line-height: 1.1; color: #fff;
      margin-bottom: 20px;
      animation: fadeInUp 0.9s 0.2s ease both;
    }
    .hero h1 em { font-style: italic; color: var(--cyan); }
    .hero p {
      font-size: 1.1rem; color: rgba(226,232,240,0.75);
      line-height: 1.7; max-width: 520px;
      margin-bottom: 32px;
      animation: fadeInUp 0.9s 0.3s ease both;
    }
    .hero-btns { display: flex; gap: 14px; flex-wrap: wrap; animation: fadeInUp 0.9s 0.4s ease both; }
    .btn-hero-primary {
      padding: 13px 30px; border-radius: 10px; font-weight: 700;
      background: linear-gradient(135deg, var(--cyan), var(--purple));
      color: #000; border: none; font-size: 0.95rem;
      transition: opacity 0.2s, transform 0.15s; text-decoration: none;
    }
    .btn-hero-primary:hover { opacity: 0.88; transform: translateY(-2px); color: #000; }
    .btn-hero-outline {
      padding: 13px 30px; border-radius: 10px; font-weight: 600;
      border: 1px solid rgba(94,231,231,0.35); color: var(--cyan);
      background: rgba(94,231,231,0.05); font-size: 0.95rem;
      text-decoration: none; transition: all 0.2s;
    }
    .btn-hero-outline:hover { background: rgba(94,231,231,0.12); color: var(--cyan); transform: translateY(-2px); }
    .hero-stats { display: flex; gap: 36px; margin-top: 48px; flex-wrap: wrap; animation: fadeInUp 0.9s 0.5s ease both; }
    .hero-stat h3 { font-size: 1.8rem; font-weight: 700; color: var(--cyan); line-height: 1; }
    .hero-stat p  { font-size: 0.78rem; color: rgba(226,232,240,0.5); margin: 4px 0 0; text-transform: uppercase; letter-spacing: 0.5px; }

    /* ── SECTION SHARED ── */
    .section-label { font-size: 0.72rem; font-weight: 700; letter-spacing: 2px; text-transform: uppercase; color: var(--cyan); margin-bottom: 10px; }
    .section-title { font-family: 'DM Serif Display', serif; font-size: clamp(1.8rem, 3vw, 2.4rem); color: #fff; line-height: 1.2; }
    .section-sub { color: rgba(226,232,240,0.55); font-size: 0.95rem; margin-top: 10px; }

    /* ── FEATURES ── */
    .features-section { background: #080d18; padding: 90px 0; }
    .feat-card {
      background: var(--card-bg); border: 1px solid var(--border);
      border-radius: 16px; padding: 30px; height: 100%;
      transition: transform 0.3s, border-color 0.3s, box-shadow 0.3s;
      position: relative; overflow: hidden;
    }
    .feat-card::before {
      content: ''; position: absolute; inset: 0;
      background: linear-gradient(135deg, rgba(94,231,231,0.04) 0%, transparent 60%);
      opacity: 0; transition: opacity 0.3s;
    }
    .feat-card:hover { transform: translateY(-6px); border-color: rgba(94,231,231,0.3); box-shadow: 0 20px 40px rgba(0,0,0,0.4); }
    .feat-card:hover::before { opacity: 1; }
    .feat-icon { width: 48px; height: 48px; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 1.4rem; margin-bottom: 18px; background: rgba(94,231,231,0.1); color: var(--cyan); }
    .feat-card h5 { font-weight: 700; font-size: 1rem; margin-bottom: 10px; color: #f1f5f9; }
    .feat-card p  { font-size: 0.88rem; color: rgba(226,232,240,0.55); line-height: 1.7; margin: 0; }
    .feat-link { color: var(--cyan); font-size: 0.82rem; font-weight: 600; text-decoration: none; margin-top: 16px; display: inline-flex; align-items: center; gap: 4px; }
    .feat-link:hover { gap: 8px; }

    /* ── STATS STRIP ── */
    .stats-strip { background: linear-gradient(135deg, rgba(94,231,231,0.06), rgba(123,111,196,0.06)); border-top: 1px solid var(--border); border-bottom: 1px solid var(--border); padding: 50px 0; }
    .stat-item { text-align: center; }
    .stat-item h3 { font-size: 2.6rem; font-weight: 900; line-height: 1; background: linear-gradient(135deg, var(--cyan), var(--purple)); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
    .stat-item p { color: rgba(226,232,240,0.5); font-size: 0.82rem; margin-top: 6px; text-transform: uppercase; letter-spacing: 1px; }

    /* ── VIDEO SECTION ── */
    .video-section { padding: 90px 0; background: var(--bg); }
    .video-wrap { border-radius: 16px; overflow: hidden; border: 1px solid var(--border); position: relative; }
    .video-wrap iframe { width: 100%; height: 360px; border: none; display: block; }

    /* ── IMAGE GRID ── */
    .gallery-section { padding: 80px 0; background: #080d18; }
    .gallery-item { position: relative; border-radius: 12px; overflow: hidden; }
    .gallery-item img { width: 100%; height: 220px; object-fit: cover; display: block; transition: transform 0.4s; }
    .gallery-item:hover img { transform: scale(1.06); }
    .gallery-caption { position: absolute; bottom: 0; left: 0; right: 0; background: linear-gradient(to top, rgba(0,0,0,0.85), transparent); padding: 20px 16px 14px; color: #fff; font-weight: 600; font-size: 0.85rem; transform: translateY(4px); transition: transform 0.3s; }
    .gallery-item:hover .gallery-caption { transform: translateY(0); }

    /* ── MAILING ── */
    .mailing-section { background: linear-gradient(135deg, #0a0f1c, #111827); border-top: 1px solid var(--border); border-bottom: 1px solid var(--border); padding: 60px 0; }
    .mailing-input { background: #080d18; border: 1px solid var(--border); color: #e2e8f0; border-radius: 10px; padding: 12px 18px; font-family: 'Outfit', sans-serif; width: 100%; outline: none; transition: border-color 0.2s; }
    .mailing-input::placeholder { color: #334155; }
    .mailing-input:focus { border-color: var(--cyan); }
    .btn-mail { background: linear-gradient(135deg, var(--cyan), var(--purple)); border: none; color: #000; font-weight: 700; border-radius: 10px; padding: 12px 28px; font-family: 'Outfit', sans-serif; cursor: pointer; transition: opacity 0.2s; }
    .btn-mail:hover { opacity: 0.88; }

    /* ── FOOTER ── */
    footer { background: #0e1422; padding: 60px 0 0; }
    .footer-logo-name { font-weight: 700; font-size: 1.2rem; background: linear-gradient(135deg, var(--cyan), var(--purple)); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
    .footer-desc { color: rgba(226,232,240,0.45); font-size: 0.83rem; line-height: 1.7; margin-top: 10px; }
    footer h6 { color: #fff; font-weight: 700; font-size: 0.8rem; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 16px; }
    footer ul { list-style: none; padding: 0; }
    footer ul li { margin-bottom: 9px; }
    footer ul li a { color: rgba(226,232,240,0.45); text-decoration: none; font-size: 0.83rem; transition: color 0.2s; }
    footer ul li a:hover { color: var(--cyan); }
    .social-link { display: inline-flex; align-items: center; gap: 8px; color: rgba(226,232,240,0.45); text-decoration: none; font-size: 0.83rem; margin-bottom: 10px; transition: color 0.2s; }
    .social-link:hover { color: var(--cyan); }
    .footer-bottom { background: #070b14; margin-top: 50px; padding: 18px 0; font-size: 0.78rem; color: rgba(226,232,240,0.3); border-top: 1px solid rgba(94,231,231,0.06); }
    .footer-bottom a { color: rgba(226,232,240,0.3); text-decoration: none; transition: color 0.2s; }
    .footer-bottom a:hover { color: var(--cyan); }

    /* ── LIGHT MODE ── */
    body.light { background: #f8fafc; color: #0f172a; }
    body.light .navbar  { background: rgba(255,255,255,0.95); border-bottom-color: #e2e8f0; }
    body.light .nav-link { color: #475569 !important; }
    body.light .nav-link:hover { color: #0891b2 !important; }
    body.light .dropdown-menu { background: #fff; border-color: #e2e8f0; }
    body.light .dropdown-item { color: #334155; }
    body.light .dropdown-item:hover { background: #f0fdfa; color: #0891b2; }
    body.light .features-section, body.light .gallery-section { background: #f1f5f9; }
    body.light .feat-card { background: #fff; border-color: #e2e8f0; }
    body.light .feat-card h5 { color: #0f172a; }
    body.light .feat-card p  { color: #64748b; }
    body.light .stats-strip { background: #f8fafc; }
    body.light .stat-item p  { color: #94a3b8; }
    body.light .video-section { background: #f8fafc; }
    body.light .mailing-section { background: #f1f5f9; }
    body.light .mailing-input { background: #fff; border-color: #e2e8f0; color: #0f172a; }
    body.light footer { background: #1e293b; }
    body.light .footer-bottom { background: #0f172a; }

    .theme-btn { background: none; border: 1px solid var(--border); color: #e2e8f0; border-radius: 8px; padding: 5px 11px; cursor: pointer; transition: all 0.2s; }
    .theme-btn:hover { border-color: var(--cyan); color: var(--cyan); }
    body.light .theme-btn { color: #334155; border-color: #e2e8f0; }

    /* ── MODAL INPUT STYLE (matching adminregister.jsp) ── */
    .modal-field-input {
      width: 100%; background: rgba(7,11,20,0.85);
      border: 1px solid rgba(94,231,231,0.1); color: #e2e8f0;
      border-radius: 11px; padding: 11px 14px;
      font-family: 'Outfit', sans-serif; font-size: .9rem;
      outline: none; transition: border-color .2s, box-shadow .2s;
    }
    .modal-field-input::placeholder { color: #334155; }
    .modal-field-input:focus        { border-color: var(--cyan); box-shadow: 0 0 0 3px rgba(94,231,231,.1); }
    .modal-field-input.is-invalid   { border-color: var(--err) !important; box-shadow: 0 0 0 3px rgba(248,113,113,.1) !important; }
    .modal-field-input.is-valid     { border-color: var(--ok); }

    /* scroll reveal */
    .reveal { opacity: 0; transform: translateY(30px); transition: opacity 0.6s ease, transform 0.6s ease; }
    .reveal.visible { opacity: 1; transform: translateY(0); }
  </style>
</head>
<body>

<!--   ADMIN LOGIN MODAL  -->
<div id="loginModalOverlay"
     style="display:none; position:fixed; inset:0; background:rgba(0,0,0,0.6);
            z-index:2000; align-items:center; justify-content:center;">
  <div style="background:#0e1524; border:1px solid rgba(94,231,231,0.15);
              border-radius:18px; padding:28px 30px; width:100%; max-width:420px;
              margin:16px; box-shadow:0 20px 60px rgba(0,0,0,0.7);">

    <!-- Modal Header -->
    <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:20px;">
      <div style="font-size:.7rem;font-weight:700;letter-spacing:1.5px;
                  text-transform:uppercase;color:var(--cyan);">
        Admin Login
      </div>
      <button onclick="closeLoginModal()"
              style="background:none;border:none;color:#475569;
                     font-size:1.2rem;cursor:pointer;line-height:1;">
        <i class="bi bi-x-lg"></i>
      </button>
    </div>

    <form action="adminloginCheck" method="post" onsubmit="return validateModalLoginForm()">

      <!-- ══ EMAIL ══ -->
      <div style="margin-bottom:12px;">
        <label style="font-size:.72rem;font-weight:700;color:#64748b;
                      text-transform:uppercase;letter-spacing:.6px;
                      display:block;margin-bottom:6px;">
          Registered Email
        </label>
        <input type="email" name="email" id="modalEmail"
               class="modal-field-input"
               placeholder="admin@gmail.com"
               autocomplete="email" required />

        <%-- Server-side error (works when JS is OFF) --%>
        <span class="err-span" id="modalEmailServerErr">
          <%= request.getAttribute("emailError") != null ? request.getAttribute("emailError") : "" %>
        </span>
        <%-- JS-side error (works when JS is ON) --%>
        <span class="err-span" id="modalEmailJsErr"></span>
      </div>

      <!-- ══ PASSWORD ══ -->
      <div style="margin-bottom:14px;">
        <label style="font-size:.72rem;font-weight:700;color:#64748b;
                      text-transform:uppercase;letter-spacing:.6px;
                      display:block;margin-bottom:6px;">
          Password
        </label>
        <div style="position:relative;">
          <input type="password" name="password" id="modalPassword"
                 class="modal-field-input"
                 placeholder="Enter your password"
                 style="padding-right:42px;"
                 autocomplete="current-password" required />
          <button type="button"
                  onclick="toggleModalPass()"
                  style="position:absolute;right:12px;top:50%;
                         transform:translateY(-50%);background:none;
                         border:none;color:#334155;cursor:pointer;
                         font-size:1rem;padding:0;">
            <i class="bi bi-eye" id="modalPassEye"></i>
          </button>
        </div>

        <%-- Server-side error --%>
        <span class="err-span" id="modalPassServerErr">
          <%= request.getAttribute("passwordError") != null ? request.getAttribute("passwordError") : "" %>
        </span>
        <%-- JS-side error --%>
        <span class="err-span" id="modalPassJsErr"></span>
      </div>

      <!-- ══ SUCCESS & LOGIN ERROR ══ -->
      <span class="ok-span" id="modalSuccessServerErr">
        <%= request.getAttribute("loginSuccess") != null ? request.getAttribute("loginSuccess") : "" %>
      </span>
      <span class="err-span" id="modalLoginServerErr">
        <%= request.getAttribute("loginError") != null ? request.getAttribute("loginError") : "" %>
      </span>

      <!-- Remember me / Forgot -->
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:18px;margin-top:10px;">
        <label style="display:flex;align-items:center;gap:8px;
                      font-size:.8rem;color:#64748b;cursor:pointer;">
          <input type="checkbox" id="mRemember"> Remember me
        </label>
        <a href="#" style="font-size:.78rem;color:var(--cyan);
                           opacity:.75;text-decoration:none;">
          Forgot password?
        </a>
      </div>

      <button type="submit" id="mLoginBtn"
              style="width:100%;padding:12px;border:none;border-radius:11px;
                     background:linear-gradient(135deg,var(--cyan),var(--purple));
                     color:#000;font-weight:700;font-size:.92rem;
                     font-family:'Outfit',sans-serif;cursor:pointer;">
        Login to Admin Panel
      </button>
    </form>

    <div style="text-align:center;font-size:.8rem;color:#475569;margin-top:14px;">
      New admin?
      <a href="adminregister"
         style="color:var(--gold);text-decoration:none;font-weight:600;">
        Register credentials
      </a>
    </div>
  </div>
</div>


<!--  NAVBAR -->
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid px-4">

    <a class="navbar-brand d-flex align-items-center gap-2 text-decoration-none" href="index">
      <img src="https://ideogram.ai/assets/image/balanced/response/Nag0uxrjTcOAlHEs4ys2Wg@2k" alt="logo"/>
      <div>
        <div class="brand-name">Confynity</div>
        <div class="brand-tag">COLLABORATE · GROW</div>
      </div>
    </a>

    <button class="navbar-toggler border-0" data-bs-toggle="collapse" data-bs-target="#mainNav"
            style="color:#5ee7e7;">
      <i class="bi bi-list fs-4"></i>
    </button>

    <div class="collapse navbar-collapse" id="mainNav">
      <ul class="navbar-nav mx-auto gap-1">
        <li class="nav-item"><a class="nav-link active" href="index">Home</a></li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Conference</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#"><i class="bi bi-people me-2 opacity-50"></i>Team Management</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-bar-chart me-2 opacity-50"></i>Analytics</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-bell me-2 opacity-50"></i>Notifications</a></li>
          </ul>
        </li>

        <li class="nav-item"><a class="nav-link" href="#">Services</a></li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Networking</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#"><i class="bi bi-file-text me-2 opacity-50"></i>Documentation</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-chat-dots me-2 opacity-50"></i>Community</a></li>
          </ul>
        </li>

        <li class="nav-item"><a class="nav-link" href="#">Register Conference</a></li>
        <li class="nav-item"><a class="nav-link" href="#">About</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
      </ul>

      <div class="d-flex align-items-center gap-3">
        <div class="dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Login</a>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="#"><i class="bi bi-person me-2 opacity-50"></i>Delegate</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-building me-2 opacity-50"></i>Organizer</a></li>
            <li><hr class="dropdown-divider" style="border-color:rgba(94,231,231,0.1);"></li>
          </ul>
        </div>
        <button class="btn-admin" onclick="openLoginModal()">Admin Login</button>

        <button id="themeToggle" class="theme-btn">
          <i id="themeIcon" class="bi bi-moon"></i>
        </button>
      </div>
    </div>
  </div>
</nav>

<%-- ── Login success toast banner ── --%>
<c:if test="${not empty loginSuccess}">
  <div id="loginToast"
       style="position:fixed;top:80px;right:24px;z-index:9999;
              background:#0e1524;border:1px solid rgba(52,211,153,.35);
              border-radius:14px;padding:16px 20px;min-width:300px;
              box-shadow:0 10px 40px rgba(0,0,0,.5);
              display:flex;align-items:flex-start;gap:12px;
              animation:slideIn .4s ease both;">
    <i class="bi bi-check-circle-fill" style="color:#34d399;font-size:1.3rem;margin-top:2px;"></i>
    <div>
      <div style="font-weight:700;color:#34d399;font-size:.9rem;margin-bottom:3px;">Login Successful!</div>
      <div style="color:rgba(226,232,240,.7);font-size:.82rem;"><c:out value="${loginSuccess}"/></div>
    </div>
    <button onclick="document.getElementById('loginToast').style.display='none'"
            style="margin-left:auto;background:none;border:none;color:#475569;cursor:pointer;font-size:1.1rem;padding:0;">
      <i class="bi bi-x-lg"></i>
    </button>
  </div>
  <style>
    @keyframes slideIn { from{opacity:0;transform:translateX(30px);} to{opacity:1;transform:translateX(0);} }
  </style>
  <script>
    setTimeout(function(){
      const t = document.getElementById('loginToast');
      if(t){ t.style.transition='opacity .4s'; t.style.opacity='0'; setTimeout(()=>t.remove(),400); }
    }, 5000);
  </script>
</c:if>


<!--  HERO  -->
<section class="hero">
  <div class="hero-bg"></div>
  <div class="hero-overlay"></div>
  <div class="hero-particles" id="particles"></div>

  <div class="hero-content">
    <div class="hero-badge">
      <span></span> Now live — Confynity 2026
    </div>

    <h1>Register Your<br><em>Conference</em><br>for Free</h1>

    <p>The all-in-one platform for conference organizers and delegates.
       Streamline registration, networking, and management in one place.</p>

    <div class="hero-btns">
      <a href="#" class="btn-hero-primary">
        <i class="bi bi-rocket-takeoff me-2"></i>Register Now
      </a>
      <a href="#features" class="btn-hero-outline">
        <i class="bi bi-play-circle me-2"></i>See How It Works
      </a>
    </div>

    <div class="hero-stats">
      <div class="hero-stat"><h3>950+</h3><p>Attendees</p></div>
      <div class="hero-stat"><h3>32</h3><p>Countries</p></div>
      <div class="hero-stat"><h3>40+</h3><p>Exhibitors</p></div>
      <div class="hero-stat"><h3>268</h3><p>Buyers</p></div>
    </div>
  </div>
</section>


<!--   FEATURES  -->
<section class="features-section" id="features">
  <div class="container">
    <div class="text-center mb-5 reveal">
      <div class="section-label">Networking Solutions</div>
      <h2 class="section-title">Everything you need to<br>run great conferences</h2>
      <p class="section-sub">Hybrid · Virtual · In-person</p>
    </div>

    <div class="row g-4">
      <div class="col-md-4 reveal">
        <div class="feat-card">
          <div class="feat-icon"><i class="bi bi-calendar-check"></i></div>
          <h5>Self-scheduled Meetings</h5>
          <p>Attendees pre-arrange meetings during breaks to maximize networking opportunities with ease.</p>
          <a href="#" class="feat-link">Learn more <i class="bi bi-arrow-right"></i></a>
        </div>
      </div>
      <div class="col-md-4 reveal">
        <div class="feat-card">
          <div class="feat-icon" style="background:rgba(123,111,196,0.12);color:var(--purple);"><i class="bi bi-stars"></i></div>
          <h5>Curated by Organizer</h5>
          <p>VIP and speaker meetings curated by organizers for premium networking opportunities for sponsors.</p>
          <a href="#" class="feat-link">Learn more <i class="bi bi-arrow-right"></i></a>
        </div>
      </div>
      <div class="col-md-4 reveal">
        <div class="feat-card">
          <div class="feat-icon" style="background:rgba(245,158,11,0.12);color:var(--gold);"><i class="bi bi-lightning-charge"></i></div>
          <h5>Speed Networking</h5>
          <p>Opt-in speed networking sessions create spontaneous and meaningful connections between attendees.</p>
          <a href="#" class="feat-link">Learn more <i class="bi bi-arrow-right"></i></a>
        </div>
      </div>
      <div class="col-md-4 reveal">
        <div class="feat-card">
          <div class="feat-icon"><i class="bi bi-graph-up-arrow"></i></div>
          <h5>Real-time Analytics</h5>
          <p>Track attendance, engagement, and ROI with live dashboards and downloadable reports.</p>
          <a href="#" class="feat-link">Learn more <i class="bi bi-arrow-right"></i></a>
        </div>
      </div>
      <div class="col-md-4 reveal">
        <div class="feat-card">
          <div class="feat-icon" style="background:rgba(123,111,196,0.12);color:var(--purple);"><i class="bi bi-bell-fill"></i></div>
          <h5>Smart Notifications</h5>
          <p>Automated email and push notifications keep delegates informed before, during, and after the event.</p>
          <a href="#" class="feat-link">Learn more <i class="bi bi-arrow-right"></i></a>
        </div>
      </div>
      <div class="col-md-4 reveal">
        <div class="feat-card">
          <div class="feat-icon" style="background:rgba(245,158,11,0.12);color:var(--gold);"><i class="bi bi-shield-check"></i></div>
          <h5>Secure Management</h5>
          <p>Role-based access for admins, organizers, and delegates with AES-encrypted data protection.</p>
          <a href="#" class="feat-link">Learn more <i class="bi bi-arrow-right"></i></a>
        </div>
      </div>
    </div>
  </div>
</section>


<!--  STATS STRIP  -->
<section class="stats-strip reveal">
  <div class="container">
    <div class="row g-4 text-center">
      <div class="col-6 col-md-3"><div class="stat-item"><h3>950+</h3><p>Attendees</p></div></div>
      <div class="col-6 col-md-3"><div class="stat-item"><h3>32</h3><p>Countries</p></div></div>
      <div class="col-6 col-md-3"><div class="stat-item"><h3>268</h3><p>Buyers</p></div></div>
      <div class="col-6 col-md-3"><div class="stat-item"><h3>40+</h3><p>Exhibitors</p></div></div>
    </div>
  </div>
</section>


<!--   VIDEO SECTION  -->
<section class="video-section">
  <div class="container">
    <div class="row align-items-center g-5">
      <div class="col-lg-5 reveal">
        <div class="section-label">Platform Overview</div>
        <h2 class="section-title">Smart Delegate<br>Management System</h2>
        <p class="section-sub mt-3">From registration to engagement, everything is managed in one place.
           Organizers handle attendee data, automate workflows, and deliver personalized experiences.</p>
        <a href="#" class="btn-hero-primary d-inline-block mt-4 text-decoration-none">
          <i class="bi bi-play-fill me-2"></i>Watch Demo
        </a>
      </div>
      <div class="col-lg-7 reveal">
        <div class="video-wrap">
          <iframe src="https://www.youtube.com/embed/ZNjtkfFNa58?autoplay=1&mute=1&loop=1&playlist=ZNjtkfFNa58&controls=0&modestbranding=1"
                  allow="autoplay; encrypted-media" allowfullscreen></iframe>
        </div>
      </div>
    </div>

    <div class="row g-4 mt-5">
      <div class="col-lg-3 col-md-6 reveal">
        <div class="video-wrap"><iframe src="https://www.youtube.com/embed/PN7Pv23FrWg?autoplay=1&mute=1&loop=1&playlist=PN7Pv23FrWg&controls=0" allow="autoplay; encrypted-media" loading="lazy" allowfullscreen style="height:180px;"></iframe></div>
      </div>
      <div class="col-lg-3 col-md-6 reveal">
        <div class="video-wrap"><iframe src="https://www.youtube.com/embed/FVztK5ZD9_o?autoplay=1&mute=1&loop=1&playlist=FVztK5ZD9_o&controls=0" allow="autoplay; encrypted-media" loading="lazy" allowfullscreen style="height:180px;"></iframe></div>
      </div>
      <div class="col-lg-3 col-md-6 reveal">
        <div class="video-wrap"><iframe src="https://www.youtube.com/embed/3DcFnwFAwPw?autoplay=1&mute=1&loop=1&playlist=3DcFnwFAwPw&controls=0" allow="autoplay; encrypted-media" loading="lazy" allowfullscreen style="height:180px;"></iframe></div>
      </div>
      <div class="col-lg-3 col-md-6 reveal">
        <div class="video-wrap"><iframe src="https://www.youtube.com/embed/ibHvdCfQHEs?autoplay=1&mute=1&loop=1&playlist=ibHvdCfQHEs&controls=0" allow="autoplay; encrypted-media" loading="lazy" allowfullscreen style="height:180px;"></iframe></div>
      </div>
    </div>
  </div>
</section>


<!--  IMAGE GALLERY -->
<section class="gallery-section">
  <div class="container">
    <div class="text-center mb-5 reveal">
      <div class="section-label">Gallery</div>
      <h2 class="section-title">Conference Moments</h2>
    </div>
    <div class="row g-4">
      <div class="col-md-4 reveal">
        <div class="gallery-item">
          <img src="https://apacconference.gbta.org/wp-content/uploads/2025/10/2026-sponsorship-banner.webp" alt="Sponsorship">
          <div class="gallery-caption">2026 Sponsorship Opportunities</div>
        </div>
      </div>
      <div class="col-md-4 reveal">
        <div class="gallery-item">
          <img src="https://media.istockphoto.com/id/2224119114/photo/overhead-crowd-shot-professionals-connecting-at-event.jpg?s=612x612&w=0&k=20&c=GXyjyp0iIJq_5THlyncG90Dc1Kfm76748sDnjAhnHck=" alt="Conference">
          <div class="gallery-caption">Conference Venue</div>
        </div>
      </div>
      <div class="col-md-4 reveal">
        <div class="gallery-item">
          <img src="https://media.istockphoto.com/id/499517325/photo/a-man-speaking-at-a-business-conference.jpg?s=612x612&w=0&k=20&c=gWTTDs_Hl6AEGOunoQ2LsjrcTJkknf9G8BGqsywyEtE=" alt="Speaker">
          <div class="gallery-caption">Keynote Sessions</div>
        </div>
      </div>
      <div class="col-md-4 reveal">
        <div class="gallery-item">
          <img src="https://apacconference.gbta.org/wp-content/uploads/2025/10/at-a-galnce-banner.webp" alt="Exhibitor">
          <div class="gallery-caption">2026 Exhibitor Opportunities</div>
        </div>
      </div>
      <div class="col-md-4 reveal">
        <div class="gallery-item">
          <img src="https://media.istockphoto.com/id/2184773511/photo/corporate-crowd-engaging-in-teamwork-during-business-event-in-modern-office-space.jpg?s=612x612&w=0&k=20&c=6IW-W0R2vZjZ26BqGS7UytmfrXUoq4bhKjUiSslpwgU=" alt="Teamwork">
          <div class="gallery-caption">Bring Your Boss Offer</div>
        </div>
      </div>
      <div class="col-md-4 reveal">
        <div class="gallery-item">
          <img src="https://apacconference.gbta.org/wp-content/uploads/2026/01/Bring-Your-Boss-1024x683.webp" alt="ROI">
          <div class="gallery-caption">ROI — Justify Your Attendance</div>
        </div>
      </div>
    </div>
  </div>
</section>


<!--  MAILING LIST  -->
<section class="mailing-section reveal">
  <div class="container">
    <div class="row align-items-center justify-content-center g-4">
      <div class="col-lg-4 text-center text-lg-start">
        <div class="section-label">Stay Updated</div>
        <h3 style="color:#fff;font-weight:700;">Join our Mailing List</h3>
      </div>
      <div class="col-lg-4">
        <input type="email" class="mailing-input" placeholder="Enter your email address">
      </div>
      <div class="col-lg-2">
        <button class="btn-mail w-100">JOIN</button>
      </div>
    </div>
    <p class="text-center mt-3" style="color:rgba(226,232,240,0.3);font-size:0.78rem;">
      I agree to receive communications and can unsubscribe anytime.
    </p>
  </div>
</section>


<!--  FOOTER  -->
<footer>
  <div class="container">
    <div class="row g-5">
      <div class="col-lg-4">
        <div class="d-flex align-items-center gap-2 mb-3">
          <img src="https://ideogram.ai/assets/image/balanced/response/Nag0uxrjTcOAlHEs4ys2Wg@2k" style="width:36px;height:36px;border-radius:50%;" alt="logo">
          <div class="footer-logo-name">Confynity</div>
        </div>
        <p class="footer-desc">The smart conference delegate management system. Built for modern events that demand seamless coordination and real results.</p>
        <div class="mt-3">
          <a href="#" class="social-link d-block"><i class="bi bi-facebook me-2"></i>Facebook</a>
          <a href="#" class="social-link d-block"><i class="bi bi-instagram me-2"></i>Instagram</a>
          <a href="#" class="social-link d-block"><i class="bi bi-twitter-x me-2"></i>Twitter / X</a>
          <a href="#" class="social-link d-block"><i class="bi bi-linkedin me-2"></i>LinkedIn</a>
        </div>
      </div>
      <div class="col-6 col-lg-2">
        <h6>Platform</h6>
        <ul>
          <li><a href="#">How It Works</a></li>
          <li><a href="#">Plans & Pricing</a></li>
          <li><a href="#">Register Conference</a></li>
          <li><a href="adminlogin">Admin Login</a></li>
        </ul>
      </div>
      <div class="col-6 col-lg-2">
        <h6>Company</h6>
        <ul>
          <li><a href="#">About Us</a></li>
          <li><a href="#">Services</a></li>
          <li><a href="#">Our Partners</a></li>
          <li><a href="#">Careers</a></li>
        </ul>
      </div>
      <div class="col-6 col-lg-2">
        <h6>Support</h6>
        <ul>
          <li><a href="#">Contact Us</a></li>
          <li><a href="#">FAQs</a></li>
          <li><a href="#">Media Center</a></li>
          <li><a href="#">Refund Policy</a></li>
        </ul>
      </div>
      <div class="col-6 col-lg-2">
        <h6>Legal</h6>
        <ul>
          <li><a href="#">Terms & Conditions</a></li>
          <li><a href="#">Privacy Policy</a></li>
          <li><a href="#">Disclaimer</a></li>
        </ul>
      </div>
    </div>
  </div>

  <div class="footer-bottom mt-5">
    <div class="container d-flex justify-content-between align-items-center flex-wrap gap-2">
      <div>&copy; 2026 Smart Conference Private Limited. All rights reserved.</div>
      <div>
        <a href="#">Terms</a>&nbsp;·&nbsp;
        <a href="#">Privacy</a>&nbsp;·&nbsp;
        <a href="#">Disclaimer</a>
      </div>
    </div>
  </div>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>

  /*  AUTO-OPEN MODAL if server sent back errors */
  <% if (request.getAttribute("loginError")    != null ||
         request.getAttribute("emailError")    != null ||
         request.getAttribute("passwordError") != null) { %>
    window.addEventListener('DOMContentLoaded', openLoginModal);
  <% } %>


  /*   MODAL OPEN / CLOSE */
  function openLoginModal() {
    document.getElementById('loginModalOverlay').style.display = 'flex';
    document.body.style.overflow = 'hidden';
  }

  function closeLoginModal() {
    document.getElementById('loginModalOverlay').style.display = 'none';
    document.body.style.overflow = '';
  }

  document.getElementById('loginModalOverlay').addEventListener('click', function(e) {
    if (e.target === this) closeLoginModal();
  });


  /*   HELPERS  (same pattern as adminregister.jsp)  */
  function showModalError(inputEl, jsErrSpanId, message) {
    inputEl.classList.add('is-invalid');
    inputEl.classList.remove('is-valid');
    document.getElementById(jsErrSpanId).innerText = message;
  }

  function clearModalError(inputEl, jsErrSpanId) {
    inputEl.classList.remove('is-invalid');
    inputEl.classList.add('is-valid');
    document.getElementById(jsErrSpanId).innerText = '';
  }

  function clearAllModalErrors() {
    ['modalEmail', 'modalPassword'].forEach(function(id) {
      document.getElementById(id).classList.remove('is-invalid', 'is-valid');
    });
    ['modalEmailJsErr', 'modalPassJsErr'].forEach(function(id) {
      document.getElementById(id).innerText = '';
    });
  }


  /*  VALIDATE ON SUBMIT  */
  function validateModalLoginForm() {
    clearAllModalErrors();
    var isValid  = true;
    var emailEl  = document.getElementById('modalEmail');
    var passEl   = document.getElementById('modalPassword');

    // Email validation
    if (!emailEl.value.trim()) {
      showModalError(emailEl, 'modalEmailJsErr', 'Email cannot be empty');
      isValid = false;
    } else if (!emailEl.value.trim().includes('@')) {
      showModalError(emailEl, 'modalEmailJsErr', 'Enter a valid email address');
      isValid = false;
    }

    // Password validation
    if (!passEl.value) {
      showModalError(passEl, 'modalPassJsErr', 'Password cannot be empty');
      isValid = false;
    } else if (passEl.value.length < 8) {
      showModalError(passEl, 'modalPassJsErr', 'Password must be at least 8 characters');
      isValid = false;
    }

    return isValid;
  }


  /*  LIVE KEYUP VALIDATION  */
  document.getElementById('modalEmail').addEventListener('keyup', function() {
    if (!this.value.trim()) {
      showModalError(this, 'modalEmailJsErr', 'Email cannot be empty');
    } else if (!this.value.trim().includes('@')) {
      showModalError(this, 'modalEmailJsErr', 'Enter a valid email address');
    } else {
      clearModalError(this, 'modalEmailJsErr');
    }
  });

  document.getElementById('modalPassword').addEventListener('keyup', function() {
    if (!this.value) {
      showModalError(this, 'modalPassJsErr', 'Password cannot be empty');
    } else if (this.value.length < 8) {
      showModalError(this, 'modalPassJsErr', 'Password must be at least 8 characters');
    } else {
      clearModalError(this, 'modalPassJsErr');
    }
  });


  /*  EYE TOGGLE  */
  function toggleModalPass() {
    var input = document.getElementById('modalPassword');
    var icon  = document.getElementById('modalPassEye');
    if (input.type === 'password') {
      input.type     = 'text';
      icon.className = 'bi bi-eye-slash';
    } else {
      input.type     = 'password';
      icon.className = 'bi bi-eye';
    }
  }


  /*  THEME TOGGLE  */
  const themeBtn  = document.getElementById('themeToggle');
  const themeIcon = document.getElementById('themeIcon');
  if (localStorage.getItem('theme') === 'light') {
    document.body.classList.add('light');
    themeIcon.className = 'bi bi-sun';
  }
  themeBtn.addEventListener('click', () => {
    document.body.classList.toggle('light');
    const isLight = document.body.classList.contains('light');
    themeIcon.className = isLight ? 'bi bi-sun' : 'bi bi-moon';
    localStorage.setItem('theme', isLight ? 'light' : 'dark');
  });


  /*  SCROLL REVEAL */
  const reveals  = document.querySelectorAll('.reveal');
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((e, i) => {
      if (e.isIntersecting) {
        setTimeout(() => e.target.classList.add('visible'), i * 80);
        observer.unobserve(e.target);
      }
    });
  }, { threshold: 0.1 });
  reveals.forEach(r => observer.observe(r));

</script>
</body>
</html>
