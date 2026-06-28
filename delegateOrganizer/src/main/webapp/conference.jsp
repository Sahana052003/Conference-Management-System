<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Conference Organizer – Register | Confynity</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;900&family=DM+Serif+Display:ital@0;1&display=swap" rel="stylesheet"/>
  <style>
    :root{--cyan:#5ee7e7;--purple:#7b6fc4;--gold:#f59e0b;--bg:#070b14;--card:#0e1524;--border:rgba(94,231,231,0.13);--err:#f87171;--ok:#34d399;}
    *,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
    body{font-family:'Outfit',sans-serif;background:var(--bg);min-height:100vh;
         display:flex;align-items:center;justify-content:center;padding:40px 16px;
         position:relative;overflow-x:hidden;color:#e2e8f0;}
    body::before{content:'';position:fixed;inset:0;z-index:0;
      background-image:linear-gradient(rgba(94,231,231,.03) 1px,transparent 1px),
                       linear-gradient(90deg,rgba(94,231,231,.03) 1px,transparent 1px);
      background-size:44px 44px;pointer-events:none;}
    .blob{position:fixed;border-radius:50%;filter:blur(100px);pointer-events:none;z-index:0;animation:bd ease-in-out infinite alternate;}
    .b1{width:500px;height:500px;background:var(--gold);opacity:.05;top:-160px;left:-140px;animation-duration:16s;}
    .b2{width:420px;height:420px;background:var(--purple);opacity:.07;bottom:-120px;right:-100px;animation-duration:20s;animation-delay:-10s;}
    @keyframes bd{from{transform:translate(0,0)scale(1);}to{transform:translate(28px,18px)scale(1.06);}}
    .wrap{position:relative;z-index:10;width:100%;max-width:460px;}
    .brand-row{display:flex;align-items:center;gap:12px;margin-bottom:20px;}
    .brand-name{font-weight:700;font-size:1.35rem;background:linear-gradient(135deg,var(--cyan),var(--purple));-webkit-background-clip:text;-webkit-text-fill-color:transparent;}
    .brand-tag{font-size:.58rem;color:rgba(94,231,231,.4);letter-spacing:1px;}
    .step-lbl{font-size:.68rem;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:var(--gold);margin-bottom:10px;}
    .panel{background:var(--card);border:1px solid var(--border);border-radius:18px;padding:28px 30px;box-shadow:0 20px 60px rgba(0,0,0,.5);}
    .field{margin-bottom:14px;}
    .flbl{display:block;font-size:.7rem;font-weight:700;color:#64748b;text-transform:uppercase;letter-spacing:.6px;margin-bottom:5px;}
    .req{color:var(--err);margin-left:2px;}
    .fwrap{position:relative;}
    .ficon{position:absolute;left:13px;top:50%;transform:translateY(-50%);color:#334155;font-size:.9rem;pointer-events:none;transition:color .2s;}
    .fwrap:focus-within .ficon{color:var(--gold);}
    .finput{width:100%;background:rgba(7,11,20,.9);border:1px solid rgba(94,231,231,.1);color:#e2e8f0;border-radius:11px;padding:11px 14px 11px 38px;font-family:'Outfit',sans-serif;font-size:.88rem;outline:none;transition:border-color .2s,box-shadow .2s;}
    .finput::placeholder{color:#1e293b;}
    .finput:focus{border-color:var(--gold);box-shadow:0 0 0 3px rgba(245,158,11,.08);}
    .finput.f-err{border-color:var(--err)!important;}
    .finput.f-ok{border-color:rgba(52,211,153,.35);}
    .errtxt{font-size:.72rem;color:var(--err);margin-top:4px;display:none;align-items:center;gap:4px;}
    .errtxt.show{display:flex;}
    .str-bar{height:3px;border-radius:2px;margin-top:5px;background:#1e293b;overflow:hidden;}
    .str-fill{height:100%;border-radius:2px;width:0;transition:width .3s,background .3s;}
    .str-txt{font-size:.68rem;color:#475569;margin-top:2px;}
    .eye-btn{position:absolute;right:12px;top:50%;transform:translateY(-50%);background:none;border:none;color:#334155;cursor:pointer;font-size:1rem;padding:0;transition:color .2s;}
    .eye-btn:hover{color:var(--gold);}
    .alert-box{display:flex;align-items:center;gap:9px;border-radius:10px;padding:11px 14px;font-size:.82rem;margin-bottom:16px;}
    .alert-ok{background:rgba(52,211,153,.08);border:1px solid rgba(52,211,153,.25);color:var(--ok);}
    .alert-err{background:rgba(248,113,113,.08);border:1px solid rgba(248,113,113,.25);color:var(--err);}
    .btn-save{width:100%;padding:12px;border:none;border-radius:11px;background:linear-gradient(135deg,var(--gold),#ef4444);color:#fff;font-weight:700;font-size:.92rem;font-family:'Outfit',sans-serif;cursor:pointer;display:flex;align-items:center;justify-content:center;gap:8px;transition:opacity .2s,transform .15s;margin-top:4px;}
    .btn-save:hover{opacity:.88;transform:translateY(-1px);}
    .btn-save:disabled{opacity:.5;cursor:not-allowed;transform:none;}
    .spin{width:15px;height:15px;border-radius:50%;border:2px solid rgba(255,255,255,.25);border-top-color:#fff;animation:spin .6s linear infinite;display:inline-block;}
    @keyframes spin{to{transform:rotate(360deg);}}
    .bottom-link{text-align:center;font-size:.8rem;color:#475569;margin-top:14px;}
    .bottom-link a{color:var(--gold);text-decoration:none;font-weight:600;}
    .flow-indicator{display:flex;align-items:center;gap:8px;margin-bottom:16px;font-size:.72rem;color:rgba(226,232,240,.4);}
    .fi-step{background:rgba(245,158,11,.12);border:1px solid rgba(245,158,11,.25);color:var(--gold);border-radius:20px;padding:2px 10px;font-weight:700;font-size:.65rem;letter-spacing:.5px;}
    .fi-step.done{background:rgba(52,211,153,.1);border-color:rgba(52,211,153,.25);color:var(--ok);}
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
    <span class="fi-step">1 Register</span>
    <span class="fi-arrow">→</span>
    <span>Login</span>
    <span class="fi-arrow">→</span>
    <span>Add Event</span>
    <span class="fi-arrow">→</span>
    <span>Dashboard</span>
  </div>

  <div class="step-lbl"><i class="bi bi-building me-1"></i>Step 1 — Create Organizer Account</div>

  <div class="panel">
    <c:if test="${not empty saveSuccess}">
      <div class="alert-box alert-ok"><i class="bi bi-check-circle-fill"></i><c:out value="${saveSuccess}"/></div>
    </c:if>
    <c:if test="${not empty saveError}">
      <div class="alert-box alert-err"><i class="bi bi-exclamation-circle-fill"></i><c:out value="${saveError}"/></div>
    </c:if>

    <form id="orgRegForm" action="conferenceOrg/register" method="post" novalidate>

      <div class="field">
        <label class="flbl" for="orgEmail">Email Address <span class="req">*</span></label>
        <div class="fwrap">
          <i class="bi bi-envelope ficon"></i>
          <input type="email" id="orgEmail" name="email" class="finput"
                 placeholder="organizer@gmail.com" autocomplete="email"/>
        </div>
        <c:if test="${not empty emailError}">
          <div class="errtxt show"><i class="bi bi-exclamation-circle-fill"></i><c:out value="${emailError}"/></div>
        </c:if>
        <div class="errtxt" id="orgEmailErr"><i class="bi bi-exclamation-circle-fill"></i><span id="orgEmailMsg"></span></div>
      </div>

      <div class="field">
        <label class="flbl" for="orgPass">Password <span class="req">*</span></label>
        <div class="fwrap">
          <i class="bi bi-lock ficon"></i>
          <input type="password" id="orgPass" name="password" class="finput"
                 placeholder="Min 8 · A-Z · 0-9 · !@#$%^&*" style="padding-right:42px;"
                 autocomplete="new-password" oninput="orgStrength();"/>
          <button type="button" class="eye-btn" onclick="toggle('orgPass','orgEye')">
            <i class="bi bi-eye" id="orgEye"></i>
          </button>
        </div>
        <div class="str-bar"><div class="str-fill" id="orgStrFill"></div></div>
        <div class="str-txt" id="orgStrTxt"></div>
        <c:if test="${not empty passwordError}">
          <div class="errtxt show"><i class="bi bi-exclamation-circle-fill"></i><c:out value="${passwordError}"/></div>
        </c:if>
        <div class="errtxt" id="orgPassErr"><i class="bi bi-exclamation-circle-fill"></i><span id="orgPassMsg"></span></div>
      </div>

      <div class="field">
        <label class="flbl" for="orgConfirm">Confirm Password <span class="req">*</span></label>
        <div class="fwrap">
          <i class="bi bi-lock-fill ficon"></i>
          <input type="password" id="orgConfirm" name="confirmPassword" class="finput"
                 placeholder="Re-enter password" style="padding-right:42px;"
                 autocomplete="new-password"/>
          <button type="button" class="eye-btn" onclick="toggle('orgConfirm','orgConfirmEye')">
            <i class="bi bi-eye" id="orgConfirmEye"></i>
          </button>
        </div>
        <c:if test="${not empty confirmError}">
          <div class="errtxt show"><i class="bi bi-exclamation-circle-fill"></i><c:out value="${confirmError}"/></div>
        </c:if>
        <div class="errtxt" id="orgConfirmErr"><i class="bi bi-exclamation-circle-fill"></i><span id="orgConfirmMsg"></span></div>
      </div>

      <button type="submit" class="btn-save" id="orgRegBtn">
        <i class="bi bi-building-check"></i> Create Organizer Account
      </button>
    </form>
  </div>
  <div class="bottom-link">Already have an account? <a href="conferenceOrg/login">Login here</a></div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  const emailReg=/^[a-zA-Z0-9._%+-]+@gmail\.com$/;
  function toggle(id,eye){const i=document.getElementById(id),e=document.getElementById(eye);i.type=i.type==='password'?'text':'password';e.className=i.type==='password'?'bi bi-eye':'bi bi-eye-slash';}
  function setErr(id,errId,msgId,msg){document.getElementById(id).classList.add('f-err');document.getElementById(id).classList.remove('f-ok');if(msgId)document.getElementById(msgId).textContent=msg;document.getElementById(errId).classList.add('show');}
  function setOk(id,errId){document.getElementById(id).classList.remove('f-err');document.getElementById(id).classList.add('f-ok');document.getElementById(errId).classList.remove('show');}
  function orgStrength(){
    const v=document.getElementById('orgPass').value;
    const fill=document.getElementById('orgStrFill'),txt=document.getElementById('orgStrTxt');
    if(!v){fill.style.width='0';txt.textContent='';return;}
    let s=0;if(v.length>=8)s++;if(v.length>=12)s++;if(/[A-Z]/.test(v))s++;if(/[0-9]/.test(v))s++;if(/[!@#$%^&*]/.test(v))s++;
    const lvls=[{p:'20%',c:'#ef4444',l:'Very weak'},{p:'40%',c:'#f59e0b',l:'Weak'},{p:'60%',c:'#eab308',l:'Fair'},{p:'80%',c:'#22d3ee',l:'Strong'},{p:'100%',c:'#34d399',l:'Very strong'}];
    const lv=lvls[Math.min(s-1,4)]||lvls[0];fill.style.width=lv.p;fill.style.background=lv.c;txt.textContent=lv.l;txt.style.color=lv.c;
  }
  document.getElementById('orgRegForm').addEventListener('submit',function(e){
    e.preventDefault();let ok=true;
    const em=document.getElementById('orgEmail').value.trim();
    const pw=document.getElementById('orgPass').value;
    const cf=document.getElementById('orgConfirm').value;
    if(!em||!emailReg.test(em)){setErr('orgEmail','orgEmailErr','orgEmailMsg','Must be a valid @gmail.com');ok=false;}else setOk('orgEmail','orgEmailErr');
    if(!pw||pw.length<8){setErr('orgPass','orgPassErr','orgPassMsg','Minimum 8 characters');ok=false;}
    else if(!/[A-Z]/.test(pw)){setErr('orgPass','orgPassErr','orgPassMsg','Must contain uppercase letter');ok=false;}
    else if(!/[0-9]/.test(pw)){setErr('orgPass','orgPassErr','orgPassMsg','Must contain a number');ok=false;}
    else if(!/[!@#$%^&*]/.test(pw)){setErr('orgPass','orgPassErr','orgPassMsg','Must contain !@#$%^&*');ok=false;}
    else setOk('orgPass','orgPassErr');
    if(!cf){setErr('orgConfirm','orgConfirmErr','orgConfirmMsg','Please confirm password');ok=false;}
    else if(cf!==pw){setErr('orgConfirm','orgConfirmErr','orgConfirmMsg','Passwords do not match');ok=false;}
    else setOk('orgConfirm','orgConfirmErr');
    if(!ok)return;
    const btn=document.getElementById('orgRegBtn');btn.disabled=true;btn.innerHTML='<span class="spin"></span> Creating account…';
    this.submit();
  });
</script>
</body>
</html>