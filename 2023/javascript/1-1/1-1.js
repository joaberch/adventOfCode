document.getElementById('file').addEventListener('change', handleFileSelect);

function handleFileSelect(event) {
    const fileInput = event.target;
    const files = fileInput.files;

    if (files.length > 0) {
        const file = files[0];

        const reader = new FileReader();
        reader.onload = function (e) {
            const fileContent = e.target.result;
            displayDataInTable(fileContent);
        };

        reader.readAsText(file);
    }
}

function displayDataInTable(textContent) {
    const lines = textContent.split('\n');
    const tableBody = document.getElementById('tableBody');

    for (let i = 0; i < lines.length; i++) {
        const line = lines[i].trim();
        const row = tableBody.insertRow();

        const cell1 = row.insertCell(0);
        const cell2 = row.insertCell(1);

        cell1.textContent = i + 1; // Numéro de ligne
        cell2.textContent = line; // Donnée

        // Ajoutez ici le code pour effectuer des actions sur chaque ligne si nécessaire
    }
}

let first
let last 

document.