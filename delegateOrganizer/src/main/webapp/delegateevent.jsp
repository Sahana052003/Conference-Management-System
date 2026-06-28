<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <title>Register for Event – Confynity</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;900&family=DM+Serif+Display:ital@0;1&display=swap" rel="stylesheet"/>
  <style>
    :root{--cyan:#5ee7e7;--purple:#7b6fc4;--gold:#f59e0b;--bg:#070b14;--nav:#0e1422;--card:#0f172a;--border:rgba(94,231,231,0.13);--err:#f87171;--ok:#34d399;--text:#e2e8f0;--muted:rgba(226,232,240,0.45);}
    *,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
    body{font-family:'Outfit',sans-serif;background:var(--bg);color:var(--text);min-height:100vh;padding-top:68px;overflow-x:hidden;position:relative;}
    body::before{content:'';position:fixed;inset:0;z-index:0;background-image:linear-gradient(rgba(94,231,231,.03) 1px,transparent 1px),linear-gradient(90deg,rgba(94,231,231,.03) 1px,transparent 1px);background-size:44px 44px;pointer-events:none;}
    .blob{position:fixed;border-radius:50%;filter:blur(100px);pointer-events:none;z-index:0;animation:bd ease-in-out infinite alternate;}
    .b1{width:480px;height:480px;background:var(--purple);opacity:.06;top:-140px;right:-100px;animation-duration:17s;}
    .b2{width:360px;height:360px;background:var(--cyan);opacity:.04;bottom:-100px;left:-80px;animation-duration:21s;animation-delay:-11s;}
    @keyframes bd{from{transform:translate(0,0)scale(1);}to{transform:translate(28px,18px)scale(1.06);}}
    .navbar{background:rgba(14,20,34,.95);backdrop-filter:blur(12px);border-bottom:1px solid var(--border);padding:.5rem 1.5rem;position:fixed;top:0;width:100%;z-index:1000;}
    .navbar-brand img{width:40px;height:40px;border-radius:50%;}
    .brand-name{font-weight:700;font-size:1.2rem;background:linear-gradient(135deg,var(--cyan),var(--purple));-webkit-background-clip:text;-webkit-text-fill-color:transparent;}
    .brand-tag{font-size:.58rem;color:rgba(94,231,231,.45);letter-spacing:1px;}
    .nav-link{color:rgba(226,232,240,.65)!important;font-size:.87rem;padding:.4rem .75rem!important;transition:color .2s;}
    .nav-link:hover,.nav-link.active{color:var(--cyan)!important;}
    .del-pill{background:rgba(94,231,231,.08);border:1px solid rgba(94,231,231,.2);color:var(--cyan);font-size:.75rem;font-weight:600;border-radius:20px;padding:4px 14px;}
    .btn-logout{background:transparent;border:1px solid rgba(248,113,113,.3);color:var(--err);font-weight:600;border-radius:8px;padding:5px 14px;font-size:.8rem;cursor:pointer;}
    .page-wrap{position:relative;z-index:10;max-width:720px;margin:0 auto;padding:32px 20px 60px;}
    .page-lbl{font-size:.68rem;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:var(--cyan);margin-bottom:6px;}
    .page-title{font-family:'DM Serif Display',serif;font-size:clamp(1.6rem,3vw,2.2rem);color:#fff;line-height:1.15;}
    .page-title em{font-style:italic;color:var(--gold);}
    .page-sub{font-size:.87rem;color:var(--muted);margin-top:6px;margin-bottom:22px;}
    .panel{background:var(--card);border:1px solid var(--border);border-radius:18px;padding:24px 26px;position:relative;overflow:hidden;margin-bottom:16px;}
    .panel::before{content:'';position:absolute;inset:0;background:linear-gradient(135deg,rgba(94,231,231,.025),transparent 60%);pointer-events:none;}
    .panel-lbl{font-size:.68rem;font-weight:700;letter-spacing:1.5px;text-transform:uppercase;color:var(--cyan);margin-bottom:14px;display:flex;align-items:center;gap:6px;}
    .panel-lbl.gold{color:var(--gold);}
    .field{margin-bottom:14px;}
    .flbl{display:block;font-size:.7rem;font-weight:700;color:#64748b;text-transform:uppercase;letter-spacing:.6px;margin-bottom:5px;}
    .req{color:var(--err);margin-left:2px;}
    .fwrap{position:relative;}
    .ficon{position:absolute;left:13px;top:50%;transform:translateY(-50%);color:#334155;font-size:.9rem;pointer-events:none;transition:color .2s;}
    .fwrap:focus-within .ficon{color:var(--cyan);}
    .finput{width:100%;background:rgba(7,11,20,.9);border:1px solid rgba(94,231,231,.1);color:var(--text);border-radius:11px;padding:10px 14px 10px 38px;font-family:'Outfit',sans-serif;font-size:.87rem;outline:none;transition:border-color .2s,box-shadow .2s;}
    .finput::placeholder{color:#1e293b;}
    .finput:focus{border-color:var(--cyan);box-shadow:0 0 0 3px rgba(94,231,231,.07);}
    .finput.f-err{border-color:var(--err)!important;}
    .finput.f-ok{border-color:rgba(52,211,153,.3);}
    select.finput{padding-left:14px;appearance:none;cursor:pointer;}
    .errtxt{font-size:.72rem;color:var(--err);margin-top:4px;display:none;align-items:center;gap:4px;}
    .errtxt.show{display:flex;}
    .alert-box{display:flex;align-items:center;gap:9px;border-radius:10px;padding:11px 14px;font-size:.82rem;margin-bottom:16px;}
    .alert-ok{background:rgba(52,211,153,.08);border:1px solid rgba(52,211,153,.25);color:var(--ok);}
    .alert-err{background:rgba(248,113,113,.08);border:1px solid rgba(248,113,113,.25);color:var(--err);}
    /* Cap widget */
    .cap-widget{background:rgba(7,11,20,.6);border:1px solid var(--border);border-radius:10px;padding:12px 14px;margin-top:8px;display:none;}
    .cap-widget.show{display:block;}
    .cap-top{display:flex;justify-content:space-between;align-items:center;margin-bottom:6px;}
    .cap-name{font-size:.82rem;font-weight:700;}
    .badge-pill{font-size:.68rem;font-weight:700;padding:2px 9px;border-radius:20px;}
    .bp-ok{background:rgba(52,211,153,.1);color:var(--ok);border:1px solid rgba(52,211,153,.2);}
    .bp-warn{background:rgba(245,158,11,.1);color:var(--gold);border:1px solid rgba(245,158,11,.2);}
    .bp-err{background:rgba(248,113,113,.1);color:var(--err);border:1px solid rgba(248,113,113,.2);}
    .prog{background:rgba(255,255,255,.06);border-radius:100px;height:4px;overflow:hidden;margin-bottom:4px;}
    .prog-fill{height:100%;border-radius:100px;transition:width .4s;}
    .cap-meta{font-size:.72rem;color:var(--muted);}
    .cap-meta span{font-weight:700;}
    /* Preview */
    .del-preview{display:none;background:linear-gradient(135deg,rgba(123,111,196,.06),rgba(94,231,231,.03));border:1px solid var(--border);border-radius:14px;padding:16px 18px;margin-top:14px;}
    .del-preview.show{display:block;}
    .dp-top{display:flex;align-items:center;gap:12px;margin-bottom:10px;}
    .dp-avatar{width:42px;height:42px;border-radius:50%;background:rgba(94,231,231,.12);color:var(--cyan);display:flex;align-items:center;justify-content:center;font-size:.8rem;font-weight:700;flex-shrink:0;text-transform:uppercase;}
    .dp-name{font-size:.95rem;font-weight:700;color:#fff;}
    .dp-org{font-size:.75rem;color:var(--muted);margin-top:2px;}
    .dp-meta{display:flex;flex-wrap:wrap;gap:12px;font-size:.75rem;color:var(--muted);}
    .dp-meta span{color:rgba(226,232,240,.65);}
    .dp-conf-badge{font-size:.72rem;font-weight:700;padding:4px 12px;border-radius:20px;background:rgba(94,231,231,.1);color:var(--cyan);border:1px solid rgba(94,231,231,.2);margin-top:10px;display:inline-block;}
    /* Submit */
    .btn-submit{width:100%;padding:13px;border:none;border-radius:11px;background:linear-gradient(135deg,var(--cyan),var(--purple));color:#000;font-weight:700;font-size:.95rem;font-family:'Outfit',sans-serif;cursor:pointer;display:flex;align-items:center;justify-content:center;gap:10px;transition:opacity .2s,transform .15s;margin-top:4px;}
    .btn-submit:hover{opacity:.88;transform:translateY(-1px);}
    .btn-submit:disabled{opacity:.5;cursor:not-allowed;transform:none;}
    .spin{width:16px;height:16px;border-radius:50%;border:2px solid rgba(0,0,0,.2);border-top-color:#000;animation:spin .6s linear infinite;display:inline-block;}
    @keyframes spin{to{transform:rotate(360deg);}}
  </style>
</head>
<body>
<div class="blob b1"></div><div class="blob b2"></div>

<nav class="navbar navbar-expand-lg">
  <div class="container-fluid px-4">
    <a class="navbar-brand d-flex align-items-center gap-2 text-decoration-none" href="index">
      <img src="https://ideogram.ai/assets/image/balanced/response/Nag0uxrjTcOAlHEs4ys2Wg@2k" alt="logo"/>
      <div><div class="brand-name">Confynity</div><div class="brand-tag">DELEGATE PORTAL</div></div>
    </a>
    <div class="d-flex align-items-center gap-3">
      <span class="del-pill"><i class="bi bi-person-check me-1"></i><c:out value="${delegateEmail}"/></span>
      <a href="delegateAuth/logout" class="btn-logout"><i class="bi bi-box-arrow-right me-1"></i>Logout</a>
    </div>
  </div>
</nav>

<div class="page-wrap">
  <div class="page-lbl"><i class="bi bi-calendar-event me-1"></i>Delegate Portal — Step 3</div>
  <h1 class="page-title">Register for an <em>Event</em></h1>
  <p class="page-sub">Select a conference and complete your profile to confirm your seat.</p>

  <c:if test="${not empty saveSuccess}">
    <div class="alert-box alert-ok"><i class="bi bi-check-circle-fill"></i><c:out value="${saveSuccess}"/></div>
  </c:if>
  <c:if test="${not empty saveError}">
    <div class="alert-box alert-err"><i class="bi bi-exclamation-circle-fill"></i><c:out value="${saveError}"/></div>
  </c:if>

  <form id="delForm" action="conference/delegate/register" method="post" novalidate>

    <!-- Conference selection -->
    <div class="panel">
      <div class="panel-lbl gold"><i class="bi bi-calendar-event"></i> Select Conference Event</div>
      <div class="field">
        <label class="flbl" for="confSel">Available Conferences <span class="req">*</span></label>
        <select id="confSel" name="conferenceId" class="finput" onchange="updateCapWidget()">
          <option value="">-- Choose a conference to attend --</option>
          <c:forEach var="c" items="${conferences}">
            <option value="${c.id}"
                    data-used="${c.registeredCount}"
                    data-cap="${c.maxCapacity}"
                    data-spots="${c.spotsLeft}"
                    data-name="${c.conferenceName}"
                    data-venue="${c.venue}"
                    data-date="${c.conferenceDate}"
                    <c:if test="${c.spotsLeft <= 0}">disabled</c:if>>
              ${c.conferenceName} — ${c.venue}
              (${c.registeredCount}/${c.maxCapacity}
              <c:choose>
                <c:when test="${c.spotsLeft <= 0}"> — FULL</c:when>
                <c:when test="${c.spotsLeft <= 5}"> — only ${c.spotsLeft} left!</c:when>
              </c:choose>)
            </option>
          </c:forEach>
        </select>
        <c:if test="${not empty confError}">
          <div class="errtxt show"><i class="bi bi-exclamation-circle-fill"></i><c:out value="${confError}"/></div>
        </c:if>
        <div class="errtxt" id="confErr"><i class="bi bi-exclamation-circle-fill"></i><span id="confMsg"></span></div>
      </div>
      <!-- Live capacity widget -->
      <div class="cap-widget" id="capWidget">
        <div class="cap-top">
          <span class="cap-name" id="capConfName"></span>
          <span class="badge-pill" id="capStatus"></span>
        </div>
        <div class="prog"><div class="prog-fill" id="capFill"></div></div>
        <div class="cap-meta" id="capMeta"></div>
        <div style="font-size:.72rem;color:var(--muted);margin-top:4px;" id="capVenueDate"></div>
      </div>
    </div>

    <!-- Personal details -->
    <div class="panel">
      <div class="panel-lbl"><i class="bi bi-person-vcard"></i> Your Profile Details</div>

      <div class="row g-3">
        <div class="col-md-3">
          <div class="field">
            <label class="flbl" for="dSal">Salutation <span class="req">*</span></label>
            <select id="dSal" name="salutation" class="finput" onchange="updatePreview()">
              <option value="">–</option>
              <option>Mr</option><option>Ms</option><option>Dr</option><option>Prof</option>
            </select>
          </div>
        </div>
        <div class="col-md-9">
          <div class="field">
            <label class="flbl" for="dName">Full Name <span class="req">*</span></label>
            <div class="fwrap">
              <i class="bi bi-person ficon"></i>
              <input type="text" id="dName" name="name" class="finput"
                     placeholder="e.g. Kiran Reddy" oninput="updatePreview()"/>
            </div>
            <c:if test="${not empty nameError}">
              <div class="errtxt show"><i class="bi bi-exclamation-circle-fill"></i><c:out value="${nameError}"/></div>
            </c:if>
            <div class="errtxt" id="nameErr"><i class="bi bi-exclamation-circle-fill"></i><span id="nameMsg"></span></div>
          </div>
        </div>
      </div>

      <div class="row g-3">
        <div class="col-md-6">
          <div class="field">
            <label class="flbl" for="dEmail">Email <span class="req">*</span></label>
            <div class="fwrap">
              <i class="bi bi-envelope ficon"></i>
              <input type="email" id="dEmail" name="registeredEmail" class="finput"
                     placeholder="name@gmail.com" oninput="updatePreview()"/>
            </div>
            <c:if test="${not empty emailError}">
              <div class="errtxt show"><i class="bi bi-exclamation-circle-fill"></i><c:out value="${emailError}"/></div>
            </c:if>
            <div class="errtxt" id="emailErr"><i class="bi bi-exclamation-circle-fill"></i><span id="emailMsg"></span></div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="field">
            <label class="flbl" for="dMobile">Mobile Number <span class="req">*</span></label>
            <div class="fwrap">
              <i class="bi bi-phone ficon"></i>
              <input type="tel" id="dMobile" name="mobileNumber" class="finput"
                     placeholder="10-digit mobile" maxlength="10" oninput="updatePreview()"/>
            </div>
            <c:if test="${not empty mobileError}">
              <div class="errtxt show"><i class="bi bi-exclamation-circle-fill"></i><c:out value="${mobileError}"/></div>
            </c:if>
            <div class="errtxt" id="mobileErr"><i class="bi bi-exclamation-circle-fill"></i><span id="mobileMsg"></span></div>
          </div>
        </div>
      </div>

      <div class="row g-3">
        <div class="col-md-6">
          <div class="field">
            <label class="flbl" for="dDesig">Designation <span class="req">*</span></label>
            <div class="fwrap">
              <i class="bi bi-briefcase ficon"></i>
              <input type="text" id="dDesig" name="designation" class="finput"
                     placeholder="e.g. Software Engineer" oninput="updatePreview()"/>
            </div>
            <c:if test="${not empty designationError}">
              <div class="errtxt show"><i class="bi bi-exclamation-circle-fill"></i><c:out value="${designationError}"/></div>
            </c:if>
          </div>
        </div>
        <div class="col-md-6">
          <div class="field">
            <label class="flbl" for="dLocation">Current Location <span class="req">*</span></label>
            <div class="fwrap">
              <i class="bi bi-geo-alt ficon"></i>
              <input type="text" id="dLocation" name="currentLocation" class="finput"
                     placeholder="e.g. Bangalore, Karnataka" oninput="updatePreview()"/>
            </div>
            <c:if test="${not empty locationError}">
              <div class="errtxt show"><i class="bi bi-exclamation-circle-fill"></i><c:out value="${locationError}"/></div>
            </c:if>
          </div>
        </div>
      </div>

      <!-- Live preview -->
      <div class="del-preview" id="delPreview">
        <div style="font-size:.65rem;font-weight:700;letter-spacing:1.5px;text-transform:uppercase;color:var(--purple);margin-bottom:10px;">
          <i class="bi bi-eye me-1"></i> Registration Preview
        </div>
        <div class="dp-top">
          <div class="dp-avatar" id="dpInitials">?</div>
          <div>
            <div class="dp-name" id="dpName">–</div>
            <div class="dp-org" id="dpDesig">–</div>
          </div>
        </div>
        <div class="dp-meta">
          <div><i class="bi bi-envelope me-1"></i><span id="dpEmail">–</span></div>
          <div><i class="bi bi-phone me-1"></i><span id="dpMobile">–</span></div>
          <div><i class="bi bi-geo-alt me-1"></i><span id="dpLocation">–</span></div>
        </div>
        <div class="dp-conf-badge" id="dpConf">No conference selected</div>
      </div>
    </div>

    <button type="submit" class="btn-submit" id="submitBtn">
      <i class="bi bi-person-check-fill"></i> Register for this Event
    </button>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  const emailReg=/^[a-zA-Z0-9._%+-]+@gmail\.com$/;
  const phoneReg=/^[6-9]\d{9}$/;

  function setErr(id,errId,msgId,msg){document.getElementById(id).classList.add('f-err');document.getElementById(id).classList.remove('f-ok');if(msgId)document.getElementById(msgId).textContent=msg;document.getElementById(errId).classList.add('show');}
  function setOk(id,errId){document.getElementById(id).classList.remove('f-err');document.getElementById(id).classList.add('f-ok');document.getElementById(errId).classList.remove('show');}

  function updateCapWidget(){
    const sel=document.getElementById('confSel');
    const opt=sel.options[sel.selectedIndex];
    const w=document.getElementById('capWidget');
    if(!sel.value){w.classList.remove('show');return;}
    const used=parseInt(opt.dataset.used),cap=parseInt(opt.dataset.cap),spots=parseInt(opt.dataset.spots);
    const pct=Math.min(Math.round(used/cap*100),100);
    w.classList.add('show');
    document.getElementById('capConfName').textContent=opt.dataset.name;
    document.getElementById('capVenueDate').innerHTML='<i class="bi bi-geo-alt me-1"></i>'+opt.dataset.venue+' &nbsp;·&nbsp; <i class="bi bi-calendar me-1"></i>'+opt.dataset.date;
    const fill=document.getElementById('capFill');
    fill.style.width=pct+'%';
    fill.style.background=pct>=100?'#f87171':pct>=85?'linear-gradient(90deg,#f59e0b,#ef4444)':'linear-gradient(90deg,#5ee7e7,#7b6fc4)';
    const status=document.getElementById('capStatus');
    if(spots<=0){status.textContent='Full';status.className='badge-pill bp-err';}
    else if(spots<=5){status.textContent='Only '+spots+' left';status.className='badge-pill bp-warn';}
    else{status.textContent='Open';status.className='badge-pill bp-ok';}
    document.getElementById('capMeta').innerHTML='<span>'+used+'</span> registered of <span>'+cap+'</span> max &nbsp;·&nbsp; <span style="color:'+(spots<=0?'#f87171':spots<=5?'#f59e0b':'#34d399')+'">'+(spots<=0?'No spots remaining':spots+' spots remaining')+'</span>';
    updatePreview();
  }

  function updatePreview(){
    const sal=document.getElementById('dSal').value;
    const name=document.getElementById('dName').value.trim();
    const email=document.getElementById('dEmail').value.trim();
    const mob=document.getElementById('dMobile').value.trim();
    const desig=document.getElementById('dDesig').value.trim();
    const loc=document.getElementById('dLocation').value.trim();
    const sel=document.getElementById('confSel');
    const conf=sel.value?sel.options[sel.selectedIndex].dataset.name:'';
    const p=document.getElementById('delPreview');
    if(!name&&!email){p.classList.remove('show');return;}
    p.classList.add('show');
    const ini=name?name.split(' ').map(w=>w[0]).join('').slice(0,2).toUpperCase():'?';
    document.getElementById('dpInitials').textContent=ini;
    document.getElementById('dpName').textContent=(sal?sal+'. ':'')+( name||'–');
    document.getElementById('dpDesig').textContent=desig||'–';
    document.getElementById('dpEmail').textContent=email||'–';
    document.getElementById('dpMobile').textContent=mob||'–';
    document.getElementById('dpLocation').textContent=loc||'–';
    document.getElementById('dpConf').textContent=conf||'No conference selected';
  }

  document.getElementById('delForm').addEventListener('submit',function(e){
    e.preventDefault();let ok=true;
    const sel=document.getElementById('confSel');
    if(!sel.value){setErr('confSel','confErr','confMsg','Please select a conference');ok=false;}else setOk('confSel','confErr');
    const name=document.getElementById('dName').value.trim();
    if(!name){setErr('dName','nameErr','nameMsg','Full name is required');ok=false;}else setOk('dName','nameErr');
    const email=document.getElementById('dEmail').value.trim();
    if(!email||!emailReg.test(email)){setErr('dEmail','emailErr','emailMsg','Must be a valid @gmail.com');ok=false;}else setOk('dEmail','emailErr');
    const mob=document.getElementById('dMobile').value.trim();
    if(!mob||!phoneReg.test(mob)){setErr('dMobile','mobileErr','mobileMsg','Valid 10-digit Indian mobile required');ok=false;}else setOk('dMobile','mobileErr');
    if(!ok)return;
    const btn=document.getElementById('submitBtn');btn.disabled=true;btn.innerHTML='<span class="spin"></span> Registering…';
    this.submit();
  });
</script>
</body>
</html>