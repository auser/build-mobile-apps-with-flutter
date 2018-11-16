// CSS imports
import '../css/main.scss';

if (window.location.search.match (/print-pdf/gi)) {
  require ('../css/print.scss');
} else {
  require ('../css/screen.scss');
}

import './app.js';
