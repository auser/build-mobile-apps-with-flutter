import 'reveal.js/lib/js/head.min.js';

import Reveal from 'reveal.js';
// HACK
window.Reveal = Reveal;
import marked from 'marked';

const srcPath = '../';
const libPath = '../node_modules/reveal.js/';

// require(libPath + 'plugin/highlight/languages/' + 'bash.js')

Reveal.initialize ({
  // width: '100%',
  // height: '100%',
  center: true,
  history: true,
  transition: 'none',
  progress: false,
  pdfMaxPagesPerSlide: 1,
  controls: false,
  markdown: {
    renderer: new marked.Renderer (),
    gfm: true,
    tables: true,
    breaks: true,
    pedantic: false,
    sanitize: false,
    smartLists: true,
    smartypants: true,
  },
  // math: {
  // mathjax: '/MathJax.js',
  // },
  dependencies: [
    // Cross-browser shim that fully implements classList
    {
      src: libPath + 'lib/js/classList.js',
      condition: function () {
        return !document.body.classList;
      },
    },

    // Interpret Markdown in <section> elements
    {
      src: libPath + 'plugin/markdown/marked.js',
      condition: function () {
        return !!document.querySelector ('[data-markdown]');
      },
    },

    {
      src: libPath + 'plugin/markdown/markdown.js',
      condition: function () {
        return !!document.querySelector ('[data-markdown]');
      },
    },

    // Syntax highlight for <code> elements
    {
      src: libPath + 'plugin/highlight/highlight.js',
      async: true,
      callback: function () {
        hljs.initHighlightingOnLoad ();
      },
    },

    // Math
    // { src: libPath + 'plugin/math/math.js', async: true },

    // Zoom in and out with Alt+click
    {src: libPath + 'plugin/zoom-js/zoom.js', async: true},

    // Speaker notes
    {src: libPath + 'plugin/notes/notes.js', async: true},
  ],
});
