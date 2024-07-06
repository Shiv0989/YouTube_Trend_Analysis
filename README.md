# YouTube Trend Analysis (Using Snowflake and Azure)

![youtube-users](https://github.com/Shiv0989/YouTube_Trend_Analysis/assets/83575973/1db9e564-6b6c-4642-9dcb-91e336ca57f6)

## Overview
This project focuses on analyzing YouTube trending videos data using a Data Lakehouse approach with Snowflake, integrated with Microsoft Azure. The goal is to uncover trends and draw insights from YouTube data across various countries.

## Data Collection and Description
### YouTube Trending Videos Data
- Contains daily trending videos from 11 countries, including data on views, likes, dislikes, comments, and more.

### Category ID Data
- JSON files containing category IDs and titles for each country.

## Data Warehouse Design
Implemented a four-layer architecture: Raw, Staging, Warehouse, and Datamart.

### Raw Layer
- Uploaded data to Azure Storage, connected with Snowflake, and created external tables.

### Staging Layer
- Created dimension tables (e.g., video details, category details) and a fact table to establish a star schema.

### Warehouse Layer
- Joined dimension tables with the fact table to form a comprehensive star schema.

### Datamart Layer
- Designed tables to answer business questions, providing insights into video performance, category popularity, and trends.

## Data Processing and Integration
### Snowflake Setup
- Set up Snowflake databases and tables to handle and process the YouTube data.
- Created external tables in the Raw layer and transformed data into staging tables.

### Fact and Dimension Tables
- Created staging tables to organize data from raw tables.
- Formulated fact and dimension tables to establish a star schema in the Warehouse layer.

## Business Questions and Insights
1. **Top Viewed Videos:** Identified the top 3 most viewed videos in the "Sports" category for a specific trending date.
2. **Popular Keywords:** Counted and ranked videos with specific keywords like 'BTS'.
3. **Most Viewed Videos by Country and Month:** Analyzed the most viewed videos per country and calculated like ratios.
4. **Category Popularity:** Determined the categories with the most distinct videos across countries.
5. **Optimal Content Creation:** Suggested categories for launching new YouTube channels based on trend analysis.

## Ad-Hoc Analysis
- **Video Performance Analysis:** Investigated the performance of videos based on views, likes, dislikes, and comments.
- **Category Trend Analysis:** Analyzed the popularity and performance of different video categories over time.

## Conclusion
This project effectively utilized Snowflake and Azure to manage and analyze large datasets, providing valuable insights into YouTube trends. The analysis demonstrated how data-driven decisions could guide strategic content creation on YouTube.

## How to Run
1. **Set up Azure Storage:** Upload the datasets to your Azure Storage account.
2. **Configure Snowflake:** Set up your Snowflake account and create the necessary databases and tables.
3. **Data Loading:** Load data into Snowflake using the provided scripts.
4. **Run the ETL Process:** Execute the ETL scripts to transform data and create the star schema.
5. **Perform Analysis:** Use the provided notebooks and scripts to perform ad-hoc analysis and answer business questions.

## Dependencies
- Microsoft Azure Storage
- Snowflake
