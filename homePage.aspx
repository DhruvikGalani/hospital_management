<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="hospital_management.homePage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <style>
               
        h2 {
            font-size: 2.2rem;
            font-weight: bold;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 1.5rem; 
            font-family: 'Playfair Display', serif; 
            position: relative;
            text-transform: uppercase;
            letter-spacing: 0.08em; 
        }

            h2::after {
                content: '';
                display: block;
                width: 40%; 
                height: 4px;
                background: linear-gradient(90deg, #ff8f40, #ffd6b0);
                margin: 0.9rem auto 1rem; /* Added spacing for breathing room */
                border-radius: 2px; /* Smooth and modern edges */
                box-shadow: 0 0 15px rgba(255, 143, 64, 0.6), 0 0 25px rgba(255, 143, 64, 0.4); /* Vibrant orange glow */
            }

        section {
            scroll-margin-top: 80px; /* Adjust based on your header height */
        }

    </style>
    <script>

        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener("click", function (e) {
                    e.preventDefault();
                    let targetId = this.getAttribute("href");
                    let targetElement = document.querySelector(targetId);

                    if (targetElement) {

                        targetElement.scrollIntoView({
                            behavior: "smooth",
                            block: "start"
                        });
                    }
                });
            });
        });


    </script>

    <script>

     const details = {

    Ahmedabad: {
        image_url: 'Images/Ahmedabad_HMS.jpg',
        address: "📍Infinity Health Care, 15 Sapphire Tower, SG Highway, Ahmedabad – 380051, Gujarat, India.",
    },

    Bangalore: {
        image_url: "Images/Bangalore_HMS.jpg",
        address: "📍Infinity Health Care, 22 MG Road, Opp. Brigade Towers, Bangalore – 560001, Karnataka, India.",
    },

    Aragonda: {
        image_url:  "Images/Aragonda_HMS.jpg",
        address: "📍Infinity Health Care, Main Road, Aragonda, Chittoor, Andhra Pradesh 517129.",
    },

    Bhubaneshwar: {
        image_url:  "Images/Bhubaneshwar_HMS.jpg",
        address: "📍Infinity Health Care, Plot No. 102, Jaydev Vihar, Bhubaneshwar - 751013, Odisha, India.",
    },

    Bilaspur: {
        image_url: "Images/Bilaspur_HMS.jpg",
        address: "📍Infinity Health Care, Civil Lines, Near Gandhi Chowk, Bilaspur - 495001, Chhattisgarh, India.",
    },

    Delhi: {
        image_url: "Images/Delhi_HMS.jpg",
        address: "📍Infinity Health Care, 5th Avenue, Connaught Place, New Delhi - 110001, India.",
    },

    Guwahati: {
        image_url:  "Images/Guwahati_HMS.jpg",
        address: "📍Infinity Health Care, 12 GS Road, Christian Basti, Guwahati - 781005, Assam, India.",
    },

    Hyderabad: {
        image_url: "Images/Hyderabad_HMS.jpg",
        address: "📍Infinity Health Care, Jubilee Hills, Hyderabad, Telangana - 500033, India.",
    },

    Indore: {
        image_url: "Images/Indore_HMS.jpg",
        address: "📍Infinity Health Care, 3rd Floor, Orbit Mall, Vijay Nagar, Indore - 452010, Madhya Pradesh, India.",
    },

    Kakinada: {
        image_url:  "Images/Kakinada_HMS.jpg",
        address: "📍Infinity Health Care, 8-2-15, Suryaraopeta, Kakinada - 533001, Andhra Pradesh, India.",
    },

    Karur: {
        image_url: "Images/Karur_HMS.jpg",
        address: "📍Infinity Health Care, 27 Kovai Road, Karur - 639002, Tamil Nadu, India.",
    },

    Kolkata: {
        image_url: "Images/Kolkata_HMS.jpg",
        address: "📍Infinity Health Care, 45 Park Street, Kolkata - 700016, West Bengal, India.",
    },

    Kochi: {
        image_url: "Images/Kochi_HMS.jpg",
        address: "📍Infinity Health Care, 6th Floor, Infopark, Kakkanad, Kochi - 682030, Kerala, India.",
    },

    Lucknow: {
        image_url:  "Images/Lucknow_HMS.jpg",
        address: "📍Infinity Health Care, Gomti Nagar, Near Ambedkar Park, Lucknow - 226010, Uttar Pradesh, India.",
    },

    Madurai: {
        image_url: "Images/Madurai_HMS.jpg",
        address: "📍Infinity Health Care, KK Nagar, Near Mattuthavani, Madurai - 625020, Tamil Nadu, India.",
    },

    Mumbai: {
        image_url: "Images/Mumbai_HMS.jpg",
        address: "📍Infinity Health Care, 12th Floor, BKC Towers, Bandra East, Mumbai - 400051, Maharashtra, India.",
    },

    Mysore: {
        image_url: "Images/Mysore_HMS.jpg",
        address: "📍Infinity Health Care, Kuvempunagar, Mysore - 570023, Karnataka, India.",
    },

    Nashik: {
        image_url: "Images/Nashik_HMS.jpg",
        address: "📍Infinity Health Care, Swaminarayan Nagar, Panchavati, Nashik - 422003, Maharashtra, India.",
    },

    Nellore: {
        image_url: "Images/Nellore_HMS.jpg",
        address: "📍Infinity Health Care, Muthukur Road, Ramji Nagar, Nellore - 524004, Andhra Pradesh, India.",
    },

    Noida: {
        image_url: "Images/Noida_HMS.png",
        address: "📍Infinity Health Care, Stellar Business Park, Sector 62, Noida - 201301, Uttar Pradesh, India.",
    },
};



        // Ensure the default location is selected when the page loads
        document.addEventListener("DOMContentLoaded", function () {
            showDetails("Ahmedabad"); // Show Ahmedabad details by default
            setActiveIcon("Ahmedabad"); // Set Ahmedabad icon as active by default
        });

        // Function to show details of the selected location
        function showDetails(location) {
            const detailsContainer = document.getElementById("location-details");
            const locationDetails = details[location];
            detailsContainer.innerHTML = `
            <h4 style=" font-size: 2rem; font-weight: bold; color: #2c3e50; margin-bottom: 15px;text-transform: capitalize;">${location}</h4>
            <img style=" height:360px; width:100%;border-radius: 12px; margin-bottom: 15px; box-shadow: 2px 4px 8px rgba(1, 1, 3, 0.2);   " src="${locationDetails.image_url}" alt="${location} Image">
            <p style=" font-size: 16px; color: #34495e; text-align: start; padding: 20px 0px; line-height: 30px;">${locationDetails.address}</p>
        `;
        }

        // Function to set the clicked icon as active
        function setActiveIcon(location) {
            const icons = document.querySelectorAll(".location-icon");

            // Remove the active class from all icons
            icons.forEach(icon => icon.classList.remove("location-active"));

            // Add the active class to the clicked or default icon
            const selectedIcon = document.querySelector(`.location-icon[data-location='${location}']`);
            if (selectedIcon) {
                selectedIcon.classList.add("location-active");
            }
        }

        // Attach the showDetails function to each icon click event
        function attachIconClickEvents() {
            const icons = document.querySelectorAll(".location-icon");
            icons.forEach(icon => {
                icon.addEventListener("click", function () {
                    const location = icon.getAttribute("data-location");
                    showDetails(location); // Show details of the clicked location
                    setActiveIcon(location); // Set the clicked icon as active
                });
            });
        }

        // Call the function to attach events when DOM content is loaded
        document.addEventListener("DOMContentLoaded", attachIconClickEvents);

        // for view more and less in services
         document.addEventListener("DOMContentLoaded", function () {
     const servicesGrid = document.getElementById("servicesGrid");
     const viewMoreBtn = document.getElementById("viewMoreBtn");
     const services = [
         { img: "svgs/cardiology_icon.svg", name: "Cardiology" },
         { img: "svgs/neurology.svg", name: "Neurology" },
         { img: "svgs/gastroenterology.svg", name: "Gastroenterology" },
         { img: "svgs/orthopaedic.svg", name: "Orthopedic" },
         { img: "svgs/oncology_icon.svg", name: "Oncology" },
         { img: "svgs/gynecology.svg", name: "Gynecology" },
         { img: "svgs/dermatology.svg", name: "Dermatology" },
         { img: "svgs/ophthalmology.svg", name: "Ophthalmology" },
         { img: "svgs/paediatricurology.svg", name: "Pediatrics" },
         { img: "svgs/endocrinology.svg", name: "Endocrinology" },
         { img: "svgs/urology.svg", name: "Urology" },
         { img: "svgs/nephrology.svg", name: "Nephrology" },
         { img: "svgs/pulmonology.svg", name: "Pulmonology" },
         { img: "svgs/rheumatology.svg", name: "Rheumatology" },
         { img: "svgs/neurology.svg", name: "Neurosurgery" },
         { img: "svgs/radiology.svg", name: "Radiology" },
         { img: "svgs/plasticsurgery.svg", name: "Plastic Surgery" },
         { img: "svgs/neonatology.svg", name: "Neonatology" },
         { img: "svgs/vascularsurgery.svg", name: "Vascular Surgery" },
         { img: "svgs/psychiatry.svg", name: "Psychiatry" },
         { img: "svgs/dentistry.svg", name: "Dentistry" },
         { img: "svgs/ent.svg", name: "ENT (Ear, Nose, Throat)" }
     ];
     
     let expanded = false;
     
     function renderServices(limit) {
         servicesGrid.innerHTML = "";
         services.slice(0, limit).forEach(service => {
             const serviceCard = document.createElement("div");
             serviceCard.classList.add("service-card");
             serviceCard.innerHTML = `
                 <img src="${service.img}" alt="${service.name}">
                 <h3>${service.name}</h3>
             `;
             servicesGrid.appendChild(serviceCard);
         });
     }
     
     renderServices(10);
     
     viewMoreBtn.addEventListener("click", function () {
         if (expanded) {
             renderServices(10);
             viewMoreBtn.textContent = "View More";
         } else {
             renderServices(services.length);
             viewMoreBtn.textContent = "View Less";
         }
         expanded = !expanded;
     });
 });

    </script>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MedCare Hospital</title>

    <link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="StyleSheet/maincss.css">
    <link rel="stylesheet" href="StyleSheet/headercss.css">
    <link rel="stylesheet" href="StyleSheet/herocss.css">
    <link rel="stylesheet" href="StyleSheet/servicecss.css">
    <link rel="stylesheet" href="StyleSheet/providecss.css">
    <link rel="stylesheet" href="StyleSheet/doctorscss.css">
    <link rel="stylesheet" href="StyleSheet/location.css">
</head>
<body>



    <header class="header">
        <div class="logo">
            <object type="image/svg+xml" data="Iamges/hms_logo.svg" width="60" height="60">
                <img src="Images/hms_logo.svg" alt="Infinity Health Care Logo" />
            </object>
            <h1>Infinity Health Care</h1>
        </div>
        <nav class="nav">
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="https://localhost:44331/Doctor/Patientsandcarers.aspx">Patients and carers</a>
                <li><a href="#services">Services</a></li>
                <li><a href="#doctors">Doctors</a></li>
                <li><a href="#appointments">Appointments</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="pages/LoginPage.aspx">Login</a></li>
               <li><a href="https://localhost:44331/pages/RegisterPage.aspx">Register</a></li>
                

            </ul>
        </nav>
    </header>
    <div class="image-preload">
        <img src="Images/hms_im.jpg" alt="Image 1" />
        <img src="Images/hms_im2.jpeg" alt="Image 2" />
        <img src="Images/hms_im3.jpg" alt="Image 3" />
        <img src="Images/hms_im4.jpeg" alt="Image 4" />
        <img src="Images/hms_im5.jpeg" alt="Image 5" />
        <img src="../Images/hms_im6.jpg" alt="Image 6" />
    </div>

    <section id="home" class="hero">
        <div class="hero-content">
            <h1 class="maintxt">Your Health Is Our Priority</h1>
            <p>Providing exceptional healthcare services with compassion and expertise</p>
            <button class="cta-button">Book Appointment</button>
        </div>
    </section>
    <section id="services" class="services">
        <div class="container">
            <h2>Explore our Centres of Clinical Excellence</h2>
            <p class="text-center">Infinity Health Care has dedicated Centres of Excellence for several key specialties and super specialties. They are unique and state-of-the-art facilities spread across multiple locations. Each Centre of Excellence stands out as a citadel of world-class clinical outcomes.</p>
            <p class="text-center">Learn about the world-class health care we provide</p>
        </div>

        <div class="services-container">
            <div class="services-image">
                <img class="serimg" src="Images/doctor_team3.jpg" alt="Doctor Consultation">
            </div>
            <div>
                <div class="services-grid" id="servicesGrid">
                    <!-- Service cards here -->
                </div>
                <div class="view-more-container">
                    <button id="viewMoreBtn" class="view-more-btn">View More</button>
                </div>
            </div>
        </div>
    </section>

    <section id="doctors" class="doctors">
        <h2>Our Doctors</h2>

        <div class="doctors-grid">
            <div class="doctor-card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBDeQ7Fy5RfL7FeXNuKgMFpWeqB7X6HgtOpA&s">
                <h3>Dr. Naman Shah</h3>
                <p>Cardiologist</p>
            </div>
            <div class="doctor-card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJpvTE_s_sSmQheRF5_mmWKEw5ctkYUm6bXA&s" alt="Dr. Arushi Sharma">
                <h3>Dr. Arushi Sharma</h3>
                <p>Neurologist</p>
            </div>
            <div class="doctor-card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC34t53kCXc4x1BUAkUcu8VxT2xFBAKlQdVg&s" alt="Dr. Rasha Agarwal">
                <h3>Dr. Rasha Agarwal</h3>
                <p>Pediatrician</p>
            </div>
            <div class="doctor-card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxwpz0blH-K289vdSbk_fihzo4S0JKpcSQlA&s" alt="Dr. Aditi Soni">
                <h3>Dr. Aditi Soni</h3>
                <p>Neurologist</p>
            </div>

        </div>
    </section>




    <section id="Location" class="Location">

        <div class="container">
            <h2>Hospitals in India</h2>
            <p class="text-center">
                Infinily Health Care Group is one of the best hospital groups in India with over 10,000+ beds across 73+ hospitals, 6,000+ pharmacies, over 700+ clinics, 2,300+ diagnostic centres, and 200+ Telemedicine units.
            </p>


            <div class="locrow">
                <!-- Location Icons -->
                <div class="locations-container" id="locations">

                    <div class="location-icon" onclick="showDetails('Ahmedabad')" data-location="Ahmedabad">
                        <img src="svgs/ahmedabad_city.svg" alt="Ahmedabad Icon" width="80" height="80">
                        <p>Ahmedabad</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Bangalore')" data-location="Bangalore">
                        <img src="svgs/bangalore_city.svg" alt="Bangalore Icon" width="80" height="80">
                        <p>Bangalore</p>
                    </div>

                    <div class="location-icon" onclick="showDetails('Aragonda')" data-location="Aragonda">
                        <img src="svgs/ahmedabad_city.svg" alt="Aragonda Icon" width="80" height="80">
                        <p>Aragonda</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Bhubaneshwar')" data-location="Bhubaneshwar">
                        <img src="svgs/bhubaneshwar_city.svg" alt="Bhubaneshwar Icon" width="80" height="80">
                        <p>Bhubaneshwar</p>
                    </div>
                    <div class="location-icon location-active" onclick="showDetails('Bilaspur')" data-location="Bilaspur">
                        <img src="svgs/bangalore_city.svg" alt="Bilaspur Icon" width="80" height="80">
                        <p>Bilaspur</p>
                    </div>

                    <div class="location-icon" onclick="showDetails('Delhi')" data-location="Delhi">
                        <img src="svgs/delhi_city.svg" alt="Delhi Icon" width="80" height="80">
                        <p>Delhi</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Guwahati')" data-location="Guwahati">
                        <img src="svgs/guwahati_city.svg" alt="Guwahati Icon" width="80" height="80">
                        <p>Guwahati</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Hyderabad')" data-location="Hyderabad">
                        <img src="svgs/hyderabad_city.svg" alt="Hyderabad Icon" width="80" height="80">
                        <p>Hyderabad</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Indore')" data-location="Indore">
                        <img src="svgs/indore_city.svg" alt="Indore Icon" width="80" height="80">
                        <p>Indore</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Kakinada')" data-location="Kakinada">
                        <img src="svgs/kakinada_city.svg" alt="Kakinada Icon" width="80" height="80">
                        <p>Kakinada</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Karur')" data-location="Karur">
                        <img src="svgs/kakinada_city.svg" alt="Karur Icon" width="80" height="80">
                        <p>Karur</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Kolkata')" data-location="Kolkata">
                        <img src="svgs/kolkata_city.svg" alt="Kolkata Icon" width="80" height="80">
                        <p>Kolkata</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Kochi')" data-location="Kochi">
                        <img src="svgs/kakinada_city.svg" alt="Kochi Icon" width="80" height="80">
                        <p>Kochi</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Lucknow')" data-location="Lucknow">
                        <img src="svgs/lucknow_city.svg" alt="Lucknow Icon" width="80" height="80">
                        <p>Lucknow</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Madurai')" data-location="Madurai">
                        <img src="svgs/lucknow_city.svg" alt="Madurai Icon" width="80" height="80">
                        <p>Madurai</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Mumbai')" data-location="Mumbai">
                        <img src="svgs/mumbai_city.svg" alt="Mumbai Icon" width="80" height="80">
                        <p>Mumbai</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Mysore')" data-location="Mysore">
                        <img src="svgs/mysore_city.svg" alt="Mysore Icon" width="80" height="80">
                        <p>Mysore</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Nashik')" data-location="Nashik">
                        <img src="svgs/nashik_city.svg" alt="Nashik Icon" width="80" height="80">
                        <p>Nashik</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Nellore')" data-location="Nellore">
                        <img src="svgs/lucknow_city.svg" alt="Nellore Icon" width="80" height="80">
                        <p>Nellore</p>
                    </div>
                    <div class="location-icon" onclick="showDetails('Noida')" data-location="Noida">
                        <img src="svgs/delhi_city.svg" alt="Noida Icon" width="80" height="80">
                        <p>Noida</p>
                    </div>


                </div>

                <!-- Location Details -->
                <div class="details-container" id="location-details">
                    <h4>Ahmedabad</h4>

                    <div class="imgcon">
                        <img class="locimg" src="https://cdn.apollohospitals.com/apollohospitals/apollo-prohealth/ah/location.jpg" alt="Ahemdabad Image">
                    </div>
                    <p class="locaddress">📍Plot No.1A, Bhat GIDC Estate, Gandhinagar – 382428, Gujarat, India.</p>
                </div>

            </div>
        </div>


    </section>

    <section id="provide" class="provide">
        <h2>Why Choose Us?</h2>
        <div class="provide-grid">
            <div class="provide-card">
                <div class="svg_class">
                    <svg width="80" height="75" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M32 12.5C32 13.0523 32.4477 13.5 33 13.5C33.5523 13.5 34 13.0523 34 12.5V11C34 10.4477 33.5523 10 33 10C32.4477 10 32 10.4477 32 11V12.5Z" fill="currentColor" />
                        <path d="M16 24V27H18V24H21V22H18V19H16V22H13V24H16Z" fill="currentColor" />
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M4 17C4 15.3431 5.34315 14 7 14H27C28.6569 14 30 15.3431 30 17V19H31V18H32V17C32 16.4477 32.4477 16 33 16C33.5523 16 34 16.4477 34 17V18H35V19H35.718C36.4722 19 37.1987 19.284 37.7529 19.7956L43.0348 24.6713C43.6501 25.2392 44 26.0384 44 26.8757V35H38.874C38.4299 36.7252 36.8638 38 35 38C33.1362 38 31.5701 36.7252 31.126 35H15.874C15.4299 36.7252 13.8638 38 12 38C10.1362 38 8.57006 36.7252 8.12602 35H4V17ZM31.126 33C31.5701 31.2748 33.1362 30 35 30C36.8638 30 38.4299 31.2748 38.874 33H42V28L30 28V33H31.126ZM30 26L41.5257 26L36.3963 21.2652C36.2116 21.0947 35.9694 21 35.718 21H30V26ZM27 16C27.5523 16 28 16.4477 28 17V33H15.874C15.4299 31.2748 13.8638 30 12 30C10.1362 30 8.57006 31.2748 8.12602 33H6V17C6 16.4477 6.44772 16 7 16H27ZM12 36C13.1046 36 14 35.1046 14 34C14 32.8954 13.1046 32 12 32C10.8954 32 10 32.8954 10 34C10 35.1046 10.8954 36 12 36ZM37 34C37 35.1046 36.1046 36 35 36C33.8954 36 33 35.1046 33 34C33 32.8954 33.8954 32 35 32C36.1046 32 37 32.8954 37 34Z" fill="currentColor" />
                        <path d="M36.5 17C36.5 16.4477 36.9477 16 37.5 16H39C39.5523 16 40 16.4477 40 17C40 17.5523 39.5523 18 39 18H37.5C36.9477 18 36.5 17.5523 36.5 17Z" fill="currentColor" />
                        <path d="M35.8285 12.759C35.4193 13.1298 35.3881 13.7622 35.759 14.1715C36.1298 14.5807 36.7622 14.6119 37.1715 14.241L38.0857 13.4126C38.4949 13.0417 38.5261 12.4093 38.1552 12.0001C37.7844 11.5908 37.152 11.5597 36.7427 11.9306L35.8285 12.759Z" fill="currentColor" />
                    </svg>
                </div>

                <h3>Emergency Services</h3>
                <p>24/7 emergency care to address all critical medical needs swiftly and efficiently.</p>
            </div>
            <div class="provide-card">
                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="60" height="80" x="0" y="0" viewBox="0 0 512 512" style="enable-background: new 0 0 512 512" xml:space="preserve">
                    <g>
                        <path d="M426.802 335.888c-30.756-15.528-64.55-26.22-97.827-32.936a63.389 63.389 0 0 1-15.657-30.182c20.599-16.11 36.369-40.274 45.009-69.06 23.857-3.612 30.061-40.271 20.599-60.345 43.445-190.382-288.17-190.777-245.757-.415-9.956 20.064-3.761 57.218 20.373 60.779 8.526 28.786 24.41 52.951 45.009 69.06a63.776 63.776 0 0 1-16.6 31.314c-15.751 2.754-25.447 5.074-25.655 5.301C91.765 327.167 34.499 347.13 42.361 426.567c-3.276 113.782 430.382 113.888 427.281.003 3.408-35.841-8.164-74.339-42.84-90.682zM256.217 15.657c74.86-1.031 118.948 48.205 109.24 114.654-4.426-2.132-9.742-2.225-14.506-1.151-1.886-5.659-4.961-14.733-10.243-29.465-.671-1.305-1.768-2.486-2.641-3.678-67.459-44.884-95.62 38.341-156.192-.245-.358-.226-.604-.434-.924-.679-3.094-.789-6.561-.265-8.526 2.528-6.27 12.626-9.564 26.62-11.639 31.54-4.575-1.171-9.595-1.074-13.921.924-9.711-66.393 34.517-115.438 109.352-114.428zm-89.546 177.489c-3.842-9.718-10.218-2.807-14.393-5.998-9.47-6.437-11.824-39.35.341-42.803 6.325-2.081 11.912 5.979 17.844 1.358a8.454 8.454 0 0 0 3.113-5.282c.566-2.547 4.584-14.28 8.979-26.409 69.039 31.684 83.889-40.54 144.572-6.527 7.999 19.532 8.173 29.892 14.259 38.2 5.912 4.649 11.539-3.493 17.847-1.359 4.848 1.358 9.432 10.582 8.3 23.014-.943 10.356-4.848 16.977-7.942 19.788-4.493 2.917-11.318-3.671-14.393 5.999-27.511 111.775-151.125 111.802-178.527.019zm45.707 88.867a88.228 88.228 0 0 0 87.132 0 77.055 77.055 0 0 0 17.6 31.125c-4.018 12.658-32.936 36.615-61.119 54.101-28.296-17.487-57.214-41.5-61.137-54.101a77.354 77.354 0 0 0 17.524-31.125zM57.902 426.566c-5.767-63.339 28.955-79.046 82.171-96.432a284.201 284.201 0 0 0-5.659 30.823c-32.999 9.958-31.215 40.323-26.032 68.155-7.242 9.846 4.999 23.253 15.45 16.807 7.791-4.253 7.492-16.26-.359-20.259-2.931-20.397-8.512-45.611 19.419-49.76 26.465-1.17 26.956 24.466 28.967 43.856-6.787 5.866-3.726 17.564 4.925 19.648 11.381 3.463 19.988-12.115 10.6-19.648-1.711-26.18-5.794-55.38-37.294-59.609a285.313 285.313 0 0 1 7.338-35.087c5.045-1.325 7.368-2.088 23.712-5.074 10.017 23.485 51.706 51.121 67.117 60.553v115.786c-90.6-3.711-190.28-22.243-190.355-69.759zm396.139 0c-.024 47.422-99.68 66.071-190.392 69.758V380.538c15.657-9.677 57.912-37.728 67.362-61.232 7.642 1.45 15.028 3.346 22.316 5.282a288.056 288.056 0 0 1 8.979 49.499c-36.075 12.984-17.678 66.958 18.814 55.209 27.59-8.449 24.972-50.915-3.27-56.115a316.443 316.443 0 0 0-7.149-43.387c53.488 17.271 89.314 33.064 83.34 96.772zm-82.302-38.652c17.724.176 17.768 27.068-.013 27.152-17.792-.123-17.673-27.007.051-27.152h-.038z" fill="#000000" opacity="1" data-original="#000000"></path>
                    </g>
                </svg>
                <h3>Qualified Doctors</h3>
                <p>Our team of experienced and certified doctors ensures you receive the best treatment.</p>
            </div>
            <div class="provide-card">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0,0,256,256" width="60" height="80" fill-rule="nonzero">
                    <g fill="#190932" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" style="mix-blend-mode: normal">
                        <g transform="scale(4,4)">
                            <path d="M5.343,56.447c4.30048,4.30819 11.27697,4.32161 15.594,0.03l23.91,-23.91c1.65167,-1.65195 3.89199,-2.58002 6.228,-2.58002c2.33601,0 4.57633,0.92808 6.228,2.58002c0.02659,0.02653 0.05464,0.05157 0.084,0.075c3.37028,3.45134 3.33685,8.97174 -0.075,12.382l-2.4,2.412l-1.825,1.891c-2.98848,-2.15552 -7.13464,-1.6353 -9.49794,1.19173c-2.36331,2.82702 -2.1403,6.99974 0.51085,9.55878c2.65115,2.55904 6.82914,2.6344 9.57086,0.17263c2.74172,-2.46176 3.11505,-6.62372 0.85523,-9.53414l1.814,-1.881l2.389,-2.4c2.02713,-2.0266 3.16601,-4.77558 3.16601,-7.642c0,-2.86642 -1.13888,-5.6154 -3.16601,-7.642c-0.02888,-0.02859 -0.05925,-0.05563 -0.091,-0.081c-4.23284,-4.14274 -11.01155,-4.10662 -15.2,0.081l-23.91,23.91c-3.52634,3.5072 -9.22462,3.50317 -12.746,-0.009l-0.191,-0.2c-1.63161,-1.62978 -2.5484,-3.84134 -2.5484,-6.1475c0,-2.30616 0.91679,-4.51772 2.5484,-6.1475l3.566,-3.566l18.717,-6.971c3.38291,-0.03885 6.61623,-1.4003 9.008,-3.793l1.418,-1.414c0.39038,-0.3905 0.39038,-1.0235 0,-1.414l-0.708,-0.708l5.658,-5.656c1.67712,-1.68171 1.94234,-4.31014 0.635,-6.293l0.072,-0.071c0.37525,-0.3751 0.58607,-0.88393 0.58607,-1.4145c0,-0.53057 -0.21082,-1.0394 -0.58607,-1.4145l-0.707,-0.707c-1.17167,-1.17361 -3.07289,-1.17517 -4.2465,-0.0035c-1.17361,1.17167 -1.17517,3.07289 -0.0035,4.2465v0l0.707,0.707c0.72942,0.73678 1.90342,0.78692 2.693,0.115c0.55829,1.14513 0.3308,2.51814 -0.567,3.422l-5.658,5.656l-0.707,-0.707c-0.3905,-0.39038 -1.0235,-0.39038 -1.414,0l-1.414,1.413c-2.73381,2.73381 -7.16619,2.73381 -9.9,0c-2.73381,-2.73381 -2.73381,-7.16619 0,-9.9l1.415,-1.414c0.39038,-0.3905 0.39038,-1.0235 0,-1.414l-0.708,-0.708l5.653,-5.655c0.90381,-0.89859 2.27741,-1.12652 3.423,-0.568c-0.66126,0.79141 -0.61233,1.95586 0.113,2.689l0.707,0.707c1.17167,1.17278 3.07222,1.17367 4.245,0.002c1.17278,-1.17167 1.17367,-3.07222 0.002,-4.245l-0.707,-0.706c-0.7915,-0.75594 -2.0375,-0.75594 -2.829,0l-0.071,0.072c-1.98318,-1.30669 -4.61137,-1.04107 -6.293,0.636l-5.657,5.655l-0.707,-0.707c-0.3905,-0.39038 -1.0235,-0.39038 -1.414,0l-1.412,1.414c-2.392,2.39183 -3.75336,5.62455 -3.793,9.007l-6.969,18.729l-3.564,3.564c-4.16994,4.16612 -4.17978,10.92175 -0.022,15.1zM49,60c-2.76142,0 -5,-2.23858 -5,-5c0,-2.76142 2.23858,-5 5,-5c0.94824,0.00214 1.87595,0.27633 2.673,0.79l-1.433,1.486c-0.3885,-0.18063 -0.81157,-0.27479 -1.24,-0.276c-1.65685,0 -3,1.34315 -3,3c0,1.65685 1.34315,3 3,3c1.65685,0 3,-1.34315 3,-3c-0.00283,-0.46341 -0.11449,-0.91967 -0.326,-1.332l1.443,-1.495c1.05449,1.52831 1.17361,3.5156 0.30922,5.15892c-0.86439,1.64332 -2.56943,2.67111 -4.42622,2.66808zM50,55c0,0.55228 -0.44772,1 -1,1c-0.55228,0 -1,-0.44772 -1,-1c0,-0.55228 0.44772,-1 1,-1c0.55228,0 1,0.44772 1,1zM42.125,12.671l-0.707,-0.707c-0.39074,-0.39074 -0.39074,-1.02426 0,-1.415c0.39074,-0.39074 1.02426,-0.39074 1.415,0l0.707,0.708zM36.468,4.186l0.708,0.707c0.39047,0.39074 0.39024,1.02403 -0.0005,1.4145c-0.39074,0.39047 -1.02403,0.39024 -1.4145,-0.0005l-0.707,-0.707zM20.912,11.256l0.707,-0.707l1.414,1.415l-0.707,0.707c-3.51502,3.51474 -3.51524,9.21348 -0.0005,12.7285c3.51474,3.51502 9.21348,3.51524 12.7285,0.0005l0.707,-0.707l1.414,1.415l-0.707,0.707c-4.2965,4.29567 -11.26183,4.295 -15.5575,-0.0015c-4.29567,-4.2965 -4.295,-11.26183 0.0015,-15.5575zM18.549,27.162c0.5901,0.7441 1.26349,1.41816 2.007,2.009l-3.014,1.006zM16.309,22.962c0.22146,0.71082 0.50418,1.40107 0.845,2.063l-2.143,6.419c-0.10198,0.3051 -0.05095,0.64062 0.13711,0.90161c0.18806,0.26099 0.4902,0.41557 0.81189,0.41539c0.10747,0.00006 0.21422,-0.01751 0.316,-0.052l6.416,-2.141c0.66481,0.3424 1.35808,0.62646 2.072,0.849l-13.464,5.013z"></path>
                        </g>
                    </g></svg>
                <h3>Outdoor Checkup</h3>
                <p>Convenient health checkups in comfortable outdoor settings for your well-being.</p>
            </div>
            <div class="provide-card">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" width="60" height="80">
                    <path d="M 24.984375 1.9863281 A 1.0001 1.0001 0 0 0 24.814453 2.0039062 C 12.237888 2.1031784 2.1084057 12.229427 2.0039062 24.804688 A 1.0001 1.0001 0 0 0 2.0039062 25.183594 C 2.102141 37.76107 12.228737 47.891604 24.804688 47.996094 A 1.0001 1.0001 0 0 0 25.183594 47.996094 C 37.76107 47.897859 47.891604 37.771263 47.996094 25.195312 A 1.0001 1.0001 0 0 0 47.994141 24.804688 C 47.958948 20.664327 46.820153 16.802224 44.935547 13.503906 A 1.0001 1.0001 0 1 0 43.199219 14.496094 C 44.79785 17.293916 45.801992 20.52893 45.966797 24 L 44 24 A 1.0001 1.0001 0 1 0 44 26 L 45.974609 26 C 45.473247 36.853995 36.853995 45.473247 26 45.974609 L 26 44 A 1.0001 1.0001 0 0 0 24.984375 42.986328 A 1.0001 1.0001 0 0 0 24 44 L 24 45.974609 C 13.146005 45.473247 4.5267535 36.853995 4.0253906 26 L 6 26 A 1.0001 1.0001 0 1 0 6 24 L 4.0234375 24 C 4.5248095 13.146126 13.145999 4.5267539 24 4.0253906 L 24 6 A 1.0001 1.0001 0 1 0 26 6 L 26 4.0429688 C 30.427366 4.2564387 34.526051 5.8520499 37.871094 8.3808594 A 1.000399 1.000399 0 1 0 39.078125 6.7851562 C 35.209579 3.8605843 30.397088 2.0543585 25.203125 2.0078125 A 1.0001 1.0001 0 0 0 24.984375 1.9863281 z M 47.037109 3.9902344 A 1.0001 1.0001 0 0 0 46.263672 4.3242188 L 24.96875 27.554688 L 16.707031 19.292969 A 1.0001 1.0001 0 1 0 15.292969 20.707031 L 25.03125 30.445312 L 47.736328 5.6757812 A 1.0001 1.0001 0 0 0 47.037109 3.9902344 z" />
                </svg>
                <h3>24 Hours Service</h3>
                <p>Round-the-clock support for all your medical requirements, day or night.</p>
            </div>

        </div>
    </section>



    <footer class="footer">
        <div class="contact-info">
            <h3>Contact Us</h3>
            <p>📞 Emergency: 911</p>
            <p>📞 General: (555) 123-4567</p>
            <p>📍 123 Medical Center Drive</p>
            <p>📧 info@medcare.com</p>
        </div>
    </footer>
</body>
</html>
