<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="hospital_management.homePage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@ViewData["Title"]</title>
    <style>
        /* Base styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #1A3E5D; /* Primary dark color */
            background-color: #F9F9F9; /* Lightest background color */
        }

        header {
            background-color: #1A3E5D; /* Dark header color */
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        header .logo img {
            height: 50px;
        }

        header nav {
            display: flex;
            gap: 20px;
        }

        header nav a {
            text-decoration: none;
            color: #F9F9F9; /* White text on dark background */
            font-weight: bold;
        }

        header nav a:hover {
            color: #A3D6D9; /* Soft teal hover effect */
        }

        .hero {
            text-align: center;
            padding: 50px 20px;
            background-color: #4B8DA8; /* Vibrant teal for hero */
            color: #F9F9F9; /* White text */
        }

        .hero h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        .hero .cta-btn {
            display: inline-block;
            background-color: #E1F6F4; /* Light teal for button */
            color: #1A3E5D; /* Dark text on light button */
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .hero .cta-btn:hover {
            background-color: #A3D6D9; /* Slightly darker teal on hover */
        }

        .team {
            background-color: #E1F6F4; /* Soft background for the team section */
            padding: 40px 20px;
            text-align: center;
        }

        .team h2 {
            color: #1A3E5D;
            margin-bottom: 20px;
        }

        .team .profiles {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .team .profile {
            background-color: #F9F9F9; /* Light background for profile cards */
            border: 2px solid #A3D6D9; /* Border matches the palette */
            border-radius: 50%;
            overflow: hidden;
            width: 150px;
            height: 150px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        footer {
            background-color: #1A3E5D; /* Dark footer color */
            color: #F9F9F9; /* White text */
            text-align: center;
            padding: 15px 0;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <img src="heritage-logo.png" alt="Heritage Hospitals Logo">
        </div>
        <nav>
            <a href="/">Home</a>
            <a href="/About">About</a>
            <a href="/Services">Services</a>
            <a href="/Careers" class="active">Careers</a>
            <a href="/Contact">Contact Us</a>
        </nav>
    </header>

    <section class="hero">
        <h1>Explore a world of opportunities with us</h1>
        <p>Explore openings in the burgeoning healthcare space with us.</p>
        <a href="/Careers/Openings" class="cta-btn">View all openings</a>
    </section>

    <section class="team">
        <h2>Meet Our Team</h2>
        <div class="profiles">
            <div class="profile">
                <img src="team1.jpg" alt="Team Member 1" />
            </div>
            <div class="profile">
                <img src="team2.jpg" alt="Team Member 2" />
            </div>
            <div class="profile">
                <img src="team3.jpg" alt="Team Member 3" />
            </div>
            <div class="profile">
                <img src="team4.jpg" alt="Team Member 4" />
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Heritage Hospitals. All Rights Reserved.</p>
    </footer>
</body>
</html>
