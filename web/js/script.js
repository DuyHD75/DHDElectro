let navbar = document.querySelector('.header .flex .navbar');
let profile = document.querySelector('.header .flex .profile');

document.querySelector('#menu-btn').onclick = () => {
    navbar.classList.toggle('active');
    profile.classList.remove('active');
}

const navbarItems = document.querySelectorAll(".nav");

navbarItems.forEach((item) => {
    item.addEventListener("click", () => {
        navbarItems.forEach((item) => {
            item.classList.remove("active");
        });

        console.log(item);
        item.classList.add("active");
    })
})


const toggleCreditCard = () =>  {
    var paymentMethod = document.getElementById("payment-method").value;
    var creditBoxs = document.getElementById("credit_box");
    if (paymentMethod === "Credit Card" || paymentMethod === "PayPal" || paymentMethod === "Pay ATM") {
        creditBoxs.style.display = "block";
    } else {
        creditBoxs.style.display = "none";
    }
}


document.querySelector('#user-btn').onclick = () => {
    profile.classList.toggle('active');
    navbar.classList.remove('active');
}

window.onscroll = () => {
    navbar.classList.remove('active');
    profile.classList.remove('active');
}

let mainImage = document.querySelector('.quick-view .box .row .image-container .main-image img');
let subImages = document.querySelectorAll('.quick-view .box .row .image-container .sub-image img');

subImages.forEach(images => {
    images.onclick = () => {
        src = images.getAttribute('src');
        mainImage.src = src;
    }
});



const tabLinks = document.querySelectorAll('.tab-nav li.tab a');

// Loop through each tab link
tabLinks.forEach(link => {
    // Add a click event listener to each tab link
    link.addEventListener('click', function (event) {
        event.preventDefault(); // Prevent the default link behavior

        // Remove the "active" class from all tab links
        tabLinks.forEach(tabLink => tabLink.classList.remove('active'));

        // Add the "active" class to the clicked tab link
        this.classList.add('active');

        // Get the ID of the clicked tab and show the corresponding content
        const tabId = this.getAttribute('href');
        const tabContent = document.querySelector(tabId);
        const allTabContents = document.querySelectorAll('.tab-content');

        // Hide all tab contents
        allTabContents.forEach(content => content.style.display = 'none');

        // Show the content of the clicked tab
        tabContent.style.display = 'block';
    });
});

