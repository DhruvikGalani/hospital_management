<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="hospital_management.homePage" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MedCare Hospital</title>

    <link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css" />

    <link rel="stylesheet" href="StyleSheet/maincss.css">
    <link rel="stylesheet" href="StyleSheet/headercss.css">
    <link rel="stylesheet" href="StyleSheet/herocss.css">
    <link rel="stylesheet" href="StyleSheet/servicecss.css">
    <link rel="stylesheet" href="StyleSheet/doctorscss.css">
</head>
<body>
    <header class="header">
        <div class="logo">
            <object type="image/svg+xml" data="Iamges/hms_logo.svg" width="60" height="60">
                <img src="Iamges/hms_logo.svg" alt="Infinity Health Care Logo" />
            </object>
            <h1>Infinity Health Care</h1>
        </div>
        <nav class="nav">
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#services">Services</a></li>
                <li><a href="#doctors">Doctors</a></li>
                <li><a href="#appointments">Appointments</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
    </header>

    <section id="home" class="hero">
        <div class="hero-content">
            <h2>Your Health Is Our Priority</h2>
            <p>Providing exceptional healthcare services with compassion and expertise</p>
            <button class="cta-button">Book Appointment</button>
        </div>

    </section>

    <section id="services" class="services">
        <h2>Our Services</h2>
        <div class="services-grid">
            <div class="service-card">
                <img src="https://placehold.co/100x100" alt="Emergency Care">
                <h3>Emergency Care</h3>
                <p>24/7 emergency medical services</p>
            </div>
            <div class="service-card">
                <img src="https://placehold.co/100x100" alt="Laboratory">
                <h3>Laboratory</h3>
                <p>Advanced diagnostic testing</p>
            </div>
            <div class="service-card">
                <img src="https://placehold.co/100x100" alt="Surgery">
                <h3>Surgery</h3>
                <p>State-of-the-art surgical care</p>
            </div>
            <div class="service-card">
                <img src="https://placehold.co/100x100" alt="Pediatrics">
                <h3>Pediatrics</h3>
                <p>Specialized care for children</p>
            </div>
            <div class="service-card">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/cardiology_icon.svg" alt="Pediatrics">
                <h3>Cardiology</h3>
            </div>
             <div class="service-card">
                 <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/neurology.svg" alt="Pediatrics">
                 <h3>Neurology</h3>
             </div>
            <div class="service-card">
                 <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/gastroenterology.svg" alt="Pediatrics">
                 <h3>Gastroenterology</h3>
           </div>
             <div class="service-card">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/orthopaedic.svg" alt="Pediatrics">
                <h3>Orthopedic</h3>
            </div>
             <div class="service-card">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/oncology_icon.svg" alt="Pediatrics">
                <h3>Oncology</h3>
            </div>
             <div class="service-card">
                 <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/gynecology.svg" alt="Pediatrics">
                 <h3>Gynecology</h3>
            </div>
             <div class="service-card">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/dermatology.svg" alt="Pediatrics">
                <h3>Dermatology</h3>
            </div>
             <div class="service-card">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/ophthalmology.svg" alt="Pediatrics">
                <h3>Ophthalmology</h3>
            </div>
             <div class="service-card">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/paediatricurology.svg" alt="Pediatrics">
                <h3>Pediatrics</h3>
            </div>
             <div class="service-card">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/endocrinology.svg" alt="Pediatrics">
                <h3>Endocrinology</h3>
            </div>
             <div class="service-card">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/urology.svg" alt="Pediatrics">
                <h3>Urology</h3>
            </div>
             <div class="service-card">
                 <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/nephrology.svg" alt="Pediatrics">
                 <h3>Nephrology</h3>
            </div>
             <div class="service-card">
                  <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/pulmonology.svg" alt="Pediatrics">
                  <h3>Pulmonology</h3>
            </div>
             <div class="service-card">
                  <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/rheumatology.svg" alt="Pediatrics">
                  <h3>Rheumatology</h3>
            </div>
             <div class="service-card">
                  <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/neurology.svg" alt="Pediatrics">
                  <h3>Neurosurgery</h3>
            </div>
             <div class="service-card">
                 <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/radiology.svg" alt="Pediatrics">
                 <h3>Radiology</h3>
            </div>
             <div class="service-card">
                    <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/plasticsurgery.svg" alt="Pediatrics">
                    <h3>Plastic surgery</h3>
            </div>
             <div class="service-card">
                    <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/neonatology.svg" alt="Pediatrics">
                    <h3>Neonatology</h3>
            </div>
             <div class="service-card">
                    <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/vascularsurgery.svg" alt="Pediatrics">
                    <h3>Vascular Surgery</h3>
            </div>
             <div class="service-card" style="display: none;">
                    <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/psychiatry.svg" alt="Pediatrics">
                    <h3>Psychiatry</h3>
            </div>
             <div class="service-card" style="display: none;">
                    <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/dentistry.svg" alt="Pediatrics">
                    <h3>Dentistry</h3>
            </div>
             <div class="service-card" style="display: none;">
                    <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/ent.svg" alt="Pediatrics">
                    <h3>ENT (Ear, Nose, Throat)</h3>
            </div>
        </div>

         <div class="service" style="padding: 0px 0px 0px 40px">
            <div class="service2">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/cardiology_icon.svg" alt="Pediatrics">
                <h6>Cardiology</h6>
            </div>
             <div class="service2">
                 <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/neurology.svg" alt="Pediatrics">
                 <h6>Neurology</h6>
             </div>
            <div class="service2">
                 <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/gastroenterology.svg" alt="Pediatrics">
                 <h6>Gastroenterology</h6>
           </div>
             <div class="service2">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/orthopaedic.svg" alt="Pediatrics">
                <h6>Orthopedic</h6>
            </div>
             <div class="service2">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/oncology_icon.svg" alt="Pediatrics">
                <h6>Oncology</h6>
            </div>
             <div class="service2">
                 <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/gynecology.svg" alt="Pediatrics">
                 <h6>Gynecology</h6>
            </div>
             <div class="service2">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/dermatology.svg" alt="Pediatrics">
                <h6>Dermatology</h6>
            </div>
             <div class="service2">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/ophthalmology.svg" alt="Pediatrics">
                <h6>Ophthalmology</h6>
            </div>
             <div class="service2">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/paediatricurology.svg" alt="Pediatrics">
                <h6>Pediatrics</h6>
            </div>
             <div class="service2">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/endocrinology.svg" alt="Pediatrics">
                <h6>Endocrinology</h6>
            </div>
             <div class="service2">
                <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/urology.svg" alt="Pediatrics">
                <h6>Urology</h6>
            </div>
             <div class="service2">
                 <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/nephrology.svg" alt="Pediatrics">
                 <h6>Nephrology</h6>
            </div>
             <div class="service2">
                  <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/pulmonology.svg" alt="Pediatrics">
                  <h6>Pulmonology</h6>
            </div>
             <div class="service2">
                  <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/rheumatology.svg" alt="Pediatrics">
                  <h6>Rheumatology</h6>
            </div>
             <div class="service2">
                  <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/neurology.svg" alt="Pediatrics">
                  <h6>Neurosurgery</h6>
            </div>
             <div class="service2">
                 <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/radiology.svg" alt="Pediatrics">
                 <h6>Radiology</h6>
            </div>
             <div class="service2 hidden" >
                    <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/plasticsurgery.svg" alt="Pediatrics">
                 <h6>Plastic surgery</h6>
            </div>

             <div class="button-container">
                 <button id="toggleButton">View More</button>
             </div>

             <div class="service2 hidden" >
                    <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/neonatology.svg" alt="Pediatrics">
                    <h6>Neonatology</h6>
            </div>
             <div class="service2 hidden" >
                    <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/vascularsurgery.svg" alt="Pediatrics">
                    <h6>Vascular Surgery</h6>
            </div>
             <div class="service2 hidden" >
                    <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/psychiatry.svg" alt="Pediatrics">
                    <h6>Psychiatry</h6>
            </div>
             <div class="service2 hidden" >
                    <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/dentistry.svg" alt="Pediatrics">
                    <h6>Dentistry</h6>
            </div>
             <div class="service2 hidden" >
                    <img src="https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/ent.svg" alt="Pediatrics">
                    <h6>ENT (Ear, Nose, Throat)</h6>
            </div>
         </div>
            
            




        <script>
            const toggleButton = document.getElementById("toggleButton");
            const hiddenCards = document.querySelectorAll(".service2.hidden");

            toggleButton.addEventListener("click", () => {
                hiddenCards.forEach(card => {
                    card.classList.toggle("hidden");
                });

                // Toggle button text
                if (toggleButton.textContent === "View More") {
                    toggleButton.textContent = "View Less";
                } else {
                    toggleButton.textContent = "View More";
                }
            });
        </script>

       
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

    <footer class="footer">
        <div class="contact-info">
            <h3>Contact Us</h3>
            <p>📞 Emergency: 911</p>
            <p>📞 General: (555) 123-4567</p>
            <p>📍 123 Medical Center Drive</p>
            <p>📧 info@medcare.com</p>
        </div>
    </footer>
    <script>
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const targetId = this.getAttribute('href');
                const targetElement = document.querySelector(targetId);

                if (targetElement) {
                    const offset = 180
                    const elementPosition = targetElement.offsetTop;
                    const offsetPosition = elementPosition - offset;

                    window.scrollTo({
                        top: offsetPosition,
                        behavior: "smooth"
                    });
                }
            });
        });
    </script>

</body>
</html>
