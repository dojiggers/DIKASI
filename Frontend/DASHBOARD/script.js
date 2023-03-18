const tombol = document.getElementById('button');
const inputTextarea = document.getElementById('inputTextarea');
const container = document.getElementById('container');

tombol.addEventListener('click', () => {
    const newElement = document.createElement('div');
    newElement.innerHTML = inputTextarea.value

    container.appendChild(newElement);

    inputTextarea.value = '';

});

// Ambil elemen tombol menu dan elemen dropdown menu
const button = document.querySelector('.group button');
const dropdown = document.querySelector('.group ul');
 
// Atur tampilan dropdown menu saat tombol menu diklik
button.addEventListener('click', () => {
  dropdown.classList.toggle('hidden');
});
 
// Sembunyikan dropdown menu saat fokus beralih dari tombol menu
button.addEventListener('blur', () => {
  dropdown.classList.add('hidden');
});
 
// Sembunyikan dropdown menu saat salah satu pilihan menu di klik
dropdown.addEventListener('click', (event) => {
  const clickedElement = event.target;
  button.textContent = clickedElement.textContent; // ubah teks tombol menjadi teks dari elemen yang diklik
  dropdown.classList.add('hidden'); // sembunyikan dropdown
});
 

