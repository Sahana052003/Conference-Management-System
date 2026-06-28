<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register Admin – Confynity</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700&display=swap" rel="stylesheet"/>
  <style>
    :root {
      --cyan:#5ee7e7; --purple:#7b6fc4; --gold:#f59e0b;
      --bg:#070b14; --err:#f87171; --ok:#34d399;
      --border:rgba(94,231,231,0.13);
    }
    *, *::before, *::after { box-sizing:border-box; margin:0; padding:0; }
    body {
      font-family:'Outfit',sans-serif; background:var(--bg);
      min-height:100vh; display:flex; align-items:center;
      justify-content:center; padding:40px 16px;
      position:relative; overflow-x:hidden;
    }
    .bg-layer { position:fixed;  z-index:0; }
    .bg-layer::before {
      content:''; position:absolute; inset:0;
      background-image:
        linear-gradient(rgba(94,231,231,0.035) 1px,transparent 1px),
        linear-gradient(90deg,rgba(94,231,231,0.035) 1px,transparent 1px);
      background-size:44px 44px;
    }
    .blob { position:absolute; border-radius:50%; filter:blur(90px); animation:blobDrift ease-in-out infinite alternate; }
    .b1 { width:480px;height:480px;background:var(--cyan);opacity:.07;top:-140px;left:-140px;animation-duration:14s; }
    .b2 { width:400px;height:400px;background:var(--purple);opacity:.09;bottom:-120px;right:-100px;animation-duration:18s;animation-delay:-9s; }
    .b3 { width:220px;height:220px;background:var(--gold);opacity:.04;top:55%;left:55%;animation-duration:11s;animation-delay:-4s; }
    @keyframes blobDrift { from{transform:translate(0,0) scale(1);} to{transform:translate(25px,18px) scale(1.06);} }

    .page-wrap { position:relative; z-index:10; width:100%; max-width:460px; display:flex; flex-direction:column; gap:20px; }
    .brand-row { display:flex; align-items:center; gap:12px; }
    .brand-row img { width:46px; height:46px; border-radius:50%; }
    .brand-name { font-weight:700; font-size:1.4rem; background:linear-gradient(135deg,var(--cyan),var(--purple)); -webkit-background-clip:text; -webkit-text-fill-color:transparent; }
    .brand-tag  { font-size:.6rem; color:rgba(94,231,231,.45); letter-spacing:1px; }
    .section-lbl { font-size:.7rem; font-weight:700; letter-spacing:1.5px; text-transform:uppercase; color:var(--gold); }
    .panel { background:#0e1524; border:1px solid var(--border); border-radius:18px; padding:28px 30px; box-shadow:0 20px 50px rgba(0,0,0,0.5); }

    .field       { margin-bottom:14px; }
    .field-label { display:block; font-size:.72rem; font-weight:700; color:#64748b; text-transform:uppercase; letter-spacing:.6px; margin-bottom:6px; }
    .field-wrap  { position:relative; }
    .field-icon  { position:absolute; left:13px; top:50%; transform:translateY(-50%); color:#334155; font-size:.9rem; pointer-events:none; transition:color .2s; }
    .field-wrap:focus-within .field-icon { color:var(--cyan); }

    .field-input {
      width:100%; background:rgba(7,11,20,.85);
      border:1px solid rgba(94,231,231,.1); color:#e2e8f0;
      border-radius:11px; padding:11px 14px 11px 38px;
      font-family:'Outfit',sans-serif; font-size:.9rem;
      outline:none; transition:border-color .2s, box-shadow .2s;
    }
    .field-input::placeholder { color:#334155; }
    .field-input:focus        { border-color:var(--cyan); box-shadow:0 0 0 3px rgba(94,231,231,.1); }
    .field-input.is-invalid   { border-color:var(--err) !important; box-shadow:0 0 0 3px rgba(248,113,113,.1) !important; }
    .field-input.is-valid     { border-color:var(--ok); }

    .eye-btn { position:absolute; right:12px; top:50%; transform:translateY(-50%); background:none; border:none; color:#334155; cursor:pointer; font-size:1rem; padding:0; }
    .eye-btn:hover { color:var(--cyan); }

    /* ── error spans ── */
    .err-span { color:var(--err); font-size:.73rem; display:flex; align-items:center; gap:4px; margin-top:5px; }

    /* strength bar */
    .str-bar  { height:3px; border-radius:2px; margin-top:6px; background:#1e293b; overflow:hidden; }
    .str-fill { height:100%; border-radius:2px; width:0; transition:width .3s, background .3s; }
    .str-txt  { font-size:.68rem; color:#475569; margin-top:2px; }

    .btn-save {
      width:100%; padding:12px; border:none; border-radius:11px;
      background:linear-gradient(135deg,var(--gold),#ef4444);
      color:#fff; font-weight:700; font-size:.92rem;
      font-family:'Outfit',sans-serif; cursor:pointer;
      display:flex; align-items:center; justify-content:center; gap:8px;
      transition:opacity .2s, transform .15s;
    }
    .btn-save:hover    { opacity:.88; transform:translateY(-1px); }
    .btn-save:disabled { opacity:.5; cursor:not-allowed; transform:none; }
    .spin { width:15px; height:15px; border:2px solid rgba(255,255,255,.25); border-top-color:#fff; border-radius:50%; animation:spin .6s linear infinite; display:inline-block; }
    @keyframes spin { to { transform:rotate(360deg); } }
  </style>
</head>
<body>
<div class="bg-layer"><div class="blob b1"></div><div class="blob b2"></div><div class="blob b3"></div></div>

<div class="page-wrap">

  <div class="brand-row">
    <img src="https://ideogram.ai/assets/image/balanced/response/Nag0uxrjTcOAlHEs4ys2Wg@2k" alt="logo"/>
    <div><div class="brand-name">Confynity</div><div class="brand-tag">COLLABORATE · GROW</div></div>
  </div>

  <div class="section-lbl">Register Admin Credentials</div>

  <div class="panel">
    <form id="registerForm" action="adminregister" method="post"
          onsubmit="return validateRegisterForm()" novalidate>

      <%--  EMAIL --%>
      <div class="field">
        <label class="field-label" for="regEmail">Admin Email</label>
        <div class="field-wrap">
          <input type="email" id="regEmail" name="email"
                 class="field-input" placeholder="e.g. admin@gmail.com"
                 autocomplete="email" />
        </div>
        <%-- server-side error: Spring sets EmailError, EL prints it here --%>
        <span class="err-span" id="regEmailServerErr">${EmailError}</span>
        <%-- JS-side error: JS writes into this span --%>
        <span class="err-span" id="regEmailJsErr"></span>
      </div>

      <%-- ══ PASSWORD ══ --%>
      <div class="field">
        <label class="field-label" for="regPassword">Password</label>
        <div class="field-wrap">
          <input type="password" id="regPassword" name="password"
                 class="field-input"
                 placeholder="Min 8 · A-Z · 0-9 · !@#$%^&*"
                 style="padding-right:42px;" autocomplete="new-password"/>

        </div>

        <span class="err-span" id="regPassServerErr">${passwordError}</span>
        <span class="err-span" id="regPassJsErr"></span>
      </div>

      <%-- ══ CONFIRM PASSWORD ══ --%>
      <div class="field">
        <label class="field-label" for="regConfirm">Confirm Password</label>
        <div class="field-wrap">
          <input type="password" id="regConfirm" name="confirmPassword"
                 class="field-input" placeholder="Re-enter password"
                 style="padding-right:42px;" autocomplete="new-password"/>

        </div>
        <span class="err-span" id="regConfirmServerErr">${confirmPasswordError}</span>
        <span class="err-span" id="regConfirmJsErr"></span>
      </div>

      <button type="submit" class="btn-save" id="regSaveBtn">
       Save Admin
      </button>
    </form>
  </div>

</div><!-- end page-wrap -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>

  /* ── helpers ── */
  function showError(inputEl, jsErrSpanId, message) {
    inputEl.classList.add('is-invalid');
    inputEl.classList.remove('is-valid');
    document.getElementById(jsErrSpanId).innerText = message;
  }

  function clearError(inputEl, jsErrSpanId) {
    inputEl.classList.remove('is-invalid');
    inputEl.classList.add('is-valid');
    document.getElementById(jsErrSpanId).innerText = '';
  }

  function clearAllErrors() {
    ['regEmail','regPassword','regConfirm'].forEach(function(id) {
      document.getElementById(id).classList.remove('is-invalid','is-valid');
    });
    ['regEmailJsErr','regPassJsErr','regConfirmJsErr'].forEach(function(id) {
      document.getElementById(id).innerText = '';
    });
  }

  /* ── validate on submit ── */
  function validateRegisterForm() {
    clearAllErrors();
    var isValid  = true;
    var emailEl  = document.getElementById('regEmail');
    var passEl   = document.getElementById('regPassword');
    var confirmEl= document.getElementById('regConfirm');

    // email
    if (!emailEl.value.trim()) {
      showError(emailEl, 'regEmailJsErr', 'Email cannot be empty');
      isValid = false;
    } else if (!/^[a-zA-Z0-9._%+\-]+@gmail\.com$/.test(emailEl.value.trim())) {
      showError(emailEl, 'regEmailJsErr', 'Please enter a valid @gmail.com email');
      isValid = false;
    }

    // password
    if (!passEl.value) {
      showError(passEl, 'regPassJsErr', 'Password cannot be empty');
      isValid = false;
    } else if (passEl.value.length < 8) {
      showError(passEl, 'regPassJsErr', 'Password must be at least 8 characters');
      isValid = false;
    } else if (!/[A-Z]/.test(passEl.value)) {
      showError(passEl, 'regPassJsErr', 'Must contain an uppercase letter');
      isValid = false;
    } else if (!/[0-9]/.test(passEl.value)) {
      showError(passEl, 'regPassJsErr', 'Must contain a number');
      isValid = false;
    } else if (!/[!@#$%^&*]/.test(passEl.value)) {
      showError(passEl, 'regPassJsErr', 'Must contain a special character (!@#$%^&*)');
      isValid = false;
    }

    // confirm
    if (!confirmEl.value) {
      showError(confirmEl, 'regConfirmJsErr', 'Please confirm your password');
      isValid = false;
    } else if (confirmEl.value !== passEl.value) {
      showError(confirmEl, 'regConfirmJsErr', 'Passwords do not match');
      isValid = false;
    }

    if (isValid) {
      var btn = document.getElementById('regSaveBtn');
      btn.disabled = true;
      btn.innerHTML = '<span class="spin"></span> Saving…';
    }
    return isValid;
  }

  /* ── live keyup validation ── */
  document.getElementById('regEmail').addEventListener('keyup', function() {
    if (!this.value.trim()) {
      showError(this, 'regEmailJsErr', 'Email cannot be empty');
    } else if (!/^[a-zA-Z0-9._%+\-]+@gmail\.com$/.test(this.value.trim())) {
      showError(this, 'regEmailJsErr', 'Please enter a valid @gmail.com email');
    } else {
      clearError(this, 'regEmailJsErr');
    }
  });

  document.getElementById('regPassword').addEventListener('keyup', function() {
    var v = this.value;
    if (!v) {
      showError(this, 'regPassJsErr', 'Password cannot be empty');
    } else if (v.length < 8) {
      showError(this, 'regPassJsErr', 'Password must be at least 8 characters');
    } else if (!/[A-Z]/.test(v)) {
      showError(this, 'regPassJsErr', 'Must contain an uppercase letter');
    } else if (!/[0-9]/.test(v)) {
      showError(this, 'regPassJsErr', 'Must contain a number');
    } else if (!/[!@#$%^&*]/.test(v)) {
      showError(this, 'regPassJsErr', 'Must contain a special character (!@#$%^&*)');
    } else {
      clearError(this, 'regPassJsErr');
    }
    updateStrength(v);
    // re-check confirm if already typed
    var c = document.getElementById('regConfirm');
    if (c.value) {
      if (c.value !== v) {
        showError(c, 'regConfirmJsErr', 'Passwords do not match');
      } else {
        clearError(c, 'regConfirmJsErr');
      }
    }
  });

  document.getElementById('regConfirm').addEventListener('keyup', function() {
    var passVal = document.getElementById('regPassword').value;
    if (!this.value) {
      showError(this, 'regConfirmJsErr', 'Please confirm your password');
    } else if (this.value !== passVal) {
      showError(this, 'regConfirmJsErr', 'Passwords do not match');
    } else {
      clearError(this, 'regConfirmJsErr');
    }
  });

</script>
</body>
</html>