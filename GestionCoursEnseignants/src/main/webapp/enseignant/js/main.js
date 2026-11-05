/* ==================================================================
 * Gradebook — Free Teacher Dashboard Template · main.js
 * Vanilla JavaScript, no jQuery. One function per feature, each with
 * guard clauses so the file can load on every page.
 * Author: uiCookies — https://uicookies.com/
 * ================================================================== */
(() => {
  'use strict';

  /* ----------------------------------------------------------------
   * Demo data. Replace with your own records or an API call.
   *  classes:   one entry per class taught (last = Summer term average)
   *  gradebook: per class, the assessments and one row per student:
   *             [name, flags, score1, score2, …]  (null = not submitted)
   * ---------------------------------------------------------------- */
  const DATA = {"classes":[{"code":"7H","subject":"Science","year":"Year 7","size":28,"target":75,"last":null},{"code":"8K","subject":"Science","year":"Year 8","size":30,"target":68,"last":66},{"code":"9R","subject":"Science","year":"Year 9","size":27,"target":72,"last":73.4},{"code":"10B","subject":"Physics","year":"Year 10","size":24,"target":68,"last":63.8},{"code":"11B","subject":"Chemistry","year":"Year 11","size":24,"target":71,"last":67.2},{"code":"12C","subject":"Chemistry","year":"Year 12","size":14,"target":64,"last":null},{"code":"13C","subject":"Chemistry","year":"Year 13","size":11,"target":73,"last":70.5}],"gradebook":{
  "7H":{"assignments":[{"title":"Lab safety quiz","short":"Safety quiz","type":"Quiz","max":10,"date":"4 Sep"},{"title":"Particles homework","short":"Particles HW","type":"Homework","max":20,"date":"8 Sep"},{"title":"States of matter test","short":"States test","type":"Test","max":30,"date":"11 Sep"},{"title":"Dissolving practical","short":"Dissolving prac.","type":"Practical","max":20,"date":"15 Sep"},{"title":"Mixtures homework","short":"Mixtures HW","type":"Homework","max":20,"date":"18 Sep"},{"title":"Chromatography write-up","short":"Chromatography","type":"Practical","max":25,"date":"22 Sep"}],
    "students":[
      ["Isla Brennan","",8,16,21,15,12,19],
      ["Mohammed Begum","",7,15,21,12,12,15],
      ["Freya O'Connell","SEND",8,17,25,16,20,21],
      ["Oliver Osei","",8,12,16,14,13,14],
      ["Aaliyah Ferreira","",10,18,28,19,18,24],
      ["Callum Nwosu","",8,16,23,15,16,19],
      ["Zara Varga","",7,10,16,10,11,10],
      ["Ethan Farouk","",7,12,15,9,12,11],
      ["Maya Nash","",8,16,24,15,18,19],
      ["Reuben Webb","",8,16,20,13,15,19],
      ["Chloe Edwards","",9,18,null,17,16,21],
      ["Ibrahim Moreno","",8,16,22,16,18,17],
      ["Ella Ashby","SEND",6,17,20,16,15,18],
      ["Tomasz Whitaker","",9,16,23,18,17,22],
      ["Grace Novak","",7,null,10,11,14,15],
      ["Arjun Harrington","",null,18,24,13,12,16],
      ["Poppy Mahmood","PP",8,14,22,15,16,18],
      ["Leah MacLeod","",7,13,17,14,13,16],
      ["Kai Byrne","",9,19,23,15,15,23],
      ["Hana Morgan","",8,null,27,15,14,18],
      ["Finley Usman","",6,14,14,12,10,14],
      ["Nia Ellis","",9,20,25,17,17,20],
      ["Samuel Murphy","",6,14,20,17,12,17],
      ["Aisha Vaughan","",10,18,27,18,18,25],
      ["Harvey Dhillon","",8,15,23,13,15,19],
      ["Rosa Lewis","",9,11,22,12,15,17],
      ["Yusuf Ward","",8,14,22,15,17,18],
      ["Imogen Okafor","",6,null,16,12,12,17]]},
  "8K":{"assignments":[{"title":"Energy transfer test","short":"Energy test","type":"Test","max":30,"date":"7 Sep"},{"title":"Food chains homework","short":"Food chains HW","type":"Homework","max":20,"date":"10 Sep"},{"title":"Periodic table quiz","short":"Periodic quiz","type":"Quiz","max":15,"date":"14 Sep"},{"title":"Reactivity practical","short":"Reactivity prac.","type":"Practical","max":25,"date":"16 Sep"},{"title":"Speed and motion test","short":"Motion test","type":"Test","max":40,"date":"21 Sep"},{"title":"Acids and alkalis quiz","short":"Acids quiz","type":"Quiz","max":15,"date":"23 Sep"}],
    "students":[
      ["Sofia Marchetti","",13,14,11,18,21,9],
      ["Luca Hussain","",16,12,8,17,22,10],
      ["Esme Oduya","",15,12,9,17,29,11],
      ["Tobias Evans","",15,9,null,10,17,7],
      ["Fatima Kaur","",24,17,null,21,34,15],
      ["Oscar Chowdhury","PP",29,20,15,22,39,null],
      ["Niamh Lam","",15,11,8,13,null,8],
      ["Rhys Taylor","",14,11,8,15,18,7],
      ["Layla Dunne","",21,16,8,17,26,null],
      ["Jacob Lowe","",16,12,7,16,23,null],
      ["Evie Tran","",20,17,12,17,24,12],
      ["Mateo Collins","",17,14,10,13,23,null],
      ["Anya Kennedy","",18,13,9,17,null,9],
      ["Ruby Turner","",18,13,6,15,23,null],
      ["Kofi Greene","",17,16,10,16,24,10],
      ["Matilda Campbell","",22,13,11,18,31,13],
      ["Alfie Patel","PP",20,13,8,16,22,8],
      ["Sienna Castillo","",16,9,7,10,20,8],
      ["Idris Thornton","",18,10,9,14,17,8],
      ["Holly Wright","",26,17,11,22,32,13],
      ["Emil Khan","",24,19,12,25,33,null],
      ["Keira Shah","",21,14,9,16,24,null],
      ["Rohan Chen","",19,13,11,18,26,11],
      ["Lily Kerr","",24,18,10,21,33,14],
      ["Dylan Sutton","",14,13,8,17,13,9],
      ["Amelia Bello","",12,9,8,10,18,null],
      ["Jamal Jarvis","",22,16,10,null,25,null],
      ["Megan Sahin","",16,11,9,13,19,7],
      ["Benedict Forde","",28,17,14,21,36,14],
      ["Ivy Mensah","",25,14,11,19,29,13]]},
  "9R":{"assignments":[{"title":"Cells and microscopy test","short":"Cells test","type":"Test","max":30,"date":"7 Sep"},{"title":"Microscope drawing task","short":"Drawing task","type":"Homework","max":10,"date":"9 Sep"},{"title":"Particle model homework","short":"Particles HW","type":"Homework","max":20,"date":"14 Sep"},{"title":"Forces quiz","short":"Forces quiz","type":"Quiz","max":15,"date":"16 Sep"},{"title":"Specialised cells homework","short":"Cells HW","type":"Homework","max":20,"date":"18 Sep"},{"title":"Diffusion practical","short":"Diffusion prac.","type":"Practical","max":25,"date":"22 Sep"}],
    "students":[
      ["Priya Raman","",18,8,13,11,13,15],
      ["Aarav Kowalski","",23,9,17,12,19,null],
      ["Scarlett Singh","SEND",20,7,13,9,14,null],
      ["Caleb Hughes","",29,9,20,14,19,null],
      ["Orla Szabo","",13,6,13,9,10,null],
      ["Ravi Jensen","",18,6,15,10,12,null],
      ["Phoebe Rossi","PP",22,6,14,11,12,12],
      ["Leon Barker","PP",21,8,null,12,14,19],
      ["Daisy Jones","",21,null,12,9,16,null],
      ["Omar Reid","",17,7,11,7,13,null],
      ["Tilly Abbott","",22,9,16,11,15,null],
      ["Felix Hale","",23,8,16,12,15,18],
      ["Noah Rowe","",22,10,15,12,16,19],
      ["Martha Delaney","",21,8,14,9,11,null],
      ["Kian Marchetti","",19,7,12,10,11,null],
      ["Farah Fraser","",21,8,15,14,14,21],
      ["George Nakamura","",22,9,15,8,14,null],
      ["Jade Yilmaz","",18,7,13,9,13,17],
      ["Elias Rahman","",22,7,14,10,16,16],
      ["Ines Iqbal","",28,9,17,14,18,null],
      ["Harry Quinn","",11,null,null,9,10,14],
      ["Abigail Afolabi","",23,9,19,14,18,null],
      ["Zain Haddad","",23,8,12,11,15,20],
      ["Lucy Parry","",25,8,17,12,16,19],
      ["Stanley Zielinski","",26,9,15,10,17,23],
      ["Mei Gallagher","",14,6,9,9,11,null],
      ["Joel Penrose","PP",17,7,13,8,11,16]]},
  "10B":{"assignments":[{"title":"Energy stores test","short":"Energy test","type":"Test","max":40,"date":"4 Sep"},{"title":"Work done homework","short":"Work done HW","type":"Homework","max":20,"date":"8 Sep"},{"title":"Power and efficiency quiz","short":"Efficiency quiz","type":"Quiz","max":15,"date":"11 Sep"},{"title":"Density required practical","short":"Density RP","type":"Practical","max":30,"date":"15 Sep"},{"title":"Circuits homework","short":"Circuits HW","type":"Homework","max":20,"date":"18 Sep"},{"title":"Energy and circuits test","short":"Unit test","type":"Test","max":50,"date":"22 Sep"}],
    "students":[
      ["Bethany Carter","",31,12,10,19,13,33],
      ["Ayaan Lindqvist","EAL",23,15,10,24,12,29],
      ["Lottie Adeyemi","",26,11,9,16,12,17],
      ["Eli Doyle","",27,13,9,19,16,32],
      ["Nadia Price","SEND",33,15,12,24,17,38],
      ["Archie Pearce","",28,14,10,21,16,30],
      ["Selin Holloway","",32,14,10,18,null,30],
      ["Rory Pritchard","",30,19,12,26,14,31],
      ["Iqra Walsh","",29,14,10,25,14,34],
      ["Max Grant","",26,15,9,19,13,28],
      ["Willow Owusu","",22,12,8,19,11,35],
      ["Hamza Young","",33,19,13,27,15,42],
      ["Beatrix Fitzgerald","",31,13,10,24,13,37],
      ["Arlo Nguyen","PP",34,19,14,26,19,42],
      ["Amira Boateng","",37,16,11,26,19,47],
      ["Jude Raman","",22,15,9,20,12,40],
      ["Clara Brennan","",33,16,11,20,16,39],
      ["Tariq Begum","SEND",23,10,8,18,10,27],
      ["Violet O'Connell","",27,20,11,26,17,46],
      ["Owen Osei","",17,9,9,15,11,22],
      ["Sana Ferreira","",16,7,8,14,11,20],
      ["Sebastian Nwosu","",32,18,12,26,16,32],
      ["Harriet Varga","",27,17,13,25,16,38],
      ["Ezra Farouk","",30,13,11,25,15,41]]},
  "11B":{"assignments":[{"title":"Atomic structure test","short":"Atomic test","type":"Test","max":40,"date":"4 Sep"},{"title":"Bonding homework","short":"Bonding HW","type":"Homework","max":20,"date":"8 Sep"},{"title":"Titration practical write-up","short":"Titration RP","type":"Practical","max":30,"date":"11 Sep"},{"title":"Quantitative chemistry quiz","short":"Moles quiz","type":"Quiz","max":15,"date":"15 Sep"},{"title":"Energy changes homework","short":"Energetics HW","type":"Homework","max":20,"date":"18 Sep"},{"title":"Rates of reaction write-up","short":"Rates RP","type":"Practical","max":30,"date":"22 Sep"}],
    "students":[
      ["Amara Okafor","PP",36,19,25,15,20,29],
      ["Jonah Whitaker","PP",null,null,17,6,null,13],
      ["Maisie Nash","PP",34,20,26,13,20,null],
      ["Adam Webb","",30,16,24,13,14,23],
      ["Eden Edwards","SEND",28,10,16,8,null,15],
      ["Luke Moreno","",21,11,18,8,12,19],
      ["Yasmin Ashby","",40,18,21,11,17,null],
      ["Charlie Whitaker","",26,14,17,9,13,22],
      ["Anjali Novak","",23,13,20,10,null,null],
      ["Frankie Harrington","SEND",31,19,29,12,16,null],
      ["Elsie Mahmood","",24,17,21,12,14,null],
      ["Ahmed MacLeod","",23,13,16,10,13,14],
      ["Lola Byrne","",29,15,23,11,15,null],
      ["Rafael Morgan","",24,14,20,10,14,16],
      ["Heidi Usman","",31,null,25,11,20,26],
      ["Louis Ellis","SEND",39,18,25,13,17,27],
      ["Tia Murphy","",36,17,24,11,16,null],
      ["Kieran Vaughan","SEND",28,17,22,12,16,21],
      ["Olivia Dhillon","SEND",null,18,24,13,18,28],
      ["Hugo Lewis","EAL",20,12,20,7,11,null],
      ["Naomi Ward","",28,14,23,9,14,null],
      ["Isaac Okafor","PP",25,14,19,12,15,21],
      ["Florence Hussain","",null,20,28,13,19,30],
      ["Aiden Oduya","",36,19,26,11,16,24]]},
  "12C":{"assignments":[{"title":"Atomic structure test","short":"Atomic test","type":"Test","max":45,"date":"4 Sep"},{"title":"Amount of substance problems","short":"Moles problems","type":"Homework","max":30,"date":"8 Sep"},{"title":"Bonding and shapes essay","short":"Bonding essay","type":"Essay","max":25,"date":"11 Sep"},{"title":"Volumetric solution practical","short":"RP1 solution","type":"Practical","max":20,"date":"15 Sep"},{"title":"Energetics test","short":"Energetics test","type":"Test","max":50,"date":"18 Sep"},{"title":"Kinetics homework","short":"Kinetics HW","type":"Homework","max":25,"date":"22 Sep"}],
    "students":[
      ["Theo Lindqvist","",37,24,17,13,41,18],
      ["Kwame Mensah","",17,13,10,10,27,15],
      ["Molly Evans","",26,21,13,11,27,null],
      ["Malik Kaur","",32,19,17,16,31,17],
      ["Summer Chowdhury","",26,20,18,15,25,null],
      ["Bilal Lam","",21,16,13,12,28,null],
      ["Rosie Taylor","",18,8,11,9,17,15],
      ["Ciaran Dunne","",22,13,12,10,null,13],
      ["Hattie Lowe","PP",38,21,19,16,34,24],
      ["Leo Tran","",42,22,22,16,42,20],
      ["Mira Collins","PP",33,18,18,17,null,20],
      ["Jasper Kennedy","",32,23,18,19,35,null],
      ["Alice Turner","",32,18,17,13,28,null],
      ["Dev Greene","EAL",34,25,18,18,42,null]]},
  "13C":{"assignments":[{"title":"Thermodynamics test","short":"Thermo test","type":"Test","max":50,"date":"4 Sep"},{"title":"Rate equations problems","short":"Rate equations","type":"Homework","max":30,"date":"8 Sep"},{"title":"Equilibrium constant Kp quiz","short":"Kp quiz","type":"Quiz","max":20,"date":"11 Sep"},{"title":"Buffer calculations homework","short":"Buffers HW","type":"Homework","max":25,"date":"15 Sep"},{"title":"pH curves practical","short":"pH curves RP","type":"Practical","max":30,"date":"18 Sep"},{"title":"Electrochemistry test","short":"Electrochem","type":"Test","max":50,"date":"22 Sep"}],
    "students":[
      ["Ffion Campbell","",33,21,16,16,19,35],
      ["Jack Patel","",30,22,15,18,20,31],
      ["Nell Castillo","",26,17,13,14,20,31],
      ["Musa Thornton","",44,21,18,20,26,44],
      ["Iris Wright","",42,26,18,21,25,42],
      ["Albie Khan","SEND",35,18,12,17,20,32],
      ["Kezia Shah","SEND",28,20,15,16,19,27],
      ["Amara Chen","PP",32,22,14,19,24,35],
      ["Jonah Kerr","PP",34,19,13,15,20,34],
      ["Priya Sutton","",32,21,13,15,20,33],
      ["Theo Bello","",31,23,13,18,25,35]]}}};
  const ICONS = {
    check: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><path d=\"M20 6 9 17l-5-5\"/></svg>",
    alert: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><path d=\"m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z\"/><path d=\"M12 9v4M12 17h.01\"/></svg>",
    up: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><path d=\"m22 7-8.5 8.5-5-5L2 17\"/><path d=\"M16 7h6v6\"/></svg>",
    down: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><path d=\"m22 17-8.5-8.5-5 5L2 7\"/><path d=\"M16 17h6v-6\"/></svg>",
    pencil: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><path d=\"M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z\"/></svg>",
    trash: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><path d=\"M3 6h18M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2\"/></svg>",
    plus: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><path d=\"M12 5v14M5 12h14\"/></svg>",
    clock: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><circle cx=\"12\" cy=\"12\" r=\"9\"/><path d=\"M12 7v5l3 2\"/></svg>",
    info: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><circle cx=\"12\" cy=\"12\" r=\"9\"/><path d=\"M12 16v-4M12 8h.01\"/></svg>",
    file: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><path d=\"M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8Z\"/><path d=\"M14 2v6h6M16 13H8M16 17H8M10 9H8\"/></svg>",
    classes: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><path d=\"M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2\"/><circle cx=\"9\" cy=\"7\" r=\"4\"/><path d=\"M22 21v-2a4 4 0 0 0-3-3.87\"/><path d=\"M16 3.13a4 4 0 0 1 0 7.75\"/></svg>",
    chevdown: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><path d=\"m6 9 6 6 6-6\"/></svg>",
    x: "<svg class=\"ic\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.75\" stroke-linecap=\"round\" stroke-linejoin=\"round\" aria-hidden=\"true\" focusable=\"false\"><path d=\"M18 6 6 18M6 6l12 12\"/></svg>",
  };

  /* ---------------------------------------------------------------- helpers */
  const $ = (sel, root = document) => root.querySelector(sel);
  const $$ = (sel, root = document) => Array.from(root.querySelectorAll(sel));
  const store = {
    get(k) { try { return window.localStorage.getItem(k); } catch (e) { return null; } },
    set(k, v) { try { window.localStorage.setItem(k, v); } catch (e) { /* storage unavailable */ } },
    del(k) { try { window.localStorage.removeItem(k); } catch (e) { /* storage unavailable */ } },
  };
  const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
  const fmt1 = (x) => (x == null || Number.isNaN(x) ? '—' : x.toFixed(1));
  const band = (p) => (p == null ? 'sx' : p >= 85 ? 's5' : p >= 70 ? 's4' : p >= 55 ? 's3' : p >= 40 ? 's2' : 's1');
  const mean = (arr) => (arr.length ? arr.reduce((a, b) => a + b, 0) / arr.length : null);
  const initials = (n) => n.split(' ').map((w) => w[0]).join('').slice(0, 2);
  const avTone = (name) => { let h = 0; for (const ch of name) h = (h * 31 + ch.charCodeAt(0)) >>> 0; return h % 6; };
  const subjectKey = (s) => (s === 'Chemistry' ? 'chem' : s === 'Physics' ? 'phys' : 'sci');
  const classMeta = (code) => (DATA ? DATA.classes.find((c) => c.code === code) : null);
  const chipHTML = (code) => { const c = classMeta(code); return `<span class="chip chip-${subjectKey(c ? c.subject : '')}"><span class="chip-dot" aria-hidden="true"></span>${esc(code)}</span>`; };
  const avatarHTML = (name) => `<span class="avatar av-${avTone(name)}" aria-hidden="true">${esc(initials(name))}</span>`;
  const FLAG_TITLE = { PP: 'Pupil Premium', EAL: 'English as an additional language', SEND: 'Special educational needs' };
  const NS = 'http://www.w3.org/2000/svg';
  const svg = (tag, attrs = {}, parent = null, text = null) => {
    const el = document.createElementNS(NS, tag);
    Object.entries(attrs).forEach(([k, v]) => el.setAttribute(k, v));
    if (text != null) el.textContent = text;
    if (parent) parent.appendChild(el);
    return el;
  };
  // Column/bar with a 4px rounded data end and a square baseline.
  const colPath = (x, y, w, h, r = 4) => { if (h <= 0) return ''; r = Math.min(r, h, w / 2); return `M${x},${y + h}V${y + r}Q${x},${y} ${x + r},${y}H${x + w - r}Q${x + w},${y} ${x + w},${y + r}V${y + h}Z`; };
  const niceStep = (max, target = 4) => { const raw = max / target; const p = 10 ** Math.floor(Math.log10(raw)); const m = raw / p; return (m <= 1 ? 1 : m <= 2 ? 2 : m <= 5 ? 5 : 10) * p; };
  const whenResized = (el, fn) => {
    if (!('ResizeObserver' in window)) { window.addEventListener('resize', fn); return; }
    let w = el.clientWidth; let raf = 0;
    new ResizeObserver(() => { if (el.clientWidth === w) return; w = el.clientWidth; cancelAnimationFrame(raf); raf = requestAnimationFrame(fn); }).observe(el);
  };

  /* Gradebook model shared by every page (edits are kept per class in this browser). */
  const EDIT_KEY = (code) => `gradebook-marks-${code}`;
  const loadEdits = (code) => { try { return JSON.parse(store.get(EDIT_KEY(code)) || '{}') || {}; } catch (e) { return {}; } };
  const pct = (v, max) => (v == null ? null : (v / max) * 100);
  const studentAvg = (s, as) => mean(s.scores.map((v, j) => pct(v, as[j].max)).filter((x) => x != null));
  const assignmentAvg = (students, j, max) => mean(students.map((s) => pct(s.scores[j], max)).filter((x) => x != null));
  const classAvg = (m) => mean(m.students.map((s) => studentAvg(s, m.assignments)).filter((x) => x != null));
  function getClass(code) {
    if (!DATA || !DATA.gradebook[code]) return null;
    const base = DATA.gradebook[code];
    const edits = loadEdits(code);
    const students = base.students.map((row, r) => {
      const [name, flags, ...scores] = row;
      return { r, name, flags: flags ? flags.split(' ') : [], base: scores, scores: scores.map((v, c) => (`${r}:${c}` in edits ? edits[`${r}:${c}`] : v)) };
    });
    return { code, meta: classMeta(code), assignments: base.assignments, students, edits };
  }

  /* ---------------------------------------------------------------- toasts */
  function toast(message) {
    const stack = $('#toast-stack');
    if (!stack) return;
    const el = document.createElement('div');
    el.className = 'toast-msg';
    el.innerHTML = ICONS.check;
    const span = document.createElement('span');
    span.textContent = message;
    el.appendChild(span);
    stack.appendChild(el);
    setTimeout(() => { el.classList.add('is-leaving'); setTimeout(() => el.remove(), 300); }, 3800);
  }

  /* ---------------------------------------------------------------- chart tooltip */
  const tip = (() => {
    let el = null;
    const ensure = () => {
      if (!el) { el = document.createElement('div'); el.className = 'chart-tip'; el.setAttribute('aria-hidden', 'true'); document.body.appendChild(el); }
      return el;
    };
    return {
      show(target, value, label, evt) {
        const t = ensure();
        t.textContent = '';
        const s = document.createElement('strong'); s.textContent = value;
        const l = document.createElement('span'); l.textContent = label;
        t.append(s, l);
        let x; let y;
        if (evt && evt.clientX != null) { x = evt.clientX; y = evt.clientY; } else { const b = target.getBoundingClientRect(); x = b.left + b.width / 2; y = b.top; }
        const w = t.offsetWidth; const h = t.offsetHeight;
        const left = Math.max(8, Math.min(window.innerWidth - w - 8, x - w / 2));
        const top = y - h - 14 < 8 ? y + 18 : y - h - 14;
        t.style.left = `${left}px`; t.style.top = `${top}px`;
        t.classList.add('is-on');
      },
      hide() { if (el) el.classList.remove('is-on'); },
    };
  })();
  function bindTip(mark, value, label) {
    mark.addEventListener('pointermove', (e) => tip.show(mark, value, label, e));
    mark.addEventListener('pointerleave', tip.hide);
    mark.addEventListener('focus', () => tip.show(mark, value, label));
    mark.addEventListener('blur', tip.hide);
  }

  /* ================================================================
   * Shell
   * ================================================================ */
  function initTheme() {
    const btn = $('#theme-toggle');
    if (!btn) return;
    const root = document.documentElement;
    const sync = () => {
      const dark = root.getAttribute('data-bs-theme') === 'dark';
      btn.setAttribute('aria-label', dark ? 'Switch to light theme' : 'Switch to dark theme');
      btn.title = dark ? 'Light theme' : 'Dark theme';
    };
    sync();
    btn.addEventListener('click', () => {
      const next = root.getAttribute('data-bs-theme') === 'dark' ? 'light' : 'dark';
      root.setAttribute('data-bs-theme', next);
      store.set('gradebook-theme', next);
      sync();
    });
  }

  function initSidebar() {
    const root = document.documentElement;
    const btn = $('#sidebar-collapse');
    if (btn) {
      const sync = () => {
        const collapsed = root.classList.contains('sidebar-collapsed');
        btn.setAttribute('aria-expanded', String(!collapsed));
        btn.setAttribute('aria-label', collapsed ? 'Expand sidebar' : 'Collapse sidebar');
      };
      sync();
      btn.addEventListener('click', () => {
        root.classList.toggle('sidebar-collapsed');
        store.set('gradebook-sidebar', root.classList.contains('sidebar-collapsed') ? 'collapsed' : 'open');
        sync();
      });
    }
    // On mobile, close the offcanvas when a same-page shortcut is used.
    const side = $('#sidebar');
    if (!side) return;
    side.addEventListener('click', (e) => {
      const link = e.target.closest('a[href*="#"]');
      if (!link || !window.bootstrap) return;
      const inst = window.bootstrap.Offcanvas.getInstance(side);
      if (inst) inst.hide();
    });
  }

  function initTerm() {
    const sel = $('#term-select');
    if (!sel) return;
    const banner = $('#term-banner');
    const reset = $('#term-reset');
    const week = $('.term-card-week');
    const apply = (value, announce) => {
      sel.value = value;
      const label = sel.options[sel.selectedIndex].text;
      const archived = value !== 'autumn';
      document.documentElement.toggleAttribute('data-term-archived', archived);
      $$('[data-term-label]').forEach((el) => { el.textContent = label; });
      if (week) week.textContent = archived ? 'Archived' : 'Week 4 of 15';
      if (banner) banner.hidden = !archived;
      document.dispatchEvent(new CustomEvent('gradebook:term', { detail: { archived, label } }));
      if (announce) toast(archived ? `${label} is archived. Marks are read-only.` : `Showing ${label}, the current term.`);
    };
    const saved = store.get('gradebook-term');
    if (saved && saved !== 'autumn' && sel.querySelector(`option[value="${saved}"]`)) apply(saved, false);
    sel.addEventListener('change', () => { store.set('gradebook-term', sel.value); apply(sel.value, true); });
    if (reset) reset.addEventListener('click', () => { store.set('gradebook-term', 'autumn'); apply('autumn', true); sel.focus(); });
  }

  function initSearch() {
    const input = $('#global-search');
    const list = $('#search-results');
    const form = $('#global-search-form');
    if (!input || !list || !DATA) return;
    const pages = [['Dashboard', 'index.html'], ['Classes', 'classes.html'], ['Gradebook', 'gradebook.html'], ['Assignments', 'assignments.html'], ['Lesson plans', 'lesson-plans.html'], ['Reports', 'reports.html']];
    const index = [
      ...pages.map(([label, href]) => ({ label, href, kind: 'Page' })),
      ...DATA.classes.map((c) => ({ label: `${c.code} ${c.subject}`, extra: c.year, href: `gradebook.html?class=${c.code}`, kind: 'Class' })),
      ...Object.entries(DATA.gradebook).flatMap(([code, g]) => g.students.map((s) => ({ label: s[0], href: `gradebook.html?class=${code}&student=${encodeURIComponent(s[0])}`, kind: code, person: true }))),
    ];
    let items = [];
    let active = -1;
    const close = () => { list.hidden = true; input.setAttribute('aria-expanded', 'false'); input.removeAttribute('aria-activedescendant'); active = -1; };
    const setActive = (i) => {
      const opts = $$('[role="option"]:not([aria-disabled])', list);
      if (!opts.length) return;
      active = (i + opts.length) % opts.length;
      opts.forEach((o, k) => o.setAttribute('aria-selected', String(k === active)));
      input.setAttribute('aria-activedescendant', opts[active].id);
      opts[active].scrollIntoView({ block: 'nearest' });
    };
    const go = (i) => { if (items[i]) window.location.href = items[i].href; };
    const render = () => {
      const q = input.value.trim().toLowerCase();
      if (!q) { close(); return; }
      items = index.filter((it) => it.label.toLowerCase().includes(q) || (it.extra || '').toLowerCase().includes(q)).slice(0, 8);
      list.textContent = '';
      if (!items.length) {
        const li = document.createElement('li');
        li.className = 'sr-empty'; li.setAttribute('role', 'option'); li.setAttribute('aria-disabled', 'true'); li.id = 'sr-none';
        li.textContent = 'No students, classes or pages match';
        list.appendChild(li);
      }
      items.forEach((it, i) => {
        const li = document.createElement('li');
        li.id = `sr-${i}`; li.setAttribute('role', 'option'); li.setAttribute('aria-selected', 'false');
        const lead = document.createElement('span');
        lead.setAttribute('aria-hidden', 'true');
        if (it.person) { lead.className = `avatar av-${avTone(it.label)}`; lead.textContent = initials(it.label); } else { lead.className = 'sr-ic'; lead.innerHTML = it.kind === 'Class' ? ICONS.classes : ICONS.file; }
        const text = document.createElement('span'); text.textContent = it.label;
        const kind = document.createElement('span'); kind.className = 'sr-kind'; kind.textContent = it.person ? `Student · ${it.kind}` : it.kind;
        li.append(lead, text, kind);
        li.addEventListener('mousedown', (e) => { e.preventDefault(); go(i); });
        list.appendChild(li);
      });
      list.hidden = false;
      input.setAttribute('aria-expanded', 'true');
      active = -1;
    };
    input.addEventListener('input', render);
    input.addEventListener('keydown', (e) => {
      if (e.key === 'ArrowDown') { e.preventDefault(); if (list.hidden) render(); setActive(active + 1); }
      else if (e.key === 'ArrowUp') { e.preventDefault(); setActive(active - 1); }
      else if (e.key === 'Enter') { e.preventDefault(); if (items.length) go(active > -1 ? active : 0); }
      else if (e.key === 'Escape') { if (!list.hidden) { e.preventDefault(); close(); } else input.value = ''; }
    });
    input.addEventListener('blur', () => setTimeout(close, 120));
    if (form) form.addEventListener('submit', (e) => e.preventDefault());
    document.addEventListener('keydown', (e) => {
      if (e.key !== '/' || e.ctrlKey || e.metaKey || e.altKey) return;
      if (e.target.closest('input, textarea, select, [contenteditable="true"], .gb-table') || !input.offsetParent) return;
      e.preventDefault();
      input.focus();
    });
  }

  function initNotifications() {
    const btn = $('#notify-btn');
    const clear = $('#notify-clear');
    if (!btn || !clear) return;
    const markRead = () => {
      btn.classList.remove('has-dot');
      btn.setAttribute('aria-label', 'Notifications, none unread');
      $$('.notify-list .is-unread').forEach((li) => li.classList.remove('is-unread'));
      clear.disabled = true;
      clear.textContent = 'All caught up';
    };
    if (store.get('gradebook-notes-read') === '1') markRead();
    clear.addEventListener('click', () => { markRead(); store.set('gradebook-notes-read', '1'); });
  }

  function initTableToggles() {
    $$('[data-table-toggle]').forEach((btn) => {
      const table = document.getElementById(btn.dataset.tableToggle);
      if (!table) return;
      btn.addEventListener('click', () => {
        const on = table.classList.toggle('is-shown');
        btn.setAttribute('aria-expanded', String(on));
        btn.textContent = on ? 'Hide table' : 'Show table';
      });
    });
  }

  /* ================================================================
   * Dashboard
   * ================================================================ */
  function initDashboardChart() {
    const plot = $('#avg-chart');
    if (!plot || !DATA) return;
    const TARGET = 70;
    const rows = DATA.classes.map((c) => { const m = getClass(c.code); return { code: c.code, subject: c.subject, avg: m ? classAvg(m) : 0 }; });
    const draw = () => {
      plot.textContent = '';
      const W = Math.max(280, plot.clientWidth);
      const H = 270;
      const m = { t: 18, r: 64, b: 44, l: 34 };
      const iw = W - m.l - m.r; const ih = H - m.t - m.b;
      const root = svg('svg', { viewBox: `0 0 ${W} ${H}`, width: W, height: H, role: 'group', 'aria-label': 'Class averages, bar chart' });
      const y = (v) => m.t + ih - (v / 100) * ih;
      [0, 25, 50, 75, 100].forEach((t) => {
        svg('line', { class: t ? 'grid-line' : 'base-line', x1: m.l, x2: W - m.r, y1: y(t), y2: y(t) }, root);
        svg('text', { class: 'axis-text', x: m.l - 8, y: y(t) + 4, 'text-anchor': 'end' }, root, `${t}`);
      });
      const bw = iw / rows.length; const barW = Math.min(24, bw * 0.55);
      const short = { Science: 'Sci', Physics: 'Phys', Chemistry: 'Chem' };
      rows.forEach((r, i) => {
        const cx = m.l + bw * i + bw / 2;
        const g = svg('g', { class: 'mark', tabindex: '0', role: 'img', 'aria-label': `${r.code} ${r.subject}: ${fmt1(r.avg)}%` }, root);
        svg('rect', { class: 'hit', x: cx - bw / 2 + 2, y: m.t - 12, width: bw - 4, height: ih + 12 }, g);
        svg('path', { class: 'bar', d: colPath(cx - barW / 2, y(r.avg), barW, y(0) - y(r.avg)) }, g);
        svg('text', { class: 'val-text', x: cx, y: y(r.avg) - 7, 'text-anchor': 'middle' }, g, Math.round(r.avg));
        svg('text', { class: 'axis-label', x: cx, y: H - m.b + 18, 'text-anchor': 'middle' }, g, r.code);
        svg('text', { class: 'axis-text', x: cx, y: H - m.b + 34, 'text-anchor': 'middle' }, g, bw < 72 ? short[r.subject] || r.subject : r.subject);
        bindTip(g, `${fmt1(r.avg)}%`, `${r.code} ${r.subject}`);
      });
      svg('line', { class: 'target-line', x1: m.l, x2: W - m.r + 6, y1: y(TARGET), y2: y(TARGET) }, root);
      svg('text', { class: 'target-text', x: W - m.r + 12, y: y(TARGET) - 2 }, root, 'Target');
      svg('text', { class: 'target-text', x: W - m.r + 12, y: y(TARGET) + 12 }, root, `${TARGET}%`);
      plot.appendChild(root);
    };
    draw();
    whenResized(plot, draw);
    const facts = $('#avg-facts');
    if (facts) {
      const hi = rows.reduce((m, r) => (r.avg > m.avg ? r : m));
      const lo = rows.reduce((m, r) => (r.avg < m.avg ? r : m));
      const put = (k, v) => { const el = $(`[data-fact="${k}"]`, facts); if (el) el.textContent = v; };
      put('hi', `${hi.code} · ${fmt1(hi.avg)}%`);
      put('lo', `${lo.code} · ${fmt1(lo.avg)}%`);
      put('on', `${rows.filter((r) => r.avg >= TARGET).length} of ${rows.length}`);
    }
  }

  function initRegister() {
    const form = $('#register-form');
    if (!form) return;
    const chips = $$('.reg-chip', form);
    const order = ['present', 'absent', 'late'];
    const label = { present: 'Present', absent: 'Absent', late: 'Late' };
    const success = $('#register-success');
    const count = () => {
      const c = { present: 0, absent: 0, late: 0 };
      chips.forEach((ch) => { c[ch.dataset.state] += 1; });
      Object.entries(c).forEach(([k, v]) => { const el = $(`[data-count="${k}"]`, form); if (el) el.textContent = v; });
      return c;
    };
    const set = (chip, state) => {
      chip.dataset.state = state;
      $('.reg-state', chip).textContent = label[state];
      chip.setAttribute('aria-label', `${chip.dataset.name}: ${label[state].toLowerCase()}`);
    };
    chips.forEach((chip) => chip.addEventListener('click', () => {
      set(chip, order[(order.indexOf(chip.dataset.state) + 1) % order.length]);
      count();
      if (success) success.hidden = true;
    }));
    const all = $('[data-register-reset]', form);
    if (all) all.addEventListener('click', () => { chips.forEach((ch) => set(ch, 'present')); count(); });
    form.addEventListener('submit', (e) => {
      e.preventDefault();
      const c = count();
      const now = new Date();
      const time = `${String(now.getHours()).padStart(2, '0')}:${String(now.getMinutes()).padStart(2, '0')}`;
      if (success) {
        success.innerHTML = `${ICONS.check}<span></span>`;
        $('span', success).textContent = `Register saved at ${time}: ${c.present} present, ${c.absent} absent, ${c.late} late.${c.absent ? ' Absences go to the attendance office.' : ''}`;
        success.hidden = false;
        success.focus();
      }
    });
  }

  function initPrep() {
    const count = $('#prep-count');
    if (!count) return;
    const boxes = $$('.prep input[type="checkbox"]');
    const update = () => { count.textContent = `${boxes.filter((b) => b.checked).length} of ${boxes.length} ready`; };
    boxes.forEach((b) => b.addEventListener('change', update));
    update();
  }

  /* ================================================================
   * Classes
   * ================================================================ */
  function initClassCards() {
    const grid = $('#class-grid');
    if (!grid) return;
    const btns = $$('[data-filter]');
    const sort = $('#class-sort');
    const status = $('#class-status');
    let filter = 'all';

    // Reflect marks edited in the gradebook.
    $$('.class-col', grid).forEach((col) => {
      const m = getClass(col.dataset.code);
      if (!m || !Object.keys(m.edits).length) return;
      const avg = classAvg(m);
      col.dataset.avg = avg.toFixed(1);
      const val = $('.class-avg-value', col);
      if (val) val.innerHTML = `${fmt1(avg)}<small>%</small>`;
      const diff = $('.class-avg-diff', col);
      if (diff && m.meta) {
        const d = avg - m.meta.target;
        diff.className = `class-avg-diff ${d >= 0 ? 'is-up' : 'is-down'}`;
        diff.textContent = `${d >= 0 ? '+' : '−'}${Math.abs(d).toFixed(1)} pts vs target`;
      }
    });

    const apply = () => {
      const cols = $$('.class-col', grid);
      let shown = 0;
      cols.forEach((c) => {
        if (c.classList.contains('class-col-note')) return;
        const on = filter === 'all' || c.dataset.stage === filter;
        c.hidden = !on;
        if (on) shown += 1;
      });
      const key = sort ? sort.value : 'order';
      cols.sort((a, b) => {
        const na = a.classList.contains('class-col-note'); const nb = b.classList.contains('class-col-note');
        if (na || nb) return na - nb;
        if (key === 'avg-desc') return b.dataset.avg - a.dataset.avg;
        if (key === 'avg-asc') return a.dataset.avg - b.dataset.avg;
        if (key === 'size') return b.dataset.size - a.dataset.size;
        return a.dataset.order - b.dataset.order;
      }).forEach((c) => grid.appendChild(c));
      if (status) status.textContent = `${shown} ${shown === 1 ? 'class' : 'classes'} shown`;
    };
    btns.forEach((b) => b.addEventListener('click', () => {
      filter = b.dataset.filter;
      btns.forEach((x) => x.setAttribute('aria-pressed', String(x === b)));
      apply();
    }));
    if (sort) sort.addEventListener('change', apply);
  }

  /* ================================================================
   * Gradebook grid
   * ================================================================ */
  function initGradebook() {
    const wrap = $('#gb-scroll');
    if (!wrap || !DATA) return;
    const sel = $('#gb-class');
    const filterIn = $('#gb-filter');
    const showSel = $('#gb-show');
    const colourSw = $('#gb-colour');
    const live = $('#gb-live');
    const undoBtn = $('#gb-undo');
    const resetBtn = $('#gb-reset');
    const exportBtn = $('#gb-export');
    const viewBtns = $$('[data-view]');
    const params = new URLSearchParams(window.location.search);

    let code = DATA.gradebook[params.get('class')] ? params.get('class') : (sel ? sel.value : Object.keys(DATA.gradebook)[0]);
    let model = null;
    let table = null;
    let view = store.get('gradebook-view') === 'pct' ? 'pct' : 'marks';
    let sort = { key: null, dir: 1 };
    let active = { r: null, c: 0 };
    let editing = null;
    let undo = [];

    const readOnly = () => document.documentElement.hasAttribute('data-term-archived');
    const announce = (msg) => { if (!live) return; live.textContent = ''; setTimeout(() => { live.textContent = msg; }, 40); };
    const cellAt = (r, c) => table && table.querySelector(`tbody tr[data-r="${r}"] td[data-c="${c}"]`);
    const visibleRows = () => $$('tbody tr:not([hidden])', table);
    const display = (v, max) => (v == null ? '' : view === 'pct' ? `${Math.round(pct(v, max))}%` : String(v));
    const cellInner = (v, max) => (v == null ? '<span aria-hidden="true">–</span><span class="visually-hidden">Not submitted</span>' : esc(display(v, max)));

    function tableHTML() {
      const as = model.assignments;
      const head = as.map((a, j) => `<th scope="col" class="gb-col" data-c="${j}"><span class="gb-type t-${a.type.toLowerCase()}">${esc(a.type)}</span><span class="gb-col-title">${esc(a.title)}</span><span class="gb-col-meta">${esc(a.date)} · /${a.max}</span></th>`).join('');
      const rows = model.students.map((s) => {
        const cells = s.scores.map((v, j) => `<td class="gb-cell ${band(pct(v, as[j].max))}${`${s.r}:${j}` in model.edits ? ' is-edited' : ''}" data-c="${j}" tabindex="-1">${cellInner(v, as[j].max)}</td>`).join('');
        const avg = studentAvg(s, as);
        const flags = s.flags.map((f) => `<abbr class="flag" title="${FLAG_TITLE[f] || f}">${esc(f)}</abbr>`).join('');
        return `<tr data-r="${s.r}"><th scope="row" class="gb-student">${avatarHTML(s.name)}<span class="gb-name">${esc(s.name)}</span>${flags}</th>${cells}<td class="gb-avg ${band(avg)}" aria-readonly="true">${fmt1(avg)}%</td></tr>`;
      }).join('');
      const foot = as.map((a, j) => { const v = assignmentAvg(model.students, j, a.max); return `<td class="gb-foot ${band(v)}" data-c="${j}" aria-readonly="true">${fmt1(v)}%</td>`; }).join('');
      const cAvg = classAvg(model);
      const meta = model.meta || { subject: '' };
      return `<table class="gb-table" id="gb-table" role="grid" aria-labelledby="gb-caption" aria-describedby="gb-kbd-summary">
        <caption id="gb-caption" class="visually-hidden">${esc(model.code)} ${esc(meta.subject)} marks, Autumn term</caption>
        <thead><tr>
          <th scope="col" class="gb-corner" aria-sort="none"><button type="button" class="gb-sort" data-sort="name">Student ${ICONS.chevdown}</button></th>${head}
          <th scope="col" class="gb-avg-head" aria-sort="none"><button type="button" class="gb-sort" data-sort="avg">Average ${ICONS.chevdown}</button></th>
        </tr></thead>
        <tbody>${rows}</tbody>
        <tfoot><tr><th scope="row" class="gb-student gb-foot-label">Class average</th>${foot}<td class="gb-foot gb-foot-avg ${band(cAvg)}" aria-readonly="true">${fmt1(cAvg)}%</td></tr></tfoot>
      </table>`;
    }

    function render() {
      wrap.innerHTML = tableHTML();
      table = $('#gb-table', wrap);
      table.classList.toggle('no-scale', colourSw ? !colourSw.checked : false);
      table.classList.toggle('is-readonly', readOnly());
      applySort();
      applyFilter(false);
      const first = visibleRows()[0];
      active = { r: first ? +first.dataset.r : null, c: 0 };
      const td = active.r != null ? cellAt(active.r, 0) : null;
      if (td) td.tabIndex = 0;
    }

    function paintCell(r, c) {
      const td = cellAt(r, c);
      if (!td) return;
      const a = model.assignments[c];
      const v = model.students[r].scores[c];
      const isActive = td.tabIndex === 0;
      td.className = `gb-cell ${band(pct(v, a.max))}${`${r}:${c}` in model.edits ? ' is-edited' : ''}`;
      td.innerHTML = cellInner(v, a.max);
      td.tabIndex = isActive ? 0 : -1;
    }
    function paintRow(r) {
      const tr = table.querySelector(`tbody tr[data-r="${r}"]`);
      const avg = studentAvg(model.students[r], model.assignments);
      const td = tr && $('.gb-avg', tr);
      if (td) { td.className = `gb-avg ${band(avg)}`; td.textContent = `${fmt1(avg)}%`; }
    }
    function paintFoot(c) {
      const a = model.assignments[c];
      const v = assignmentAvg(model.students, c, a.max);
      const td = table.querySelector(`tfoot td[data-c="${c}"]`);
      if (td) { td.className = `gb-foot ${band(v)}`; td.textContent = `${fmt1(v)}%`; }
      const cAvg = classAvg(model);
      const all = $('tfoot .gb-foot-avg', table);
      if (all) { all.className = `gb-foot gb-foot-avg ${band(cAvg)}`; all.textContent = `${fmt1(cAvg)}%`; }
    }
    function repaintAll() { model.students.forEach((s) => s.scores.forEach((v, c) => paintCell(s.r, c))); }

    function updateSummary() {
      const as = model.assignments;
      const avgs = model.students.map((s) => ({ n: s.name, a: studentAvg(s, as) })).filter((x) => x.a != null);
      const hi = avgs.reduce((m, x) => (x.a > m.a ? x : m), avgs[0]);
      const lo = avgs.reduce((m, x) => (x.a < m.a ? x : m), avgs[0]);
      const missing = model.students.reduce((n, s) => n + s.scores.filter((v) => v == null).length, 0);
      const edits = Object.keys(model.edits).length;
      const set = (k, v) => { const el = $(`[data-sum="${k}"]`); if (el) el.textContent = v; };
      set('avg', `${fmt1(classAvg(model))}%`);
      set('hi', `${fmt1(hi.a)}%`); set('hi-name', hi.n);
      set('lo', `${fmt1(lo.a)}%`); set('lo-name', lo.n);
      set('missing', missing);
      set('edits', edits);
      set('saved', edits ? 'Kept in this browser' : 'No changes yet');
    }
    const syncUndo = () => { if (undoBtn) undoBtn.disabled = !undo.length; };

    function setScore(r, c, v, record = true) {
      const s = model.students[r];
      const prev = s.scores[c];
      if (prev === v) return false;
      s.scores[c] = v;
      if (record) { undo.push({ r, c, prev }); syncUndo(); }
      const key = `${r}:${c}`;
      if (v === s.base[c]) delete model.edits[key]; else model.edits[key] = v;
      store.set(EDIT_KEY(model.code), JSON.stringify(model.edits));
      paintCell(r, c); paintRow(r); paintFoot(c); updateSummary();
      return true;
    }

    /* ---- focus + movement ---- */
    function focusCell(td, scroll = true) {
      if (!td) return;
      $$('td[tabindex="0"]', table).forEach((x) => { x.tabIndex = -1; });
      td.tabIndex = 0;
      td.focus({ preventScroll: true });
      const tr = td.parentElement;
      active = { r: +tr.dataset.r, c: +td.dataset.c };
      $$('.is-active-row', table).forEach((x) => x.classList.remove('is-active-row'));
      $$('.is-active-col', table).forEach((x) => x.classList.remove('is-active-col'));
      tr.classList.add('is-active-row');
      const th = table.querySelector(`thead th[data-c="${active.c}"]`);
      if (th) th.classList.add('is-active-col');
      if (scroll) ensureVisible(td);
    }
    function ensureVisible(td) {
      const w = wrap.getBoundingClientRect();
      const t = td.getBoundingClientRect();
      const headH = table.tHead.getBoundingClientRect().height;
      const footH = table.tFoot.getBoundingClientRect().height;
      const leftW = table.tHead.rows[0].cells[0].getBoundingClientRect().width;
      const cells = table.tHead.rows[0].cells;
      const rightW = cells[cells.length - 1].getBoundingClientRect().width;
      if (t.top < w.top + headH) wrap.scrollTop -= w.top + headH - t.top;
      else if (t.bottom > w.bottom - footH) wrap.scrollTop += t.bottom - (w.bottom - footH);
      if (t.left < w.left + leftW) wrap.scrollLeft -= w.left + leftW - t.left;
      else if (t.right > w.right - rightW) wrap.scrollLeft += t.right - (w.right - rightW);
    }
    function move(dr, dc) {
      const rows = visibleRows();
      if (!rows.length) return;
      let ri = rows.findIndex((tr) => +tr.dataset.r === active.r);
      if (ri < 0) ri = 0;
      ri = Math.max(0, Math.min(rows.length - 1, ri + dr));
      const c = Math.max(0, Math.min(model.assignments.length - 1, active.c + dc));
      focusCell($(`td[data-c="${c}"]`, rows[ri]));
    }
    function moveTab(back) {
      const rows = visibleRows();
      const last = model.assignments.length - 1;
      let ri = rows.findIndex((tr) => +tr.dataset.r === active.r);
      let c = active.c + (back ? -1 : 1);
      if (c > last) { c = 0; ri += 1; }
      if (c < 0) { c = last; ri -= 1; }
      if (ri < 0 || ri >= rows.length) return false;
      focusCell($(`td[data-c="${c}"]`, rows[ri]));
      return true;
    }
    function jump(toEnd, wholeGrid) {
      const rows = visibleRows();
      if (!rows.length) return;
      const c = toEnd ? model.assignments.length - 1 : 0;
      const tr = wholeGrid ? rows[toEnd ? rows.length - 1 : 0] : rows.find((x) => +x.dataset.r === active.r) || rows[0];
      focusCell($(`td[data-c="${c}"]`, tr));
    }

    /* ---- editing ---- */
    function startEdit(td, initial = null) {
      if (!td || editing) return;
      if (readOnly()) { announce('This term is archived. Marks are read-only.'); toast('Archived term: marks are read-only.'); return; }
      const r = +td.parentElement.dataset.r;
      const c = +td.dataset.c;
      const a = model.assignments[c];
      const cur = model.students[r].scores[c];
      const input = document.createElement('input');
      input.type = 'text';
      input.inputMode = 'decimal';
      input.autocomplete = 'off';
      input.className = 'gb-input';
      input.setAttribute('aria-label', `${model.students[r].name}, ${a.title}, mark out of ${a.max}`);
      input.value = initial != null ? initial : cur == null ? '' : String(cur);
      const max = document.createElement('span');
      max.className = 'gb-max'; max.setAttribute('aria-hidden', 'true'); max.textContent = `/${a.max}`;
      td.append(input, max);
      td.classList.add('is-editing');
      editing = { td, input, max, r, c, closing: false, error: null };
      input.focus();
      if (initial == null) input.select(); else input.setSelectionRange(input.value.length, input.value.length);
      input.addEventListener('keydown', onEditKey);
      input.addEventListener('blur', onEditBlur);
      input.addEventListener('input', () => { if (editing && editing.error) { editing.error.remove(); editing.error = null; td.classList.remove('is-invalid'); } });
    }
    function stopEdit() {
      if (!editing) return null;
      const e = editing;
      e.closing = true;
      editing = null;
      e.input.remove(); e.max.remove();
      if (e.error) e.error.remove();
      e.td.classList.remove('is-invalid', 'is-editing');
      return e;
    }
    function commit() {
      if (!editing) return true;
      const { input, r, c, td } = editing;
      const max = model.assignments[c].max;
      const raw = input.value.trim().replace(',', '.');
      let v = null;
      if (raw !== '') {
        const n = Number(raw);
        if (!Number.isFinite(n) || n < 0 || n > max || Math.round(n * 2) !== n * 2) {
          td.classList.remove('is-invalid'); void td.offsetWidth; td.classList.add('is-invalid');
          if (!editing.error) { const err = document.createElement('span'); err.className = 'gb-error'; err.setAttribute('aria-hidden', 'true'); td.appendChild(err); editing.error = err; }
          editing.error.textContent = `Enter 0 to ${max}`;
          announce(`Invalid mark. Enter a number from 0 to ${max}, or leave it blank.`);
          return false;
        }
        v = n;
      }
      stopEdit();
      const changed = setScore(r, c, v);
      if (changed) {
        const avg = studentAvg(model.students[r], model.assignments);
        announce(`${model.students[r].name}, ${v == null ? 'mark cleared' : `${v} out of ${max}`}. Average now ${fmt1(avg)} percent.`);
        const cell = cellAt(r, c);
        if (cell) { cell.classList.add('is-flash'); setTimeout(() => cell.classList.remove('is-flash'), 700); }
      }
      return true;
    }
    function onEditKey(e) {
      if (e.key === 'Enter') { e.preventDefault(); if (commit()) move(e.shiftKey ? -1 : 1, 0); }
      else if (e.key === 'Tab') { e.preventDefault(); if (commit() && !moveTab(e.shiftKey)) focusCell(cellAt(active.r, active.c)); }
      else if (e.key === 'Escape') { e.preventDefault(); const was = stopEdit(); if (was) focusCell(was.td); announce('Edit cancelled.'); }
      else if (e.key === 'ArrowUp' || e.key === 'ArrowDown') { e.preventDefault(); if (commit()) move(e.key === 'ArrowUp' ? -1 : 1, 0); }
    }
    function onEditBlur() {
      if (!editing || editing.closing) return;
      if (!commit()) stopEdit();
    }

    function undoLast() {
      const step = undo.pop();
      syncUndo();
      if (!step) return;
      setScore(step.r, step.c, step.prev, false);
      const td = cellAt(step.r, step.c);
      if (td && !td.parentElement.hidden) focusCell(td);
      announce(`Undone. ${model.students[step.r].name}, ${model.assignments[step.c].title} is back to ${step.prev == null ? 'blank' : step.prev}.`);
    }

    /* ---- sort + filter ---- */
    function applySort() {
      const tbody = table.tBodies[0];
      const rows = $$('tr', tbody);
      const as = model.assignments;
      if (sort.key) {
        rows.sort((a, b) => {
          const sa = model.students[+a.dataset.r]; const sb = model.students[+b.dataset.r];
          if (sort.key === 'name') return sort.dir * sa.name.split(' ').pop().localeCompare(sb.name.split(' ').pop());
          return sort.dir * ((studentAvg(sa, as) ?? -1) - (studentAvg(sb, as) ?? -1));
        });
      } else rows.sort((a, b) => a.dataset.r - b.dataset.r);
      rows.forEach((tr) => tbody.appendChild(tr));
      $$('thead th[aria-sort]', table).forEach((th) => {
        const k = $('.gb-sort', th).dataset.sort;
        th.setAttribute('aria-sort', sort.key === k ? (sort.dir > 0 ? 'ascending' : 'descending') : 'none');
      });
    }
    function applyFilter(speak = true) {
      const q = filterIn ? filterIn.value.trim().toLowerCase() : '';
      const mode = showSel ? showSel.value : 'all';
      let shown = 0;
      $$('tbody tr', table).forEach((tr) => {
        const s = model.students[+tr.dataset.r];
        let on = !q || s.name.toLowerCase().includes(q);
        if (on && mode === 'missing') on = s.scores.some((v) => v == null);
        if (on && mode === 'low') { const a = studentAvg(s, model.assignments); on = a != null && a < 55; }
        tr.hidden = !on;
        if (on) shown += 1;
      });
      if (speak) announce(`${shown} of ${model.students.length} students shown.`);
      const activeRow = table.querySelector(`tbody tr[data-r="${active.r}"]`);
      if (!activeRow || activeRow.hidden) {
        $$('td[tabindex="0"]', table).forEach((x) => { x.tabIndex = -1; });
        const first = visibleRows()[0];
        if (first) { active = { r: +first.dataset.r, c: active.c || 0 }; const td = $(`td[data-c="${active.c}"]`, first); if (td) td.tabIndex = 0; }
      }
    }

    /* ---- class switching ---- */
    function load(nextCode, focusStudent = null) {
      code = nextCode;
      model = getClass(code);
      undo = [];
      sort = { key: null, dir: 1 };
      syncUndo();
      if (sel) sel.value = code;
      if (filterIn) filterIn.value = focusStudent || '';
      render();
      updateSummary();
      const url = new URL(window.location.href);
      url.searchParams.set('class', code);
      if (!focusStudent) url.searchParams.delete('student');
      window.history.replaceState(null, '', url);
    }

    /* ---- events (delegated, bound once) ---- */
    wrap.addEventListener('keydown', (e) => {
      if (editing) return;
      const td = e.target.closest && e.target.closest('td.gb-cell');
      if (!td) return;
      const mod = e.ctrlKey || e.metaKey;
      switch (e.key) {
        case 'ArrowUp': e.preventDefault(); move(-1, 0); break;
        case 'ArrowDown': e.preventDefault(); move(1, 0); break;
        case 'ArrowLeft': e.preventDefault(); move(0, -1); break;
        case 'ArrowRight': e.preventDefault(); move(0, 1); break;
        case 'PageUp': e.preventDefault(); move(-10, 0); break;
        case 'PageDown': e.preventDefault(); move(10, 0); break;
        case 'Home': e.preventDefault(); jump(false, mod); break;
        case 'End': e.preventDefault(); jump(true, mod); break;
        case 'Enter': case 'F2': e.preventDefault(); startEdit(td); break;
        case 'Tab': if (moveTab(e.shiftKey)) e.preventDefault(); break;
        case 'Delete': case 'Backspace':
          e.preventDefault();
          if (readOnly()) { announce('This term is archived. Marks are read-only.'); break; }
          if (setScore(active.r, active.c, null)) announce(`${model.students[active.r].name}, mark cleared.`);
          break;
        default:
          if (mod && (e.key === 'z' || e.key === 'Z')) { e.preventDefault(); undoLast(); break; }
          if (!mod && !e.altKey && /^[0-9.]$/.test(e.key)) { e.preventDefault(); startEdit(td, e.key); }
      }
    });
    let focusedAtPointerDown = null;
    wrap.addEventListener('pointerdown', () => { focusedAtPointerDown = document.activeElement; });
    wrap.addEventListener('click', (e) => {
      const sortBtn = e.target.closest('.gb-sort');
      if (sortBtn) {
        const k = sortBtn.dataset.sort;
        sort = sort.key === k ? { key: k, dir: -sort.dir } : { key: k, dir: k === 'avg' ? -1 : 1 };
        applySort();
        announce(`Sorted by ${k === 'name' ? 'surname' : 'average'}, ${sort.dir > 0 ? 'ascending' : 'descending'}.`);
        return;
      }
      const td = e.target.closest('td.gb-cell');
      if (!td || (editing && editing.td === td)) return;
      const wasActive = focusedAtPointerDown === td;
      focusCell(td, false);
      if (wasActive) startEdit(td);
    });
    wrap.addEventListener('dblclick', (e) => { const td = e.target.closest('td.gb-cell'); if (td && !editing) startEdit(td); });

    if (sel) sel.addEventListener('change', () => { if (editing) stopEdit(); load(sel.value); announce(`Showing ${sel.options[sel.selectedIndex].text}.`); });
    if (filterIn) filterIn.addEventListener('input', () => applyFilter());
    if (showSel) showSel.addEventListener('change', () => applyFilter());
    if (colourSw) {
      colourSw.checked = store.get('gradebook-colour') !== 'off';
      colourSw.addEventListener('change', () => { table.classList.toggle('no-scale', !colourSw.checked); store.set('gradebook-colour', colourSw.checked ? 'on' : 'off'); });
    }
    const syncView = () => viewBtns.forEach((b) => b.setAttribute('aria-pressed', String(b.dataset.view === view)));
    viewBtns.forEach((b) => b.addEventListener('click', () => { view = b.dataset.view; store.set('gradebook-view', view); syncView(); repaintAll(); }));
    syncView();
    if (undoBtn) undoBtn.addEventListener('click', undoLast);
    if (resetBtn) {
      let armed = null;
      const label = resetBtn.innerHTML;
      resetBtn.addEventListener('click', () => {
        if (!armed) {
          resetBtn.innerHTML = `${ICONS.alert}Click again to reset`;
          armed = setTimeout(() => { resetBtn.innerHTML = label; armed = null; }, 4000);
          return;
        }
        clearTimeout(armed); armed = null; resetBtn.innerHTML = label;
        store.del(EDIT_KEY(code));
        load(code);
        toast(`Marks for ${code} restored to the original data.`);
      });
    }
    if (exportBtn) exportBtn.addEventListener('click', () => {
      const as = model.assignments;
      const q = (s) => (/[",\r\n]/.test(s) ? `"${s.replace(/"/g, '""')}"` : s);
      const order = $$('tbody tr', table).map((tr) => model.students[+tr.dataset.r]);
      const rows = [['Student', 'Flags', ...as.map((a) => `${a.title} (/${a.max})`), 'Average %']];
      order.forEach((s) => rows.push([s.name, s.flags.join(' '), ...s.scores.map((v) => (v == null ? '' : String(v))), fmt1(studentAvg(s, as))]));
      rows.push(['Class average %', '', ...as.map((a, j) => fmt1(assignmentAvg(model.students, j, a.max))), fmt1(classAvg(model))]);
      const csv = `﻿${rows.map((r) => r.map((x) => q(String(x))).join(',')).join('\r\n')}`;
      const url = URL.createObjectURL(new Blob([csv], { type: 'text/csv;charset=utf-8' }));
      const a = document.createElement('a');
      const subject = model.meta ? model.meta.subject.toLowerCase() : 'class';
      a.href = url;
      a.download = `harbourview-${code.toLowerCase()}-${subject}-autumn-term.csv`;
      document.body.appendChild(a); a.click(); a.remove();
      setTimeout(() => URL.revokeObjectURL(url), 1500);
      toast(`Exported ${order.length} students in ${code} to CSV.`);
    });
    document.addEventListener('gradebook:term', (e) => {
      if (table) table.classList.toggle('is-readonly', e.detail.archived);
      if (e.detail.archived && editing) { const was = stopEdit(); if (was) focusCell(was.td); }
    });

    const student = params.get('student');
    load(code, student);
    if (student) {
      const first = visibleRows()[0];
      if (first) setTimeout(() => focusCell($('td[data-c="0"]', first)), 60);
    }
  }

  /* ================================================================
   * Assignments: list filters, rubric builder, create form
   * ================================================================ */
  let addAssignment = null;

  function initAssignmentList() {
    const list = $('#assign-list');
    if (!list) return;
    const btns = $$('[data-status-filter]');
    const search = $('#assign-search');
    const empty = $('#assign-empty');
    let status = 'all';
    const apply = () => {
      const q = search ? search.value.trim().toLowerCase() : '';
      let shown = 0;
      $$('.assign-item', list).forEach((li) => {
        const on = (status === 'all' || li.dataset.status === status) && (!q || li.dataset.search.includes(q));
        li.hidden = !on;
        if (on) shown += 1;
      });
      if (empty) empty.hidden = shown > 0;
    };
    const recount = () => {
      const items = $$('.assign-item', list);
      $$('[data-status-count]').forEach((el) => {
        const k = el.dataset.statusCount;
        el.textContent = k === 'all' ? items.length : items.filter((li) => li.dataset.status === k).length;
      });
    };
    btns.forEach((b) => b.addEventListener('click', () => {
      status = b.dataset.statusFilter;
      btns.forEach((x) => x.setAttribute('aria-pressed', String(x === b)));
      apply();
    }));
    if (search) search.addEventListener('input', apply);

    addAssignment = (a) => {
      const meta = classMeta(a.code);
      const li = document.createElement('li');
      li.className = 'assign-item is-new';
      li.dataset.status = 'open';
      li.dataset.search = `${a.code} ${a.title} ${a.type}`.toLowerCase();
      li.innerHTML = `
        <div class="assign-main">
          <p class="assign-kicker">${chipHTML(a.code)}<span class="gb-type t-${a.type.toLowerCase()}">${esc(a.type)}</span></p>
          <h3 class="assign-title"><a href="gradebook.html?class=${encodeURIComponent(a.code)}">${esc(a.title)}</a></h3>
          <p class="assign-meta"><span>Set ${esc(a.set)}</span><span>Due ${esc(a.due)}</span><span>${a.max} marks</span><span>${a.crit} ${a.crit === 1 ? 'criterion' : 'criteria'}</span></p>
        </div>
        <div class="assign-progress">
          <p><span>Handed in</span><strong>0/${meta ? meta.size || '' : ''}</strong></p>
          <div class="meter" role="img" aria-label="None handed in yet"><span style="width:0%"></span></div>
          <p><span>Marked</span><strong>0/0</strong></p>
          <div class="meter meter-accent" role="img" aria-label="None marked yet"><span style="width:0%"></span></div>
        </div>
        <span class="pill pill-open">Open</span>`;
      list.prepend(li);
      recount();
      apply();
    };
  }

  function initRubric() {
    const list = $('#rubric-list');
    if (!list) return;
    const add = $('#rubric-add');
    const totalEl = $('#rubric-total');
    const bar = $('#rubric-bar');
    const initial = list.innerHTML;
    let uid = $$('.rubric-row', list).length;

    const renumber = () => {
      const rows = $$('.rubric-row', list);
      rows.forEach((row, i) => {
        const n = i + 1;
        $('.rubric-num', row).textContent = n;
        $('.rubric-name label', row).textContent = `Criterion ${n}`;
        $('.rubric-points label', row).textContent = `Points for criterion ${n}`;
        const rm = $('.rubric-remove', row);
        rm.setAttribute('aria-label', `Remove criterion ${n}`);
        rm.disabled = rows.length === 1;
      });
    };
    const total = () => {
      let sum = 0;
      if (bar) bar.textContent = '';
      $$('.rubric-row', list).forEach((row) => {
        const pts = parseInt($('.rubric-points input', row).value, 10);
        if (pts > 0) {
          sum += pts;
          if (bar) { const seg = document.createElement('span'); seg.style.flexGrow = pts; seg.title = `${$('.rubric-name input', row).value || 'Untitled'}: ${pts}`; bar.appendChild(seg); }
        }
      });
      if (totalEl) totalEl.innerHTML = `<strong>${sum}</strong> points in total`;
      return sum;
    };
    const makeRow = () => {
      uid += 1;
      const li = document.createElement('li');
      li.className = 'rubric-row is-new';
      li.innerHTML = `
        <span class="rubric-num" aria-hidden="true"></span>
        <div class="rubric-field rubric-name"><label class="visually-hidden" for="crit-name-${uid}"></label><input type="text" class="form-control" id="crit-name-${uid}" placeholder="What earns these marks?" required></div>
        <div class="rubric-field rubric-points"><label class="visually-hidden" for="crit-pts-${uid}"></label><input type="number" class="form-control" id="crit-pts-${uid}" value="5" min="1" max="100" step="1" inputmode="numeric" required><span class="rubric-unit" aria-hidden="true">pts</span></div>
        <button type="button" class="icon-btn icon-btn-sm rubric-remove">${ICONS.trash}</button>`;
      return li;
    };
    if (add) add.addEventListener('click', () => {
      const row = makeRow();
      list.appendChild(row);
      renumber(); total();
      $('.rubric-name input', row).focus();
    });
    list.addEventListener('click', (e) => {
      const btn = e.target.closest('.rubric-remove');
      if (!btn || btn.disabled) return;
      const row = btn.closest('.rubric-row');
      const rows = $$('.rubric-row', list);
      const i = rows.indexOf(row);
      row.remove();
      renumber(); total();
      const left = $$('.rubric-row', list);
      const next = left[Math.min(i, left.length - 1)];
      if (next) $('.rubric-remove', next).focus(); else if (add) add.focus();
      toast(`Criterion removed. Rubric total is now ${total()} points.`);
    });
    list.addEventListener('input', total);
    const form = list.closest('form');
    if (form) form.addEventListener('reset', () => setTimeout(() => { list.innerHTML = initial; renumber(); total(); }, 0));
    renumber(); total();
  }

  function initAssignmentForm() {
    const form = $('#assign-form');
    if (!form) return;
    const success = $('#assign-success');
    const title = $('#as-title');
    const cls = $('#as-class');
    const type = $('#as-type');
    const setD = $('#as-set');
    const due = $('#as-due');
    const rubricErr = $('#rubric-err');
    const fmtDate = (v) => { const d = new Date(`${v}T12:00:00`); return Number.isNaN(d.getTime()) ? v : d.toLocaleDateString('en-GB', { weekday: 'short', day: 'numeric', month: 'short' }); };
    const flag = (field, bad) => {
      field.setAttribute('aria-invalid', String(bad));
      const err = document.getElementById(field.getAttribute('aria-describedby'));
      if (err) err.classList.toggle('show', bad);
      return !bad;
    };
    [title, cls, due].forEach((f) => f && f.addEventListener('input', () => { if (f.getAttribute('aria-invalid') === 'true') flag(f, false); }));
    form.addEventListener('submit', (e) => {
      e.preventDefault();
      if (success) success.hidden = true;
      const okTitle = flag(title, !title.value.trim());
      const okClass = flag(cls, !cls.value);
      const okDue = flag(due, !due.value || (setD.value && due.value < setD.value));
      let okRubric = true;
      $$('.rubric-row').forEach((row) => {
        const n = $('.rubric-name input', row);
        const p = $('.rubric-points input', row);
        const pv = parseInt(p.value, 10);
        const badN = !n.value.trim(); const badP = !(pv >= 1 && pv <= 100);
        n.setAttribute('aria-invalid', String(badN)); p.setAttribute('aria-invalid', String(badP));
        if (badN || badP) okRubric = false;
      });
      if (rubricErr) rubricErr.classList.toggle('show', !okRubric);
      const firstBad = form.querySelector('[aria-invalid="true"]');
      if (firstBad) { firstBad.focus(); return; }
      if (!(okTitle && okClass && okDue && okRubric)) return;
      const rows = $$('.rubric-row');
      const max = rows.reduce((s, row) => s + parseInt($('.rubric-points input', row).value, 10), 0);
      const item = { code: cls.value, title: title.value.trim(), type: type.value, set: fmtDate(setD.value), due: fmtDate(due.value), max, crit: rows.length };
      if (addAssignment) addAssignment(item);
      if (success) {
        success.innerHTML = `${ICONS.check}<span></span>`;
        $('span', success).textContent = `“${item.title}” is set for ${item.code}, due ${item.due}, out of ${max} marks. It is now at the top of the list.`;
        success.hidden = false;
        success.focus();
      }
      title.value = ''; due.value = ''; $('#as-notes').value = '';
    });
    form.addEventListener('reset', () => {
      $$('[aria-invalid]', form).forEach((f) => f.setAttribute('aria-invalid', 'false'));
      $$('.field-error', form).forEach((f) => f.classList.remove('show'));
      if (success) success.hidden = true;
    });
  }

  /* ================================================================
   * Lesson plans board + dialog
   * ================================================================ */
  function initPlans() {
    const board = $('#board');
    const dlg = $('#plan-dialog');
    if (!board || !dlg) return;
    const form = $('#plan-form');
    const heading = $('#plan-dialog-title');
    const del = $('#plan-delete');
    const f = { day: $('#pl-day'), period: $('#pl-period'), cls: $('#pl-class'), title: $('#pl-title'), obj: $('#pl-obj'), res: $('#pl-res') };
    const filter = $('#plan-filter');
    const TIMES = { 1: '08:50', 2: '09:50', 3: '11:10', 4: '13:00', 5: '14:00' };
    const STATUS = { taught: 'Taught', ready: 'Ready', draft: 'Draft' };
    let current = null;
    let opener = null;
    let uid = $$('.plan-card', board).length;

    const periodErr = (() => {
      const p = document.createElement('p');
      p.className = 'field-error'; p.id = 'pl-period-err';
      f.period.setAttribute('aria-describedby', p.id);
      f.period.insertAdjacentElement('afterend', p);
      return p;
    })();
    const flag = (field, bad, err, msg) => {
      field.setAttribute('aria-invalid', String(bad));
      if (msg) err.textContent = msg;
      err.classList.toggle('show', bad);
      return !bad;
    };
    const refresh = () => {
      $$('.day-col', board).forEach((col) => {
        const n = $$('.plan-card', col).length;
        const el = $('[data-day-count]', col);
        if (el) el.textContent = `${n} ${n === 1 ? 'lesson' : 'lessons'}`;
      });
      const cards = $$('.plan-card', board);
      const set = (k, v) => { const el = $(`[data-plan-stat="${k}"]`); if (el) el.textContent = v; };
      set('total', cards.length);
      ['taught', 'ready', 'draft'].forEach((k) => set(k, cards.filter((c) => c.dataset.status === k).length));
      applyFilter();
    };
    const applyFilter = () => {
      const v = filter ? filter.value : 'all';
      $$('.plan-card', board).forEach((c) => { c.hidden = v !== 'all' && c.dataset.class !== v; });
    };
    const cardHTML = (d) => `
      <div class="plan-top"><span class="plan-period">P${d.period} · ${TIMES[d.period]}</span>${chipHTML(d.cls)}</div>
      <h3 class="plan-title">${esc(d.title)}</h3>
      <p class="plan-label">Objectives</p>
      <ul class="plan-obj">${d.obj.map((o) => `<li>${esc(o)}</li>`).join('')}</ul>
      ${d.res.length ? `<p class="plan-label">Resources</p><ul class="plan-res">${d.res.map((r) => `<li>${esc(r)}</li>`).join('')}</ul>` : ''}
      <div class="plan-foot"><button type="button" class="plan-edit" aria-label="Edit plan: ${esc(d.cls)} ${esc(d.title)}">${ICONS.pencil}Edit</button><span class="plan-status">${STATUS[d.status]}</span></div>`;

    const open = (card, day) => {
      current = card;
      opener = document.activeElement;
      form.reset();
      $$('[aria-invalid]', form).forEach((x) => x.setAttribute('aria-invalid', 'false'));
      $$('.field-error', form).forEach((x) => x.classList.remove('show'));
      if (card) {
        heading.textContent = 'Edit lesson plan';
        f.day.value = card.dataset.day; f.period.value = card.dataset.period; f.cls.value = card.dataset.class;
        f.title.value = $('.plan-title', card).textContent;
        f.obj.value = $$('.plan-obj li', card).map((li) => li.textContent).join('\n');
        f.res.value = $$('.plan-res li', card).map((li) => li.textContent).join(', ');
        const radio = $(`input[name="status"][value="${card.dataset.status}"]`, form);
        if (radio) radio.checked = true;
        del.hidden = false;
      } else {
        heading.textContent = 'New lesson plan';
        if (day) f.day.value = day;
        if (filter && filter.value !== 'all') f.cls.value = filter.value;
        del.hidden = true;
      }
      if (typeof dlg.showModal === 'function') dlg.showModal(); else dlg.setAttribute('open', '');
      f.title.focus();
    };
    const close = () => { if (typeof dlg.close === 'function') dlg.close(); else { dlg.removeAttribute('open'); dlg.dispatchEvent(new Event('close')); } };

    document.addEventListener('click', (e) => {
      const edit = e.target.closest('.plan-edit');
      if (edit && board.contains(edit)) { open(edit.closest('.plan-card')); return; }
      const addBtn = e.target.closest('[data-add-day]');
      if (addBtn) open(null, addBtn.dataset.addDay);
    });
    $$('[data-dialog-close]', dlg).forEach((b) => b.addEventListener('click', close));
    dlg.addEventListener('click', (e) => { if (e.target === dlg) close(); });
    dlg.addEventListener('close', () => {
      const target = opener && document.body.contains(opener) ? opener : $('.plan-add', board);
      if (target) target.focus();
    });

    form.addEventListener('submit', (e) => {
      e.preventDefault();
      const d = {
        day: f.day.value, period: +f.period.value, cls: f.cls.value, title: f.title.value.trim(),
        obj: f.obj.value.split('\n').map((s) => s.trim()).filter(Boolean),
        res: f.res.value.split(',').map((s) => s.trim()).filter(Boolean),
        status: ($('input[name="status"]:checked', form) || { value: 'draft' }).value,
      };
      const clash = $$(`.day-col[data-day="${d.day}"] .plan-card`, board).find((c) => +c.dataset.period === d.period && c !== current);
      const ok = [
        flag(f.title, !d.title, $('#pl-title-err')),
        flag(f.obj, !d.obj.length, $('#pl-obj-err')),
        flag(f.period, !!clash, periodErr, `P${d.period} on ${f.day.options[f.day.selectedIndex].text} already has a plan.`),
      ].every(Boolean);
      if (!ok) { const bad = form.querySelector('[aria-invalid="true"]'); if (bad) bad.focus(); return; }

      const card = current || document.createElement('article');
      if (!current) { uid += 1; card.dataset.id = `plan-${uid}`; }
      card.className = `plan-card status-${d.status}${current ? '' : ' is-new'}`;
      Object.assign(card.dataset, { day: d.day, period: d.period, class: d.cls, status: d.status });
      card.innerHTML = cardHTML(d);
      const col = $(`.day-col[data-day="${d.day}"] .day-cards`, board);
      const after = $$('.plan-card', col).filter((c) => c !== card).find((c) => +c.dataset.period > d.period);
      col.insertBefore(card, after || null);
      opener = $('.plan-edit', card);
      refresh();
      close();
      toast(current ? `Plan updated: ${d.cls} ${d.title}.` : `Plan added for ${d.cls} on ${f.day.options[f.day.selectedIndex].text}, P${d.period}.`);
    });
    del.addEventListener('click', () => {
      if (!current) return;
      const col = current.closest('.day-col');
      const name = $('.plan-title', current).textContent;
      current.remove();
      opener = $('.plan-add', col);
      refresh();
      close();
      toast(`Plan deleted: ${name}.`);
    });
    const wrapEl = $('#board-wrap');
    if (wrapEl) {
      const hint = () => {
        const max = board.scrollWidth - board.clientWidth;
        wrapEl.classList.toggle('more-right', max > 4 && board.scrollLeft < max - 4);
        wrapEl.classList.toggle('more-left', board.scrollLeft > 4);
      };
      board.addEventListener('scroll', hint, { passive: true });
      window.addEventListener('resize', hint);
      hint();
    }
    if (filter) {
      const p = new URLSearchParams(window.location.search).get('class');
      if (p && filter.querySelector(`option[value="${p}"]`)) filter.value = p;
      filter.addEventListener('change', applyFilter);
    }
    refresh();
  }

  /* ================================================================
   * Reports
   * ================================================================ */
  function reportData(code) {
    const m = getClass(code);
    const as = m.assignments;
    const rows = m.students.map((s) => {
      const avg = studentAvg(s, as);
      const p = s.scores.map((v, j) => pct(v, as[j].max)).filter((x) => x != null);
      const recent = mean(p.slice(-2));
      return { name: s.name, flags: s.flags, avg, miss: s.scores.filter((v) => v == null).length, change: recent - avg };
    }).filter((r) => r.avg != null);
    const sorted = rows.map((r) => r.avg).sort((a, b) => a - b);
    const mid = sorted.length / 2;
    const median = sorted.length % 2 ? sorted[Math.floor(mid)] : (sorted[mid - 1] + sorted[mid]) / 2;
    const BINS = [['Below 40', 0, 40], ['40–49', 40, 50], ['50–59', 50, 60], ['60–69', 60, 70], ['70–79', 70, 80], ['80–89', 80, 90], ['90+', 90, 101]];
    return {
      m, rows, median,
      avg: classAvg(m),
      onTarget: rows.filter((r) => r.avg >= m.meta.target).length,
      missing: rows.reduce((n, r) => n + r.miss, 0),
      hist: BINS.map(([label, lo, hi]) => ({ label, lo, n: rows.filter((r) => r.avg >= lo && r.avg < hi).length })),
      top: [...rows].sort((a, b) => b.avg - a.avg).slice(0, 5),
      risk: rows.filter((r) => r.avg < m.meta.target - 10 || r.miss >= 2 || r.change <= -10).sort((a, b) => a.avg - b.avg).slice(0, 5),
      breakdown: as.map((a, j) => ({ title: a.title, type: a.type, avg: assignmentAvg(m.students, j, a.max) })),
    };
  }

  function drawHistogram(plot, hist) {
    plot.textContent = '';
    const W = Math.max(280, plot.clientWidth);
    const H = 240;
    const m = { t: 22, r: 8, b: 30, l: 30 };
    const iw = W - m.l - m.r; const ih = H - m.t - m.b;
    const top = Math.max(4, ...hist.map((b) => b.n));
    const step = Math.max(1, niceStep(top, 4));
    const ymax = Math.ceil(top / step) * step;
    const y = (v) => m.t + ih - (v / ymax) * ih;
    const root = svg('svg', { viewBox: `0 0 ${W} ${H}`, width: W, height: H, role: 'group', 'aria-label': 'Grade distribution, histogram' });
    for (let t = 0; t <= ymax; t += step) {
      svg('line', { class: t ? 'grid-line' : 'base-line', x1: m.l, x2: W - m.r, y1: y(t), y2: y(t) }, root);
      svg('text', { class: 'axis-text', x: m.l - 8, y: y(t) + 4, 'text-anchor': 'end' }, root, t);
    }
    const bw = iw / hist.length; const barW = Math.min(bw - 2, 52);
    const SHORT = ['<40', '40s', '50s', '60s', '70s', '80s', '90+'];
    hist.forEach((b, i) => {
      const cx = m.l + bw * i + bw / 2;
      const g = svg('g', { class: 'mark', tabindex: '0', role: 'img', 'aria-label': `${b.label}%: ${b.n} ${b.n === 1 ? 'student' : 'students'}` }, root);
      svg('rect', { class: 'hit', x: cx - bw / 2 + 1, y: m.t - 14, width: bw - 2, height: ih + 14 }, g);
      if (b.n) svg('path', { class: `bar${b.lo < 50 ? ' bar-low' : ''}`, d: colPath(cx - barW / 2, y(b.n), barW, y(0) - y(b.n)) }, g);
      svg('text', { class: 'val-text', x: cx, y: y(b.n) - 7, 'text-anchor': 'middle' }, g, b.n);
      svg('text', { class: 'axis-text', x: cx, y: H - 10, 'text-anchor': 'middle' }, g, bw < 62 ? SHORT[i] : b.label);
      bindTip(g, `${b.n} ${b.n === 1 ? 'student' : 'students'}`, `Average ${b.label}%`);
    });
    plot.appendChild(root);
  }

  function drawComparison(plot, selected) {
    plot.textContent = '';
    const rows = DATA.classes.map((c) => { const m = getClass(c.code); return { ...c, avg: classAvg(m) }; });
    const W = Math.max(300, plot.clientWidth);
    const narrow = W < 520;
    const rowH = 42;
    const m = { t: 8, r: 54, b: 28, l: narrow ? 52 : 150 };
    const H = m.t + rows.length * rowH + m.b;
    const lo = 50; const hi = 90;
    const x = (v) => m.l + ((Math.max(lo, Math.min(hi, v)) - lo) / (hi - lo)) * (W - m.l - m.r);
    const root = svg('svg', { viewBox: `0 0 ${W} ${H}`, width: W, height: H, role: 'group', 'aria-label': 'Class averages, Summer term to Autumn term' });
    for (let t = lo; t <= hi; t += 10) {
      svg('line', { class: 'grid-line', x1: x(t), x2: x(t), y1: m.t, y2: H - m.b }, root);
      svg('text', { class: 'axis-text', x: x(t), y: H - 8, 'text-anchor': 'middle' }, root, `${t}%`);
    }
    rows.forEach((r, i) => {
      const cy = m.t + i * rowH + rowH / 2;
      const change = r.last == null ? 'new cohort' : `${r.avg - r.last >= 0 ? 'up' : 'down'} ${Math.abs(r.avg - r.last).toFixed(1)} points from ${fmt1(r.last)}%`;
      const g = svg('g', { class: 'mark', tabindex: '0', role: 'img', 'aria-label': `${r.code} ${r.subject}: ${fmt1(r.avg)}%, ${change}, target ${r.target}%` }, root);
      svg('rect', { class: 'row-band', x: 0, y: cy - rowH / 2 + 2, width: W, height: rowH - 4, rx: 8 }, g);
      if (r.code === selected) svg('rect', { class: 'row-band', x: 0, y: cy - rowH / 2 + 2, width: W, height: rowH - 4, rx: 8, style: 'fill: var(--brand-soft)' }, g);
      svg('text', { class: 'axis-label', x: 8, y: cy + 4 }, g, narrow ? r.code : `${r.code} ${r.subject}`);
      if (r.last != null) {
        svg('line', { class: 'db-line', x1: x(r.last), x2: x(r.avg), y1: cy, y2: cy }, g);
        svg('circle', { class: 'db-last', cx: x(r.last), cy, r: 5 }, g);
      }
      svg('line', { class: 'db-target', x1: x(r.target), x2: x(r.target), y1: cy - 9, y2: cy + 9 }, g);
      svg('circle', { class: 'db-now', cx: x(r.avg), cy, r: 6.5 }, g);
      const end = Math.max(x(r.avg), r.last != null ? x(r.last) : 0, x(r.target));
      svg('text', { class: 'val-text', x: end + 12, y: cy + 4 }, g, `${fmt1(r.avg)}%`);
      bindTip(g, `${fmt1(r.avg)}%`, `${r.code} ${r.subject} · ${r.last == null ? 'new cohort' : `Summer ${fmt1(r.last)}%`} · target ${r.target}%`);
    });
    plot.appendChild(root);
  }

  function initReports() {
    const sel = $('#report-class');
    const hist = $('#hist-chart');
    const cmp = $('#cmp-chart');
    if (!DATA || (!hist && !cmp)) return;
    const params = new URLSearchParams(window.location.search);
    let code = sel && DATA.gradebook[params.get('class')] ? params.get('class') : sel ? sel.value : '11B';
    if (sel) sel.value = code;
    const flagHTML = (flags) => flags.map((f) => ` <abbr class="flag" title="${FLAG_TITLE[f] || f}">${esc(f)}</abbr>`).join('');
    const person = (r, extra) => `<li class="person">${avatarHTML(r.name)}<div class="person-main"><p class="person-name">${esc(r.name)}${flagHTML(r.flags)}</p>${extra}</div><p class="person-avg ${band(r.avg)}">${fmt1(r.avg)}%</p></li>`;
    const reasons = (r, target) => [r.avg < target - 10 ? `${Math.round(target - r.avg)} pts below target` : null, r.miss >= 2 ? `${r.miss} missing` : null, r.change <= -10 ? `Down ${Math.round(-r.change)} pts recently` : null].filter(Boolean);
    let current = null;

    const render = () => {
      const d = reportData(code);
      current = d;
      const c = d.m.meta;
      const set = (k, html) => { const el = $(`[data-r="${k}"]`); if (el) el.innerHTML = html; };
      set('avg', `${fmt1(d.avg)}<small>%</small>`);
      set('avg-note', `${d.avg >= c.target ? '+' : '−'}${Math.abs(d.avg - c.target).toFixed(1)} pts vs ${c.target}% target`);
      set('median', `${fmt1(d.median)}<small>%</small>`);
      set('on', `${d.onTarget}<small> of ${d.rows.length}</small>`);
      set('on-note', `${Math.round((d.onTarget / d.rows.length) * 100)}% of the class`);
      set('missing', d.missing);
      const note = $('#report-note');
      if (note) note.textContent = `${c.year} · ${d.rows.length} students · target ${c.target}%`;
      const tbody = $('#hist-table tbody');
      if (tbody) tbody.innerHTML = d.hist.map((b) => `<tr><th scope="row">${b.label}%</th><td>${b.n}</td></tr>`).join('');
      const br = $('#br-list');
      if (br) br.innerHTML = d.breakdown.map((b) => `<li class="br-item"><p class="br-title"><span class="gb-type t-${b.type.toLowerCase()}">${esc(b.type)}</span>${esc(b.title)}</p><div class="br-bar" role="img" aria-label="${esc(b.title)}: ${fmt1(b.avg)}%"><span style="width:${b.avg == null ? 0 : b.avg.toFixed(1)}%"></span></div><p class="br-val">${fmt1(b.avg)}%</p></li>`).join('');
      const top = $('#top-list');
      if (top) top.innerHTML = d.top.map((r) => person(r, `<p class="person-note">${r.change >= 0 ? ICONS.up.replace('class="ic"', 'class="ic ic-up"') : ICONS.down.replace('class="ic"', 'class="ic ic-down"')}Recent work ${r.change >= 0 ? 'up' : 'down'} ${Math.abs(r.change).toFixed(1)} pts</p>`)).join('');
      const risk = $('#risk-list');
      if (risk) risk.innerHTML = d.risk.map((r) => person(r, `<p class="person-tags">${reasons(r, c.target).map((t) => `<span class="tag-risk">${esc(t)}</span>`).join('')}</p>`)).join('');
      const empty = $('#risk-empty');
      if (empty) empty.hidden = d.risk.length > 0;
      if (hist) drawHistogram(hist, d.hist);
      if (cmp) drawComparison(cmp, code);
    };
    render();
    if (hist) whenResized(hist, () => drawHistogram(hist, current.hist));
    if (cmp) whenResized(cmp, () => drawComparison(cmp, code));
    if (sel) sel.addEventListener('change', () => {
      code = sel.value;
      render();
      const url = new URL(window.location.href);
      url.searchParams.set('class', code);
      window.history.replaceState(null, '', url);
    });
    const print = $('#print-report');
    if (print) print.addEventListener('click', () => window.print());
  }

  /* ---------------------------------------------------------------- boot */
  const init = () => {
    initTheme();
    initSidebar();
    initTerm();
    initSearch();
    initNotifications();
    initTableToggles();
    initDashboardChart();
    initRegister();
    initPrep();
    initClassCards();
    initGradebook();
    initAssignmentList();
    initRubric();
    initAssignmentForm();
    initPlans();
    initReports();
  };
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
