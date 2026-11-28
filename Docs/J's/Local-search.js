function render(query) {
  const hits = miniSearch.search(norm(query)).slice(0, 25);
  results.innerHTML = hits.length ? "" : `<li class="ls-empty">${T.noResult}</li>`;

  for (const hit of hits) {
    const li = document.createElement("li");
    li.className = "ls-item";
    const snippet = (hit.text || "").slice(0, 180);

    // برچسب منبع
    const sourceLabel = {
      markdown: "📄",
      glossary: "📖",
      lexicon: "🔤",
      folklore: "🎭",
      location: "📍",
    }[hit.source] || "•";

    const badge = hit.category
      ? `<span class="ls-badge">${hit.category}</span>`
      : hit.source === "lexicon" && hit.ipa
      ? `<span class="ls-ipa">${hit.ipa}</span>`
      : "";

    li.innerHTML = `
      <a href="${hit.url}">
        <strong>${sourceLabel} ${highlight(hit.heading || hit.path, query)}</strong>
        ${badge}
        <p>${highlight(snippet, query)}${hit.text && hit.text.length > 180 ? "…" : ""}</p>
        <span class="ls-path">${hit.path}${hit.status === "pending_ipa" ? " · ⏳ IPA" : ""}</span>
      </a>
    `;
    li.querySelector("a").addEventListener("click", close);
    results.appendChild(li);
  }
}
