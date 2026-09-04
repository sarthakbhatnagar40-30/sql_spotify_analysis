# Insights from Spotify Dataset 



## Dataset
This project uses [Spotify Dataset on Kaggle](https://www.kaggle.com/datasets/sanjanchaudhari/spotify-dataset)
## Overview

This project involves analyzing a Spotify dataset with various attributes about tracks, albums, and artists using SQL. It covers an end-to-end process of normalizing a denormalized dataset, performing SQL queries of varying complexity (easy, medium, and advanced), and optimizing query performance. The primary goals of the project are to practice advanced SQL skills and generate valuable insights from the dataset.
## Practice Question
1. Retrieve the names of all tracks that have more than 1 billion streams.
---
2. List all albums along with their respective artists.
---
3. Get the total number of comments for tracks where licensed = TRUE.
---
4. Find all tracks that belong to the album type single.
---
5. Count the total number of tracks by each artist.
---
6. Calculate the average danceability of tracks in each album.
---
7. Find the top 5 tracks with the highest energy values.
---
8. List all tracks along with their views and likes where official_video = TRUE.
---
9. For each album, calculate the total views of all associated tracks.
---
10. Retrieve the track names that have been streamed on Spotify more than YouTube.
---
11. Find the top 3 most-viewed tracks for each artist using window functions.
---
12. Write a query to find tracks where the liveness score is above the average.
---
13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
---
14. Find tracks where the energy-to-liveness ratio is greater than 1.2.
---
15. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions
## Query Optimization Technique

To improve query performance, we carried out the following optimization process:

- **Initial Query Performance Analysis Using** `EXPLAIN`

    - We began by analyzing the performance of a query using the EXPLAIN function.
    - The query retrieved tracks based on the `artist` column, and the performance metrics were as follows:
        - Execution time (E.T.): **5 ms**
        - Planning time (P.T.): **0.096 ms**
    - Below is the **screenshot** of the `EXPLAIN` result before optimization:

- **Index Creation on the `artist` Column**
    - To optimize the query performance, we created an index on the `artist` column. This ensures faster retrieval of rows where the artist is queried.
    - **SQL command** for creating the index:
      ```sql
      create index artist_index on spotify (artist);
      ```

- **Performance Analysis After Index Creation**
    - After creating the index, we ran the same query again and observed significant improvements in performance:
        - Execution time (E.T.): **0.079 ms**
        - Planning time (P.T.): **0.130 ms**
    - Below is the **screenshot** of the `EXPLAIN` result after index creation:

This optimization shows how indexing can drastically reduce query time, improving the overall performance of our database operations in the Spotify project.


## Technology Stack

- **Database**: PostgreSQL
- **SQL Queries**: DDL, DML, Aggregations, Joins, Subqueries, Window Functions
- **Tools**: pgAdmin 4 (or any SQL editor), PostgreSQL (via Homebrew, Docker, or direct installation)

## How to Run the Project
1. Install PostgreSQL and pgAdmin.
2. Set up the database schema and tables using the provided normalization structure.
3. Insert the sample data into the respective tables.
4. Execute SQL queries to solve the listed problems.
5. Explore query optimization techniques for large datasets.
## Authors

- [@sarthakbhatnagar40-30](https://github.com/sarthakbhatnagar40-30)


## 🔗 Links
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/sarthak-bhatnagar-764470360/)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:sarthak.bhatnagar40@gamil.com)

