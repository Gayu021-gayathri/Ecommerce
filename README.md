# Project Name

Brief description of what the project does.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)


## Introduction

Transforming your virtual presence into a thriving marketplace, an ecommerce website serves as your online storefront, seamlessly connecting buyers with sellers.
It's the dynamic platform where your products take center stage, enticing online shoppers to explore, select, and purchase. 
Your website functions as the digital equivalent of product shelves, knowledgeable sales staff, and efficient cash register, enabling seamless transactions and fostering a vibrant online business ecosystem.

## Features

User Accounts: Allow users to create accounts to save preferences, and manage personal information.
Security update : passwords are hashed
Shopping Cart: Enable users to add products to a virtual shopping cart for easy checkout and purchase.
Responsive Design: Ensure the website is optimized for various devices and screen sizes, providing a seamless user experience across desktops, tablets, and smartphones.

## Installation

Follow these steps to set up the project:

1. **Clone the Repository**: Clone the project repository to your local machine's web server directory (e.g., `wwwroot` in Windows or `/var/www` in Linux):
    ```bash
    git clone https://github.com/Gayu021-gayathri/Ecommerce.git
    ```

2. **Start ColdFusion Service**: Ensure that the ColdFusion service is running on your local machine.

3. **Run Database Scripts**: Execute the database scripts provided in the `dbscript/ecommerce.sql` file to create the necessary database schema.

4. **Access the Website**: Open your preferred web browser and navigate to the root folder of the project using the respective port address. For example:
    ```
    http://127.0.0.1:8500/ecommerce/
    ```





DataBase Setup in cfadmin

1) Run the scripts in "dbScripts\ecommerce.sql".
2) Add datasource "ecommerce" in coldfusion administration.

