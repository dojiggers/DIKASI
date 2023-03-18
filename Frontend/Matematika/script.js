const button = document.getElementById('button');
const inputTextarea = document.getElementById('inputTextarea');
const container = document.getElementById('container');

button.addEventListener('click', () => {
    const newElement = document.createElement('div');
    newElement.innerHTML = inputTextarea.value

    container.appendChild(newElement);

    inputTextarea.value = '';

});