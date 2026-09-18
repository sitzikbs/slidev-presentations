import { defineConfig } from 'vite'

export default defineConfig({
  plugins: [
    {
      name: 'inject-spa-redirect',
      transformIndexHtml(html) {
        const redirectScript = `<script>
(function() {
  var redirect = sessionStorage.getItem('redirect');
  if (redirect) {
    sessionStorage.removeItem('redirect');
    history.replaceState(null, '', redirect);
  }
})();
</script>`;
        return html.replace(
          '<head>',
          '<head>' + redirectScript
        )
      }
    }
  ]
})
