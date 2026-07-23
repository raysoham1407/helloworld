# Web Markdown Reader

A web-based, split-screen Markdown editor with real-time preview. Built entirely with HTML, CSS, and JavaScript — no server required.

## Quick Start

Open `markdown_reader_web.html` in any modern browser:

```bash
xdg-open markdown_reader_web.html
```

Or double-click the file from your file manager.

## Features

- **Split-screen editing** — write Markdown on the left, see formatted output on the right
- **Real-time preview** — updates instantly as you type using the [marked.js](https://github.com/markedjs/marked) parser
- **Formatting toolbar** — one-click buttons for Bold, Italic, Heading, Quote, Link, Code, and List
- **File operations** — New, Open (`.md`, `.txt`), and Save
- **Undo/Redo** — track changes with dedicated buttons or keyboard shortcuts
- **Responsive design** — works on different screen sizes
- **Syntax highlighting** — code blocks are highlighted for better readability

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| Ctrl+N | New file |
| Ctrl+O | Open file dialog |
| Ctrl+S | Save file |
| Ctrl+Z | Undo |
| Ctrl+Shift+Z | Redo |

## Dependencies

External CDNs loaded at runtime:

- **marked.js** — Markdown parser
- **Font Awesome 6** — Toolbar icons

An internet connection is needed on first load. After caching, it works offline.

## Browser Compatibility

Works in any modern browser (Chrome, Firefox, Edge, Safari).

## Usage

1. **Write** Markdown in the left editor pane.
2. **Preview** renders live in the right pane.
3. Use the **formatting toolbar** for quick insertions of common Markdown elements.
4. **Open** an existing `.md` or `.txt` file via the Open button.
5. **Save** your work back to disk with the Save button.

## Troubleshooting

### Common Issues
- If the preview doesn't update, make sure you have an internet connection for the first load (CDNs are cached after the initial load)
- File operations may not work in some browsers due to security restrictions. Try running the file from a local web server if you encounter issues with Open/Save functions
- On some systems, double-clicking might not open the file properly. Use `xdg-open` command instead

### Supported File Types
- `.md` — Markdown files
- `.txt` — Plain text files (treated as Markdown)
