# CS2 ESEA League Stats Dashboard

A **Power BI dashboard** designed to analyze competitive CS2 **ESEA league** matches, teams, and player performance. It provides detailed insights into individual and team metrics across ESEA competitions.

## Features

- **Dimensional model:** Separate tables for players, teams, matches, and stats for efficient analysis.  
- **Custom calculations:** Measures for K/D ratio, win rate, rounds won/lost, and sniper vs. rifle roles.  
- **Filters & slicers:** Slice by division, map, date, or number of matches played.  
- **Interactive visuals:** Matrix, charts, and maps with player and team breakdowns.  
- **Dynamic tooltips & images:** Display team logos, player flags, and clickable links without affecting filtering.  
- **Majority country & French-speaking indicators:** Automatically assess team nationality and presence of French-speaking players.

## Data

The dashboard uses **JSON match stats from ESEA leagues**, parsed and transformed into a star-schema structure in Power BI. Data includes:  

- Match-level stats (scores, maps, rounds)  
- Team-level stats (rounds won/lost, win/loss record)  
- Player-level stats (kills, deaths, headshots, utility usage, sniper/rifle classification)

## Technical Stack 

- Python as ETL
- Supabase as backend for PostgreSQL database
- PowerBI for data viz

## Purpose

This project helps **analysts, coaches, and esports enthusiasts** explore ESEA league performance dynamically, supporting scouting, performance tracking, and strategic planning.

## State of the project : 

Currently running a POC on a sample of matches on an offline dashboard. if successfull dashboard will be available online

## License

MIT License © Armeldt
