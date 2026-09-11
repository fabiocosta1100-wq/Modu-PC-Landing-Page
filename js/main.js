const themeToggle = document.getElementById('theme-toggle');
const headerLogo = document.getElementById('header-logo');

function setTheme(isDark) {
  document.body.classList.toggle('theme-dark', isDark);
  themeToggle.setAttribute('aria-pressed', String(isDark));
  themeToggle.setAttribute('aria-label', isDark ? 'Ativar modo claro' : 'Ativar modo escuro');
  headerLogo.src = isDark ? './modu-pc-logo-dark-v2.png' : './modu-pc-logo.png';
  localStorage.setItem('modu-theme', isDark ? 'dark' : 'light');
}

setTheme(localStorage.getItem('modu-theme') === 'dark');
themeToggle.addEventListener('click', () => setTheme(!document.body.classList.contains('theme-dark')));
