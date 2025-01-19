<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="hospital_management.homePage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MedCare Hospital</title>
    <link rel="stylesheet" href="StyleSheet/maincss.css">
    <link rel="stylesheet" href="StyleSheet/headercss.css">
    <link rel="stylesheet" href="StyleSheet/herocss.css">
    <link rel="stylesheet" href="StyleSheet/servicecss.css">
    <link rel="stylesheet" href="StyleSheet/doctorscss.css">
</head>
<body>
    <header class="header">
        <div class="logo">
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
        </div>
    </section>

    <section id="doctors" class="doctors">
        <h2>Our Doctors</h2>
        <div class="doctors-grid">
            <div class="doctor-card">
                <img src="https://placehold.co/200x200" alt="Dr. Smith">
                <h3>Dr. Smith Sarah</h3>
                <p>Cardiologist</p>
            </div>
            <div class="doctor-card">
                <img src="https://placehold.co/200x200" alt="Dr. Michael">
                <h3>Dr. Michael Johnson</h3>
                <p>Neurologist</p>
            </div>
            <div class="doctor-card">
                <img src="https://placehold.co/200x200" alt="Dr. Emily">
                <h3>Dr. Emily Williams</h3>
                <p>Pediatrician</p>
            </div>
            <div class="doctor-card">
                <img src="https://placehold.co/200x200" alt="Dr. Mickey">
                <h3>Dr. Mickey Williams</h3>
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
</body>
</html>
