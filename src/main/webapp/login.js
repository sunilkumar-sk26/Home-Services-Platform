function loginUser() {
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    fetch('LoginServlet', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `email=${encodeURIComponent(email)}&password=${encodeURIComponent(password)}`
    })
    .then(response => response.json())
    .then(data => {
        alert(data.message);
        if (data.success) {
            window.location.href = 'home.jsp';
        }
    })
    .catch(error => console.error('Error:', error));
}

function registerUser() {
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    fetch('RegisterServlet', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `email=${encodeURIComponent(email)}&password=${encodeURIComponent(password)}`
    })
    .then(response => response.json())
    .then(data => {
        alert(data.message);
        if (data.success) {
            window.location.href = 'login.jsp';
        }
    })
    .catch(error => console.error('Error:', error));
}

User
let users = [

    { email: 'abc@email.com', password: '123' },
    { email: 'def@email.com', password: '456' },
    { email: 'ghi@example.com', password: '789' }

];


function loginUser() {
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    // Send a POST request to LoginServlet
    fetch('LoginServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `email=${email}&password=${password}`
    })
    .then(response => response.text())
    .then(data => {
        if (data === 'success') {
            alert('Login successful!');
            window.location.href = 'home.jsp'; // Redirect to home page
        } else {
            alert('Invalid login credentials. Please try again.');
        }
    })
    .catch(error => console.error('Error:', error));
}



