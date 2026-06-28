<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Conference Organizer – Login | Confynity</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;900&display=swap" rel="stylesheet"/>
  <style>
    /* Same base styles as register page */
    :root{--cyan:#5ee7e7;--purple:#7b6fc4;--gold:#f59e0b;--bg:#070b14;--card:#0e1524;--border:rgba(94,231,231,0.13);--err:#f87171;--ok:#34d399;}
    *,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
    body{font-family:'Outfit',sans-serif;background:var(--bg);min-height:100vh;display:flex;align-items:center;justify-content:center;padding:40px 16px;position:relative;overflow-x:hidden;color:#e2e8f0;}
    body::before{content:'';position:fixed;inset:0;z-index:0;background-image:linear-gradient(rgba(94,231,231,.03) 1px,transparent 1px),linear-gradient(90deg,rgba(94,231,231,.03) 1px,transparent 1px);background-size:44px 44px;pointer-events:none;}
    .blob{position:fixed;border-radius:50%;filter:blur(100px);pointer-events:none;z-index:0;animation:bd ease-in-out infinite alternate;}
    .b1{width:500px;height:500px;background:var(--gold);opacity:.05;top:-160px;left:-140px;animation-duration:16s;}
    .b2{width:420px;height:420px;background:var(--purple);opacity:.07;bottom:-120px;right:-100px;animation-duration:20s;animation-delay:-10s;}
    @keyframes bd{from{transform:translate(0,0)scale(1);}to{transform:translate(28px,18px)scale(1.06);}}
    .wrap{position:relative;z-index:10;width:100%;max-width:420px;}
    .brand-row{display:flex;align-items:center;gap:12px;margin-bottom:20px;}
    .brand-name{font-weight:700;font-size:1.35rem;background:linear-gradient(135deg,var(--cyan),var(--purple));-webkit-background-clip:text;-webkit-text-fill-color:transparent;}
    .brand-tag{font-size:.58rem;color:rgba(94,231,231,.4);letter-spacing:1px;}
    .step-lbl{font-size:.68rem;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:var(--gold);margin-bottom:10px;}
    .panel{background:var(--card);border:1px solid var(--border);border-radius:18px;padding:28px 30px;box-shadow:0 20px 60px rgba(0,0,0,.5);}
    .field{margin-bottom:14px;}
    .flbl{display:block;font-size:.7rem;font-weight:700;color:#64748b;text-transform:uppercase;letter-spacing:.6px;margin-bottom:5px;}
    .fwrap{position:relative;}
    .ficon{position:absolute;left:13px;top:50%;transform:translateY(-50%);color:#334155;font-size:.9rem;pointer-events:none;transition:color .2s;}
    .fwrap:focus-within .ficon{color:var(--gold);}
    .finput{width:100%;background:rgba(7,11,20,.9);border:1px solid rgba(94,231,231,.1);color:#e2e8f0;border-radius:11px;padding:11px 14px 11px 38px;font-family:'Outfit',sans-serif;font-size:.88rem;outline:none;transition:border-color .2s,box-shadow .2s;}
    .finput::placeholder{color:#1e293b;}
    .finput:focus{border-color:var(--gold);box-shadow:0 0 0 3px rgba(245,158,11,.08);}
    .finput.f-err{border-color:var(--err)!important;}
    .eye-btn{position:absolute;right:12px;top:50%;transform:translateY(-50%);background:none;border:none;color:#334155;cursor:pointer;font-size:1rem;padding:0;}
    .eye-btn:hover{color:var(--gold);}
    .alert-err{display:flex;align-items:center;gap:9px;border-radius:10px;padding:11px 14px;font-size:.82rem;margin-bottom:16px;background:rgba(248,113,113,.08);border:1px solid rgba(248,113,113,.25);color:var(--err);}
    .rem-row{display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;}
    .rem-label{display:flex;align-items:center;gap:8px;font-size:.8rem;color:#64748b;cursor:pointer;}
    .forgot{font-size:.78rem;color:var(--gold);opacity:.75;text-decoration:none;}
    .btn-login{width:100%;padding:12px;border:none;border-radius:11px;background:linear-gradient(135deg,var(--gold),#ef4444);color:#fff;font-weight:700;font-size:.92rem;font-family:'Outfit',sans-serif;cursor:pointer;display:flex;align-items:center;justify-content:center;gap:8px;transition:opacity .2s,transform .15s;}
    .btn-login:hover{opacity:.88;transform:translateY(-1px);}
    .bottom-link{text-align:center;font-size:.8rem;color:#475569;margin-top:14px;}
    .bottom-link a{color:var(--gold);text-decoration:none;font-weight:600;}
    .flow-indicator{display:flex;align-items:center;gap:8px;margin-bottom:16px;font-size:.72rem;color:rgba(226,232,240,.4);}
    .fi-step{background:rgba(52,211,153,.1);border:1px solid rgba(52,211,153,.25);color:var(--ok);border-radius:20px;padding:2px 10px;font-weight:700;font-size:.65rem;letter-spacing:.5px;}
    .fi-active{background:rgba(245,158,11,.12);border:1px solid rgba(245,158,11,.25);color:var(--gold);border-radius:20px;padding:2px 10px;font-weight:700;font-size:.65rem;}
    .fi-arrow{color:rgba(226,232,240,.25);}
  </style>
</head>
<body>
<div class="blob b1"></div><div class="blob b2"></div>
<div class="wrap">
  <div class="brand-row">
    <img src="https://ideogram.ai/assets/image/balanced/response/Nag0uxrjTcOAlHEs4ys2Wg@2k" alt="logo" style="width:44px;height:44px;border-radius:50%;"/>
    <div><div class="brand-name">Confynity</div><div class="brand-tag">CONFERENCE ORGANIZER PORTAL</div></div>
  </div>

  <div class="flow-indicator">
    <span class="fi-step">✓ Registered</span>
    <span class="fi-arrow">→</span>
    <span class="fi-active">2 Login</span>
    <span class="fi-arrow">→</span>
    <span>Add Event</span>
    <span class="fi-arrow">→</span>
    <span>Dashboard</span>
  </div>

  <div class="step-lbl"><i class="bi bi-shield-lock me-1"></i>Step 2 — Organizer Login</div>

  <div class="panel">
    <c:if test="${not empty loginError}">
      <div class="alert-err"><i class="bi bi-exclamation-circle-fill"></i><c:out value="${loginError}"/></div>
    </c:if>

    <form action="conferenceOrg/login" method="post">
      <div class="field">
        <label class="flbl" for="lEmail">Registered Email</label>
        <div class="fwrap">
          <i class="bi bi-envelope ficon"></i>
          <input type="email" id="lEmail" name="email" class="finput" placeholder="organizer@gmail.com"/>
        </div>
      </div>
      <div class="field">
        <label class="flbl" for="lPass">Password</label>
        <div class="fwrap">
          <i class="bi bi-lock ficon"></i>
          <input type="password" id="lPass" name="password" class="finput"
                 placeholder="Enter your password" style="padding-right:42px;"/>
          <button type="button" class="eye-btn" onclick="const i=document.getElementById('lPass'),e=document.getElementById('lEye');i.type=i.type==='password'?'text':'password';e.className=i.type==='password'?'bi bi-eye':'bi bi-eye-slash';">
            <i class="bi bi-eye" id="lEye"></i>
          </button>
        </div>
      </div>
      <div class="rem-row">
        <label class="rem-label"><input type="checkbox" id="orgRemember"> Remember me</label>
        <a href="#" class="forgot">Forgot password?</a>
      </div>
      <button type="submit" class="btn-login">
        <i class="bi bi-box-arrow-in-right"></i> Login to Organizer Portal
      </button>
    </form>
  </div>
  <div class="bottom-link">New organizer? <a href="conferenceOrg/register">Register here</a></div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>