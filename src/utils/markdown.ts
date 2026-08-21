const escapeHtml = (value: string) =>
  value.replace(
    /[&<>"']/g,
    (character) =>
      ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#039;' })[
        character
      ] ?? character,
  );

const inline = (value: string) =>
  escapeHtml(value)
    .replace(/!\[([^\]]*)\]\((https?:\/\/[^\s)]+)\)/g, '<img src="$2" alt="$1" loading="lazy">')
    .replace(/`([^`]+)`/g, '<code>$1</code>')
    .replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>')
    .replace(/\*([^*]+)\*/g, '<em>$1</em>')
    .replace(/\[([^\]]+)\]\((https?:\/\/[^\s)]+)\)/g, '<a href="$2" target="_blank" rel="noreferrer">$1</a>');

export const renderMarkdown = (markdown: string) => {
  const output: string[] = [];
  let paragraph: string[] = [];
  let listOpen = false;
  let codeOpen = false;

  const flushParagraph = () => {
    if (!paragraph.length) return;
    output.push(`<p>${paragraph.map(inline).join('<br>')}</p>`);
    paragraph = [];
  };
  const closeList = () => {
    if (!listOpen) return;
    output.push('</ul>');
    listOpen = false;
  };

  for (const line of markdown.replace(/\r\n/g, '\n').split('\n')) {
    if (line.startsWith('```')) {
      flushParagraph();
      closeList();
      output.push(codeOpen ? '</code></pre>' : '<pre><code>');
      codeOpen = !codeOpen;
      continue;
    }
    if (codeOpen) {
      output.push(`${escapeHtml(line)}\n`);
      continue;
    }
    if (/^\s*---+\s*$/.test(line)) {
      flushParagraph();
      closeList();
      output.push('<hr>');
      continue;
    }
    const quote = line.match(/^>\s+(.+)$/);
    if (quote) {
      flushParagraph();
      closeList();
      output.push(`<blockquote>${inline(quote[1] ?? '')}</blockquote>`);
      continue;
    }
    const heading = line.match(/^(#{1,3})\s+(.+)$/);
    if (heading) {
      flushParagraph();
      closeList();
      const level = heading[1]?.length ?? 2;
      output.push(`<h${level}>${inline(heading[2] ?? '')}</h${level}>`);
      continue;
    }
    const item = line.match(/^[-*]\s+(.+)$/);
    if (item) {
      flushParagraph();
      if (!listOpen) {
        output.push('<ul>');
        listOpen = true;
      }
      output.push(`<li>${inline(item[1] ?? '')}</li>`);
      continue;
    }
    if (!line.trim()) {
      flushParagraph();
      closeList();
      continue;
    }
    paragraph.push(line);
  }
  flushParagraph();
  closeList();
  if (codeOpen) output.push('</code></pre>');
  return output.join('');
};
