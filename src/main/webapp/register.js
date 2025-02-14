function registerUser() {
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const feedback = document.getElementById('signup-feedback');

    // Send a POST request to RegisterServlet
    fetch('RegisterServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `email=${email}&password=${password}`
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            feedback.innerHTML = 'Registration successful!'; // Display success message
        } else {
            feedback.innerHTML = 'Registration failed. ' + data.message; // Display failure message
        }
        feedback.style.display = "block";
    })
    .catch(error => console.error('Error:', error));
}
