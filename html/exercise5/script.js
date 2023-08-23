const apiKey = "6b40f680";
const container = document.querySelector(".container");
const searchInput = document.querySelector("#search-input");
const searchButton = document.querySelector("#search-button");
const sortSelect = document.querySelector("#sort-select");
const loadMoreButton = document.querySelector("#load-more-button");

const SORT_OPTIONS = {
  NAME_ASC: "name-asc",
  NAME_DESC: "name-desc",
};

let currentPage = 1;
let currentSearch = "";
let currentSort = "name-asc";
let movies = [];

async function fetchMovies() {
  const url = `https://www.omdbapi.com/?apikey=${apiKey}&s=${currentSearch}&page=${currentPage}`;
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Failed to fetch movies. Status code: ${response.status}`);
  }
  const data = await response.json();
  if (data.Response === "False") {
    throw new Error(`Failed to fetch movies. Error message: ${data.Error}`);
  }
  data.Search.forEach((movie) => {
    const existingMovie = movies.find((m) => m.Title === movie.Title);
    if (!existingMovie) {
      movies.push(movie);
    }
  });
  return sortMovies(movies);
}

function displayMovies(movies) {
  movies.forEach((movie) => {
    const card = createMovieCard(movie);
    container.appendChild(card);
  });
}

function sortMovies(movies) {
  switch (currentSort) {
    case SORT_OPTIONS.NAME_ASC:
      return movies.sort((a, b) => a.Title.localeCompare(b.Title));
    case SORT_OPTIONS.NAME_DESC:
      return movies.sort((a, b) => b.Title.localeCompare(a.Title));
    default:
      throw new Error(`Invalid currentSort parameter. Expected '${SORT_OPTIONS.NAME_ASC}' or '${SORT_OPTIONS.NAME_DESC}'.`);
  }
}

function createMovieDetailsHTML(data) {
  return `
    <h2>${data.Title}</h2>
    <p><strong>Year:</strong> ${data.Year}</p>
    <p><strong>Rated:</strong> ${data.Rated}</p>
    <p><strong>Released:</strong> ${data.Released}</p>
    <p><strong>Runtime:</strong> ${data.Runtime}</p>
    <p><strong>Genre:</strong> ${data.Genre}</p>
    <p><strong>Director:</strong> ${data.Director}</p>
    <p><strong>Writer:</strong> ${data.Writer}</p>
    <p><strong>Actors:</strong> ${data.Actors}</p>
    <p><strong>Plot:</strong> ${data.Plot}</p>
    <p><strong>Language:</strong> ${data.Language}</p>
    <p><strong>Country:</strong> ${data.Country}</p>
    <p><strong>Awards:</strong> ${data.Awards}</p>
    <p><strong>Ratings:</strong></p>
    <ul>
      ${data.Ratings.map(rating => `<li>${rating.Source}: ${rating.Value}</li>`).join("")}
    </ul>
    <p><strong>Metascore:</strong> ${data.Metascore}</p>
    <p><strong>IMDB Rating:</strong> ${data.imdbRating}</p>
    <p><strong>IMDB Votes:</strong> ${data.imdbVotes}</p>
    <p><strong>Type:</strong> ${data.Type}</p>
    <p><strong>DVD:</strong> ${data.DVD}</p>
    <p><strong>Box Office:</strong> ${data.BoxOffice}</p>
    <p><strong>Production:</strong> ${data.Production}</p>
    <p><strong>Website:</strong> ${data.Website}</p>
  `;
}

function toggleSidePanel(sidePanel, moreInfoButton, isSidePanelVisible) {
  if (isSidePanelVisible) {
    sidePanel.style.display = "none";
    moreInfoButton.classList.remove("bold");
  } else {
    sidePanel.style.display = "block";
    moreInfoButton.classList.add("bold");
  }
}

async function displayMovieDetails(movie) {
  const response = await fetch(`https://www.omdbapi.com/?apikey=${apiKey}&i=${movie.imdbID}`);
  const data = await response.json();
  const sidePanel = document.querySelector(".side-panel");
  const isSidePanelVisible = sidePanel.style.display === "block";
  const moreInfoButton = document.querySelector(".more-info-button");

  sidePanel.innerHTML = createMovieDetailsHTML(data);
  toggleSidePanel(sidePanel, moreInfoButton, isSidePanelVisible);
}

function createMovieCard(movie) {
  const card = document.createElement("div");
  card.classList.add("card");
  card.innerHTML = `
    <img src="${movie.Poster}" alt="${movie.Title}">
    <div class="card-body">
      <h2>${movie.Title}</h2>
      <p><strong>Year:</strong> ${movie.Year}</p>
      <button class="more-info-button">More Info</button>
    </div>
  `;
  const moreInfoButton = card.querySelector(".more-info-button");
  moreInfoButton.addEventListener("click", () => {
    displayMovieDetails(movie);
  });
  return card;
}

async function searchMovies() {
  currentPage = 1;
  currentSearch = searchInput.value;
  movies = [];
  movies = await fetchMovies();
  container.innerHTML = "";
  displayMovies(movies);
}

function loadMoreMovies() {
  currentPage++;
  fetchMovies().then((newMovies) => {
    displayMovies(newMovies);
  });
}

searchButton.addEventListener("click", searchMovies);
loadMoreButton.addEventListener("click", loadMoreMovies);
sortSelect.addEventListener("change", () => {
  currentSort = sortSelect.value;
  movies = sortMovies(movies);
  container.innerHTML = "";
  displayMovies(movies);
});

if (currentSearch === "") {
  currentPage = 1;
  currentSearch = "Batman";
  fetchMovies().then((movies) => {
    container.innerHTML = "";
    movies.forEach((movie) => {
      const card = createMovieCard(movie);
      container.appendChild(card);
    });
  });
}