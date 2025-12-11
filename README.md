### Review Demon — Database Project

Review Demon is a mini music-review platform designed for my programming class. This repo contains the MySQL database schema + data that powers the app, along with an ER diagram that shows how everything fits together.

The goal:

🎵 store users, their reviews, ratings, and music metadata

📝 keep everything relational and clean

🫂 promote community with friendships and threads

## 📌 What’s Inside

reviewdemon.sql — full SQL dump (tables + sample data)

ER-Diagram-ReviewDemon.jpeg — entity-relationship diagram

## 🧠 Database Overview

The schema includes:

### Users

Stores account information for the people using the platform.

### Friendships

Stores the relationship between two users and if they have blocked eachother.

### Artists 

Stores artist data and contains an external link to a merch website.

### Albums 

Stores album data and genre(s).

### Songs 

Stores song data and genre(s).

### Events 

Stores event information.

### Tags

Stores a genre tag for a particular song or album. 

### Threads 

Stores the creation of a thread regarding an artist, song, or event.

### Comments

Stores child comments for the parent thread. 

## 📊 ER Diagram

The ER diagram clearly displays the relationships between each aforementioned table, and how they are able to effect one another. 


## 🛠️ Example Queries

-- Get all reviews for a song

`SELECT r.rating, r.review_text, u.username
FROM Reviews r
JOIN Users u ON r.user_id = u.user_id
WHERE r.song_id = 2;`

-- Top-rated songs

`SELECT s.title, AVG(r.rating) AS avg_rating
FROM Songs s
JOIN Reviews r ON s.song_id = r.song_id
GROUP BY s.title
ORDER BY avg_rating DESC;`

## ✨ Notes

This project was built for learning relational design, SQL querying, and schema creation.

All data in this repo is sample/demo data — no sensitive information.

Feel free to clone and run your own queries!
