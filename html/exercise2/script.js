const clock = document.getElementById("clock");
const darkModeSwitch = document.getElementById("dark-mode-switch");
let isDarkMode = false;
setTheme();

setInterval(() => {
  const now = new Date();
  const hours = now.getHours().toString().padStart(2, "0");
  const minutes = now.getMinutes().toString().padStart(2, "0");
  const seconds = now.getSeconds().toString().padStart(2, "0");
  clock.textContent = `${hours}:${minutes}:${seconds}`;
}, 1000);

darkModeSwitch.addEventListener("click", () => {
  isDarkMode = !isDarkMode;
  setTheme();
});

function setTheme() {
  if (isDarkMode) {
    document.body.classList.add("dark");
  } else {
    document.body.classList.remove("dark");
  }
}
