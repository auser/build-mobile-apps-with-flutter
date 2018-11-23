////////////////////////////
// Reveal.js initialization
///////////////////////////

import 'reveal.js/lib/js/head.min.js';

import Reveal from 'reveal.js';
// HACK
window.Reveal = Reveal;
import marked from 'marked';

const srcPath = '../';
const libPath = '../node_modules/reveal.js/';

const HIGHLIGHT_LANGUAGES = ['python', 'javascript', 'dart']
// require(libPath + 'plugin/highlight/languages/' + 'bash.js')

/* Register only the selected languages (defined in webpack.config.js) 
  in highlight.js and initialize highlight.js when Reveal itself initialize
  (see intialization step at the end of Reveal.initialize) */
  import hljs from '../../node_modules/highlight.js/lib/highlight.js';
  Object.keys(HIGHLIGHT_LANGUAGES).forEach(key => {
    let languageName = HIGHLIGHT_LANGUAGES[key]
  
    // Using require() here because import() support hasn't landed in Webpack yet
    const languageModule = require(`../../node_modules/highlight.js/lib/languages/${languageName}`);
    hljs.registerLanguage(languageName, languageModule);
  });
  

  document.addEventListener('DOMContentLoaded', (event) => {
    window.Reveal = Reveal // plugins need that
  
    Reveal.initialize ({
      // width: '100%',
      // height: '100%',
      width: 960,
      height: 700,
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

      keyboard: {
        80: function() {
          if (! window.location.search.match( /print-pdf/gi )) {
            var uri = window.location.toString().split("#")
            window.location.replace(uri[0] + "?print-pdf");
          }
        }
      },
      // math: {
      // mathjax: '/MathJax.js',
      // },
      dependencies: [
      //   // Cross-browser shim that fully implements classList
      //   {
      //     src: libPath + 'lib/js/classList.js',
      //     condition: function () {
      //       return !document.body.classList;
      //     },
      //   },

      //   // Interpret Markdown in <section> elements
      //   {
      //     src: libPath + 'plugin/markdown/marked.js',
      //     condition: function () {
      //       return !!document.querySelector ('[data-markdown]');
      //     },
      //   },

      //   {
      //     src: libPath + 'plugin/markdown/markdown.js',
      //     condition: function () {
      //       return !!document.querySelector ('[data-markdown]');
      //     },
      //   },

        // Syntax highlight for <code> elements
        // {
        //   src: './reveal-plugins/reveal-highlight.js',
        //   async: false,
        //   callback: function () {
        //     hljs.initHighlightingOnLoad ();
        //   },
        // },

      //   // Math
      //   // { src: libPath + 'plugin/math/math.js', async: true },

      //   // Zoom in and out with Alt+click
      //   {src: 'nodePath/plugin/zoom-js/zoom.js', async: false},

      //   // Speaker notes
      //   {src: 'nodePath/plugin/notes/notes.js', async: false},
      ],
    });

    hljs.initHighlightingOnLoad ();
  })
