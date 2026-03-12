# 🐱‍👤 Pokédex

Web development has multiple applications for users. Due to the growth of the entertainment industry, there has been an increase in the number of customers in the video game sector. Because of this, there is a high demand for websites that display relevant information. Pokémon has been one of the most prominent video games in the industry, with Nintendo owning the franchise and positioning itself as one of the leading producers.

## ✨ Features

- 🔒 **Authentication and Registration:** Users can create accounts and log in securely.
- 👥 **User Roles:**
    - 🏆 **Trainer:** Manages their Pokémon team, challenges other trainers, and communicates with them.
    - ⚙️ **Administrator:** Manages the Pokédex and system users.
    - 🩺 **Nurse:** Handles users' Pokémon care requests.
- 📚 **Pokédex:** Interactive database with detailed information on each Pokémon.
- 💬 **Messaging and Battle Challenges:** System for trainers to communicate and challenge each other in battles.

## 🛠️ Technologies Used

- 🎨 **Frontend**: CSS, HTML, JavaScript
- 💻 **Backend**: C#
- 🧱 **Frameworks**: ASP.Net Core, Bootstrap
- 🗄️ **Database**: MySQL
- 🌐 **Server**: IIS Express
- 🔂 **Version Control**: Git

## ⚙️ Installation

### 📋 Prerequisites

- 🛢️ [MySQL](https://www.mysql.com/products/workbench/)
- 💻 [VSCode](https://visualstudio.microsoft.com/es/downloads/)

### 🔧 Setup

1. 📥 Clone the repository:

    ```bash
    git clone https://github.com/Crisrod0912/Pokedex.git
    ```

2. 🗃️ Set up the Microsoft SQL Server database:

   - Open **MySQL Workbench**.
   - Create a new database called `pokedex`.
   - Import the provided SQL file `pokedex.sql` into the `pokedex` database using your server.

3. ⚙️ Configure the project:

    ```appsettings.json

    "ConnectionStrings": {
        "DefaultConnection": "Server=localhost;Port=3306;Database=pokedex;User=root;Password=your_password_here;"
    },

    ```

    Ensure the MySQL credentials and database name match your local setup.

4. ▶️ Start the IIS Express Server:

    - Open the project on **Visual Studio 2022** and click on "IIS Express".

5. 🌐 Access the Pokédex in your browser.

> [!NOTE]
> **Project Owner / Developer** 🧑🏻‍💻  
>- Cristopher Rodríguez Fernández 
***
