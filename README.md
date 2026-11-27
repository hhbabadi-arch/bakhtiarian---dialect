<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>فرهنگ جامع گویش بختیاری | Comprehensive Dictionary of the Bakhtiari Dialect</title>
  <meta name="description" content="نخستین پلتفرم دیجیتال جامع مستندسازی، حفظ و انتشار گویش بختیاری">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Vazirmatn:wght@400;500;700&display=swap">
  <style>
    :root {
      --deep: #1a5c3a;
      --mid: #2e7d52;
      --bg: #f4f9f6;
      --card: #ffffff;
      --accent: #e8f5e9;
    }
    * { box-sizing: border-box; }
    body {
      font-family: Vazirmatn, Tahoma, sans-serif;
      background: var(--bg);
      color: #222;
      text-align: center;
      padding: 40px 20px;
      margin: 0;
      line-height: 1.9;
    }
    .container {
      max-width: 800px;
      margin: auto;
      background: var(--card);
      padding: 40px 30px;
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.08);
      margin-bottom: 25px;
    }
    h1 { color: var(--deep); font-size: 2.2rem; margin: 0 0 10px; }
    .subtitle { color: var(--mid); font-size: 1.15rem; font-weight: normal; margin: 0 0 6px; }
    .subtitle-en { color: #777; font-size: 0.95rem; margin: 0 0 30px; direction: ltr; }
    .quote {
      font-style: italic;
      color: #555;
      border-right: 4px solid var(--deep);
      padding-right: 15px;
      margin: 30px auto;
      max-width: 600px;
      text-align: right;
    }
    .quote-author { display: block; margin-top: 8px; font-style: normal; font-size: 0.9rem; color: var(--mid); }
    .stats { display: flex; justify-content: center; gap: 15px; flex-wrap: wrap; margin: 30px 0; }
    .stat-box { background: var(--accent); padding: 15px 22px; border-radius: 10px; border: 1px solid #c8e6c9; min-width: 120px; }
    .stat-box strong { display: block; font-size: 1.6rem; color: var(--deep); }
    .stat-box span { font-size: 0.85rem; color: #555; }
    .links { margin-top: 30px; display: flex; justify-content: center; flex-wrap: wrap; gap: 10px; }
    .links a { display: inline-block; padding: 12px 25px; background: var(--deep); color: white; text-decoration: none; border-radius: 8px; font-weight: bold; transition: 0.3s; }
    .links a:hover { background: var(--mid); }
    footer { margin-top: 40px; font-size: 0.88rem; color: #777; }
    footer a { color: var(--mid); text-decoration: none; }
    
    /* استایل‌های گویشوران و جدول */
    .card-container { display: flex; flex-wrap: wrap; gap: 15px; justify-content: center; margin-top: 20px; }
    .speaker-card { 
      background: #f4f9f6; border: 1px solid #c8e6c9; border-radius: 8px; 
      padding: 15px; width: 200px; text-align: right; direction: rtl; 
      cursor: pointer; transition: 0.3s;
    }
    .speaker-card:hover { transform: translateY(-5px); box-shadow: 0 6px 15px rgba(0,0,0,0.1); }
    .speaker-card h3 { margin: 0 0 10px; color: var(--deep); font-size: 1.1rem; }
    .speaker-card p { margin: 5px 0; font-size: 0.9rem; color: #444; }
    .vocab-table { width: 100%; border-collapse: collapse; text-align: right; direction: rtl; margin-top: 15px; }
    .vocab-table th, .vocab-table td { padding: 10px; border: 1px solid #eee; }
    .vocab-table th { background: var(--accent); color: var(--deep); }
    .vocab-table tr:nth-child(even) { background-color: #fafafa; }

    /* استایل‌های پنجره فولکلور (Modal) */
    .modal { 
      display: none; position: fixed; z-index: 1000; left: 0; top: 0; 
      width: 100%; height: 100%; background-color: rgba(0,0,0,0.6); 
    }
    .modal-content { 
      background-color: #fff; margin: 10% auto; padding: 25px; 
      border-radius: 12px; width: 90%; max-width: 500px; 
      text-align: right; direction: rtl; position: relative;
      box-shadow: 0 5px 20px rgba(0,0,0,0.2);
    }
    .close-btn { 
      color: #aaa; position: absolute; top: 10px; left: 20px; 
      font-size: 28px; font-weight: bold; cursor: pointer; 
    }
    .close-btn:hover { color: #d32f2f; }
    .folklore-item { margin-bottom: 15px; border-bottom: 1px dashed #ccc; padding-bottom: 10px; }
    .folklore-item:last-child { border-bottom: none; }
    .folklore-item strong { color: var(--deep); display: block; margin-bottom: 5px; }
    .folklore-text { font-size: 1.05rem; color: #333; }
    
    @media (max-width: 600px) {
      h1 { font-size: 1.6rem; }
      .container { padding: 25px 18px; }
      .links a { padding: 10px 18px; font-size: 0.9rem; }
    }
  </style>
</head>
<body>

  <main class="container">
    <h1>🌿 فرهنگ جامع گویش بختیاری</h1>
    <p class="subtitle">Comprehensive Dictionary of the Bakhtiari Dialect</p>
    <p class="subtitle-en">Voice of the Zagros, Heritage of Tomorrow</p>

    <blockquote class="quote">
      «از صدای گویشور زاگرس، تا میراث دیجیتال جهانی.»
      <span class="quote-author">— حمیدرضا حبیبی بابادی</span>
    </blockquote>

    <div class="stats">
      <div class="stat-box"><strong>۱٬۶۴۸+</strong><span>مدخل واژگانی</span></div>
      <div class="stat-box"><strong>۱۲</strong><span>گویشور بومی</span></div>
      <div class="stat-box"><strong>۶</strong><span>منطقه</span></div>
      <div class="stat-box"><strong>۳۳</strong><span>فعل صرف‌شده</span></div>
      <div class="stat-box"><strong>~۶۹۰</strong><span>صفحه PDF</span></div>
    </div>

    <div class="links">
      <a href="Bakhtiari-lexicon.pdf">📄 دریافت PDF</a>
      <a href="polls-data-1404.csv">📊 داده‌های پرسشنامه</a>
    </div>

    <footer>
      <p>«صدای زاگرس، میراث فردا.» 🌿</p>
      <p>منتشرشده تحت مجوز <a href="https://creativecommons.org/licenses/by/4.0/" target="_blank" rel="noopener">CC-BY-4.0</a></p>
    </footer>
  </main>

  <div class="container">
    <h2 style="color: var(--deep); text-align: center; margin-top: 0;">گویشوران مستندشده</h2>
    <p style="font-size: 0.9rem; color: #777; margin-bottom: 15px;">برای مشاهده لالایی‌ها و ضرب‌المثل‌های هر گویشور، روی کارت آن کلیک کنید.</p>
    <div id="speakers-list" class="card-container"></div>
  </div>

  <div class="container">
    <h2 style="color: var(--deep); text-align: center; margin-top: 0;">جست‌وجو در واژگان گویشوران</h2>
    <div style="text-align: center; margin-bottom: 20px;">
      <input type="text" id="search-input" placeholder="یک واژه فارسی تایپ کنید... (مثلاً: آب، تشنه، چاقو)" style="padding: 10px; width: 80%; max-width: 400px; border: 1px solid #ccc; border-radius: 5px; font-family: inherit;">
    </div>
    <table class="vocab-table">
      <thead>
        <tr>
          <th>واژه فارسی</th>
          <th>گویش بختیاری</th>
          <th>منبع / گویشور</th>
        </tr>
      </thead>
      <tbody id="vocab-body"></tbody>
    </table>
  </div>

  <!-- پنجره مودال (Popup) برای نمایش فولکلور -->
  <div id="folklore-modal" class="modal">
    <div class="modal-content">
      <span class="close-btn" id="close-modal">&times;</span>
      <h2 id="modal-speaker-name" style="color: var(--deep); margin-top: 0;"></h2>
      <div id="modal-folklore-body"></div>
    </div>
  </div>

  <script>
    const speakerFiles = [
      'data/speakers/SPK-01-Farhad.json',
      'data/speakers/SPK-02-Sajjad.json',
      'data/speakers/SPK-03-Soghra.json',
      'data/speakers/SPK-04-Sanaz.json',
      'data/speakers/SPK-05-Mehdi.json'
    ];

    let allVocab = [];

    async function loadAllData() {
      const speakerContainer = document.getElementById('speakers-list');
      const tbody = document.getElementById('vocab-body');
      
      // ۱. بارگذاری واژه‌نامه عمومی
      try {
        const vocabRes = await fetch('data/lexicon/daily-life.json');
        if (vocabRes.ok) {
          const vocabData = await vocabRes.json();
          for (const [fa, bqi] of Object.entries(vocabData.entries)) {
            allVocab.push({ farsi: fa, bakhtiari: bqi, speaker: vocabData.category });
          }
        }
      } catch (e) { console.warn("خطا در خواندن واژه‌نامه روزمره", e); }

      // ۲. بارگذاری پروفایل گویشوران
      for (const file of speakerFiles) {
        try {
          const response = await fetch(file);
          if (!response.ok) continue;
          const data = await response.json();

          if (speakerContainer) {
            const card = document.createElement('div');
            card.className = 'speaker-card';
            card.innerHTML = `
              <h3>${data.name || 'نامشخص'}</h3>
              <p><b>کد:</b> ${data.speaker_id || '-'}</p>
              <p><b>جنسیت:</b> ${data.personal && data.personal.gender === 'male' ? 'مرد' : 'زن'}</p>
              <p><b>وضعیت:</b> ${data.status === 'complete' ? 'تکمیل‌شده ✅' : 'در حال انجام ⏳'}</p>
              <p style="color: var(--mid); font-size: 0.8rem; margin-top: 10px;">👈 کلیک کنید برای فولکلور</p>
            `;
            
            // افزودن رویداد کلیک برای باز کردن فولکلور
            card.onclick = () => showFolklore(data);
            
            speakerContainer.appendChild(card);
          }

          if (data.lexicon) {
            for (const [fa, bqi] of Object.entries(data.lexicon)) {
              allVocab.push({ farsi: fa, bakhtiari: bqi, speaker: data.name || 'نامشخص' });
            }
          }
        } catch (error) { console.error('خطا در خواندن فایل:', file, error); }
      }
      
      if (tbody) renderVocab(allVocab);
    }

    // تابع نمایش فولکلور در Modal
    function showFolklore(speaker) {
      const modal = document.getElementById('folklore-modal');
      const nameEl = document.getElementById('modal-speaker-name');
      const bodyEl = document.getElementById('modal-folklore-body');

      nameEl.textContent = `فولکلور ${speaker.name || ''}`;
      bodyEl.innerHTML = '';

      if (!speaker.folklore || Object.keys(speaker.folklore).length === 0 || speaker.folklore.note) {
        bodyEl.innerHTML = '<p style="text-align:center; color:#777;">داده‌های فولکلور برای این گویشور هنوز در پایگاه داده ثبت نشده است.</p>';
      } else {
        const f = speaker.folklore;
        if (f.proverb) bodyEl.innerHTML += `<div class="folklore-item"><strong>ضرب‌المثل:</strong><span class="folklore-text">${f.proverb}</span></div>`;
        if (f.lullaby) bodyEl.innerHTML += `<div class="folklore-item"><strong>لالایی / ترانه:</strong><span class="folklore-text">${f.lullaby}</span></div>`;
        if (f.riddle) bodyEl.innerHTML += `<div class="folklore-item"><strong>چیستان:</strong><span class="folklore-text">${f.riddle}</span></div>`;
        if (f.foods && Array.isArray(f.foods)) {
          bodyEl.innerHTML += `<div class="folklore-item"><strong>غذاهای محلی:</strong><span class="folklore-text">${f.foods.join(' ، ')}</span></div>`;
        }
      }
      modal.style.display = 'block';
    }

    // بستن Modal
    document.getElementById('close-modal').onclick = () => {
      document.getElementById('folklore-modal').style.display = 'none';
    };
    window.onclick = (event) => {
      const modal = document.getElementById('folklore-modal');
      if (event.target == modal) modal.style.display = 'none';
    };

    function renderVocab(vocabList) {
      const tbody = document.getElementById('vocab-body');
      if (!tbody) return;
      tbody.innerHTML = '';
      if (vocabList.length === 0) {
        tbody.innerHTML = '<tr><td colspan="3" style="text-align:center; padding: 15px;">واژه‌ای یافت نشد</td></tr>';
        return;
      }
      vocabList.forEach(v => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
          <td>${v.farsi}</td>
          <td style="font-weight: bold; color: var(--mid);">${v.bakhtiari}</td>
          <td style="font-size: 0.9rem; color: #777;">${v.speaker}</td>
        `;
        tbody.appendChild(tr);
      });
    }

    const searchInput = document.getElementById('search-input');
    if (searchInput) {
      searchInput.addEventListener('input', (e) => {
        const query = e.target.value.trim();
        const filtered = allVocab.filter(v => 
          v.farsi.includes(query) || v.bakhtiari.includes(query)
        );
        renderVocab(filtered);
      });
    }

    document.addEventListener('DOMContentLoaded', loadAllData);
  </script>

</body>
</html>
