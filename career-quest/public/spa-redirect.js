// GitHub Pages SPA redirect handler
// This script handles redirects from 404.html to enable direct slide URLs

(function() {
  var redirect = sessionStorage.getItem('redirect');
  if (redirect) {
    sessionStorage.removeItem('redirect');
    // Use location.replace to ensure the app initializes with the correct URL
    window.location.replace(redirect);
  }
})();
