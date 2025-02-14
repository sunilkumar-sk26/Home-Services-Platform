 console.log("Script loaded");
 
 window.onload = function() {
        var images = document.querySelectorAll('.zoomable-image');

        images.forEach(function(image) {
            image.addEventListener('click', function() {
                this.classList.toggle('zoomed');
            });
        });
    };