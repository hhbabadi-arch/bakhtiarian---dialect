# bakhtiarian---dialect
comprehensive dictionary of  bakhtiarian - dialect
  <script>
    // لیست فایل‌های گویشوران
    const speakerFiles = [
      'data/speakers/SPK-01-Farhad.json',
      'data/speakers/SPK-02-Sajjad.json',
      'data/speakers/SPK-03-Soghra.json',
      'data/speakers/SPK-04-Sanaz.json'
    ];

    let allVocab = [];

    async function loadAllData() {
      const speakerContainer = document.getElementById('speakers-list');
      const tbody = document.getElementById('vocab-body');
      
      for (const file of speakerFiles) {
        try {
          const response = await fetch(file);
          if (!response.ok) continue;
          
          const data = await response.json();

          // ۱. ساخت کارت گویشور (اگر کانتینر وجود داشته باشد)
          if (speakerContainer) {
            const card = document.createElement('div');
            card.style.cssText = "background: #f4f9f6; border: 1px solid #c8e6c9; border-radius: 8px; padding: 15px; width: 200px; text-align: right; direction: rtl;";
            card.innerHTML = `
              <h3 style="margin: 0 0 10px; color: #1a5c3a;">${data.name || 'نامشخص'}</h3>
              <p style="margin: 5px 0; font-size: 0.9rem;"><b>کد:</b> ${data.speaker_id || '-'}</p>
              <p style="margin: 5px 0; font-size: 0.9rem;"><b>جنسیت:</b> ${data.personal && data.personal.gender === 'male' ? 'مرد' : 'زن'}</p>
            `;
            speakerContainer.appendChild(card);
          }

          // ۲. استخراج واژه‌ها برای جدول
          if (data.lexicon) {
            for (const [fa, bqi] of Object.entries(data.lexicon)) {
              allVocab.push({ farsi: fa, bakhtiari: bqi, speaker: data.name || 'نامشخص' });
            }
          }
        } catch (error) {
          console.error('خطا در فایل:', file, error);
        }
      }
      
      // بعد از خواندن همه فایل‌ها، جدول را رسم کن
      if (tbody) renderVocab(allVocab);
    }

    function renderVocab(vocabList) {
      const tbody = document.getElementById('vocab-body');
      tbody.innerHTML = '';
      
      if (vocabList.length === 0) {
        tbody.innerHTML = '<tr><td colspan="3" style="text-align:center; padding: 10px;">واژه‌ای یافت نشد</td></tr>';
        return;
      }
      
      vocabList.forEach(v => {
        const tr = document.createElement('tr');
        // 👇 در اینجا علامت بک‌تیک ( ` ) که در کد قبلی شما جا افتاده بود، اضافه شد
        tr.innerHTML = `
          <td style="padding: 8px; border: 1px solid #eee;">${v.farsi}</td>
          <td style="padding: 8px; border: 1px solid #eee; font-weight: bold; color: #2e7d52;">${v.bakhtiari}</td>
          <td style="padding: 8px; border: 1px solid #eee; font-size: 0.9rem; color: #777;">${v.speaker}</td>
        `;
        tbody.appendChild(tr);
      });
    }

    // جست‌وجوی زنده
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

    // شروع به کار
    loadAllData();
  </script>
</body>
