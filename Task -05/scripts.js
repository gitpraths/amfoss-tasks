document.addEventListener("DOMContentLoaded", () => {
  clearLocalStorage();
  initializeTerminal();
  loadCart();
});

const output = document.getElementById("output");
const input = document.getElementById("input");
const productsContainer = document.getElementById("products-container");
const buyPage = document.getElementById("buy-page");
const cartItemsContainer = document.getElementById("cart-items");
const totalPriceContainer = document.getElementById("total-price");
let cart = [];
let productList = [];

function clearLocalStorage() {
  localStorage.removeItem("cart");
}

function initializeTerminal() {
  input.addEventListener("keydown", function (e) {
    if (e.key === "Enter") {
      const command = input.value.trim();
      input.value = "";
      executeCommand(command);
    }
  });
}

async function fetchProducts() {
  const response = await fetch("https://fakestoreapi.com/products");
  return response.json();
}


async function fetchProductById(id) {
  const response = await fetch(`https://fakestoreapi.com/products/${id}`);
  return response.json();
}


function loadCart() {
  cart = JSON.parse(localStorage.getItem("cart")) || [];
  updateCartCount(); 
}


function saveCart() {
  localStorage.setItem("cart", JSON.stringify(cart));
}

async function executeCommand(command) {
  const parts = command.split(" ");
  const mainCommand = parts[0];

  switch (mainCommand) {
    case "list":
      try {
        const products = await fetchProducts();
        displayProducts(products);
      } catch (error) {
        printToTerminal("Error fetching products: " + error.message);
      }
      break;
    case "details":
      const productId = parts[1];
      const product = await fetchProductById(productId);
      displayProductDetails(product);
      break;
    case "add":
      await addToCart(parts[1]);
      break;
    case "remove":
      removeFromCart(parts[1]);
      break;
    case "cart":
      displayCartItems();
      break;
    case "buy":
      displayCartAndTotalPrice();
      break;
    case "clear":
      clearTerminalScreen();
      break;
    case "search":
      searchProducts(parts.slice(1).join(" "));
      break;
    case "sort":
      sortProducts(parts[1]);
      break;
    default:
      printToTerminal(`Unknown command: ${command}`);
  }
}

function displayProductsInStore(products) {
  productsContainer.innerHTML = "";
  products.forEach((product) => {
    const productElement = document.createElement("div");
    productElement.className = "product";
    productElement.innerHTML = `
          <img src="${product.image}" alt="${product.title}">
          <h2>${product.title}</h2>
          <p>$${product.price}</p>
          <p>${product.description}</p>
      `;
    productsContainer.appendChild(productElement);
  });
  productsContainer.style.display = "flex";
}

function displayProductDetails(product) {
  clearTerminalScreen();
  printToTerminal(`
ID: ${product.id}
Title: ${product.title}
Price: $${product.price}
Description: ${product.description}
Category: ${product.category}
  `);
}


async function addToCart(productId) {
  const product = await fetchProductById(productId);
  if (product) {
    cart.push(product);
    saveCart();
    updateCartCount(); 
    printToTerminal(`Product ${productId} added to cart.`);
  } else {
    printToTerminal(`Product ${productId} not found.`);
  }
}


function removeFromCart(productId) {
  cart = cart.filter((item) => item.id !== parseInt(productId));
  saveCart();
  updateCartCount(); 
  printToTerminal(`Product ${productId} removed from cart.`);
}


function displayCartItems() {
  clearTerminalScreen();
  if (cart.length === 0) {
    printToTerminal("Your cart is empty.");
    return;
  }
  cart.forEach((item) => {
    printToTerminal(`
ID: ${item.id}
Title: ${item.title}
Price: $${item.price}
      `);
  });
}

async function displayCartAndTotalPrice() {
  if (cart.length === 0) {
  
    cartItemsContainer.innerHTML = "<p>Your cart is empty.</p>";
    totalPriceContainer.innerHTML = "";
    buyPage.style.display = "block";
    return;
  }

  cartItemsContainer.innerHTML = "";
  totalPriceContainer.innerHTML = "";

  let totalPrice = 0;

  cart.forEach((item) => {
    const itemElement = document.createElement("div");


    itemElement.innerHTML = `
          <div class="cart-item">
              <p><strong>ID:</strong> ${item.id}</p>
              <p><strong>Title:</strong> ${item.title}</p>
              <p><strong>Price:</strong> $${item.price.toFixed(2)}</p>
          </div>
      `;

    cartItemsContainer.appendChild(itemElement);
    totalPrice += item.price;
  });

  totalPriceContainer.innerHTML = `<p><strong>Total Price:</strong> $${totalPrice.toFixed(
    2
  )}</p>`;

  document.getElementById("terminal-container").style.display = "none"; 
  document.getElementById("products-container").style.display = "none";
  buyPage.style.display = "block";
}

function clearTerminalScreen() {
  output.innerHTML = "";
}

function printToTerminal(text) {
  output.innerHTML += `<pre>${text}</pre>`;
  output.scrollTop = output.scrollHeight;
}

function showMainPage() {
  buyPage.style.display = "none";
  document.getElementById("terminal-container").style.display = "block";
  document.getElementById("products-container").style.display = "flex";
}

function updateCartCount() {
  const cartCountElement = document.getElementById("cart-count");
  cartCountElement.textContent = cart.length;
}

async function searchProducts(searchTerm) {
  const products = await fetchProducts();
  const results = products.filter((p) =>
    p.title.toLowerCase().includes(searchTerm.toLowerCase())
  );
  displayProductsInStore(results);
}

async function sortProducts(criteria) {
  const productList = await fetchProducts();
  if (criteria === "price") {
    productList.sort((a, b) => a.price - b.price);
    printToTerminal("Products sorted by price");
  } else if (criteria === "name") {
    productList.sort((a, b) => a.title.localeCompare(b.title));
    printToTerminal("Products sorted by name");
  } else {
    printToTerminal(`Invalid sorting criteria: ${criteria}`);
  }
  displayProducts(productList);
}

async function fetchProducts() {
  const response = await fetch("https://fakestoreapi.com/products");
  if (!response.ok) {
    throw new Error("Network response was not ok");
  }
  return response.json();
}

function displayProducts(products) {
  const productsContainer = document.getElementById("products-container");
  productsContainer.innerHTML = "";

  products.forEach((product) => {
    const productElement = document.createElement("div");
    productElement.className = "product";
    productElement.innerHTML = `
          <img src="${product.image}" alt="${product.title}" />
          <h2>${product.title}</h2>
          <p>Price: $${product.price}</p>
          <p>${product.description}</p>
      `;
    productsContainer.appendChild(productElement);
  });

  productsContainer.style.display = "flex";
}

fetchProducts();
