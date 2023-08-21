const apiKey = "6b40f680";
const container = document.querySelector(".container");
const searchInput = document.querySelector("#search-input");
const searchButton = document.querySelector("#search-button");
const sortSelect = document.querySelector("#sort-select");
const loadMoreButton = document.querySelector("#load-more-button");

let currentPage = 1;
let currentSearch = "";
let currentSort = "name-asc";

async function fetchMovies() {
  const url = `https://www.omdbapi.com/?apikey=${apiKey}&s=${currentSearch}&page=${currentPage}`;
  const response = await fetch(url);
  const data = await response.json();
  const movies = data.Search;
  return sortMovies(movies);
}

function sortMovies(movies) {
  switch (currentSort) {
    case "name-asc":
      return movies.sort((a, b) => a.Title.localeCompare(b.Title));
    case "name-desc":
      return movies.sort((a, b) => b.Title.localeCompare(a.Title));
    default:
      return movies;
  }
}

function createMovieCard(movie) {
  console.log(movie);
  const card = document.createElement("div");
  card.classList.add("card");
  card.innerHTML = `
    <img src="${movie.Poster}" alt="${movie.Title}">
    <div class="card-body">
      <h2>${movie.Title}</h2>
      <p><strong>Year:</strong> ${movie.Year}</p>
      <button class="more-button">More</button>
    </div>
  `;
  const moreButton = card.querySelector(".more-button");
  moreButton.addEventListener("click", async () => {
    const response = await fetch(`https://www.omdbapi.com/?apikey=6b40f680&i=${movie.imdbID}`);
    const data = await response.json();
    const sidePanel = document.querySelector(".side-panel");
    const isSidePanelVisible = sidePanel.style.display === "block";
    
    sidePanel.innerHTML = `
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
    
    if (isSidePanelVisible) {
      sidePanel.style.display = "none";
      moreButton.classList.remove("bold");
    } else {
      sidePanel.style.display = "block";
      moreButton.classList.add("bold");
    }
  });
  return card;
}

async function searchMovies() {
  currentPage = 1;
  currentSearch = searchInput.value;
  const movies = await fetchMovies();
  container.innerHTML = "";
  movies.forEach((movie) => {
    const card = createMovieCard(movie);
    container.appendChild(card);
  });
}

function loadMoreMovies() {
  currentPage++;
  fetchMovies().then((movies) => {
    movies.forEach((movie) => {
      const card = createMovieCard(movie);
      container.appendChild(card);
    });
  });
}

searchButton.addEventListener("click", searchMovies);
loadMoreButton.addEventListener("click", loadMoreMovies);
sortSelect.addEventListener("change", () => {
  currentSort = sortSelect.value;
  searchMovies();
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