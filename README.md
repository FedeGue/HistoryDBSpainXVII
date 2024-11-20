# HistoryDBSpainXVII
# db history

## Overview

This repository contains a relational database designed to preserve and analyze historical documents from the early modern period. It aims to facilitate research and provide accessible resources for scholars and history-enthusiasts. The idea starts from my PhD project.
The database contains documentation referring to the first half of the 17th century, with a main geographical focus on the Italian regions (Kingdom of Naples, Kingdom of Sicily, Duchy of Milan) under Spanish—or rather, Habsburg—control. This project aims to understand the influence of religion, theological discussions, and Catholic norms on public fiscal life. Therefore, the project relates to the Thirty Years' War, and in addition to archival documentation, I will examine theological and juridical literature.
## Lang:
the Main laguage is english, but for specific details/names/political roles and in general specific spanish concepts, I will use the spanish, or italian if the case.


Spanish version: 
La base de datos contiene documentación referente a la primera mitad del siglo XVII, con un enfoque geográfico principal en las regiones italianas (el Reino de Nápoles, el Reino de Sicilia, el Ducado de Milán) bajo el control español, o mejor dicho, de los Habsburgo. Este proyecto tiene como objetivo comprender la influencia de la religión, las discusiones teológicas y las normas católicas en la vida fiscal pública. Por lo tanto, el proyecto está relacionado con la Guerra de los Treinta Años, y además de la documentación archivística, examinaré la literatura teológica y jurídica.

## Features --- Section under construction

- **Structured Data**: The database is organized into multiple tables, each representing different aspects of historical documentation, including:
  - "documents": Contains various types of documents (e.g., letters, consultas) with dates, writers and receivers, the title of the doc, the language of the doc and the genre.
  - "persons": all the relevant data about the personages that live in my database.
  - "kings": a sub-table kind-of-thing that refere to the persons_table. Not daughter table because that didn't work. 
  - "persons_documents": this is a link-table between the docs and the people that people that appears in the docs.
  - "institutions": The monarchy's institutions: consejos, ministerios, etc.
  - "tags": the doc and treatises arguments: more generic like war, debts, and more specifics like "asientos".
  - "tag-doc": link-table, essential for the normalization. 
  - 
  - `archive_series`: Represents series of archival documents, providing context and linkage between records.

- **Data Relationships**: Tables are interconnected, allowing for complex queries and analysis of historical trends and relationships.

### Prerequisites

To work with this database, you will need:

- PostgreSQL installed on your machine.
- Basic knowledge of SQL and relational database concepts.
- Intermediate or, better, advanced historical knowledge.


----NDR
I intend to upload every significant db alteration. This is clearly a work-in-progress type of thing, but I'll try to make something replicable. In any case, if this kind of word tickles your imagination but you think you don't have the right historical knowledge, feel free to contact me! 

### HistoryScratch:
This folder is for my test database. Here I'm gonna put all the code that didn't work for my purpose. Obv I'm not putting all the errors and thinking, and crying but just the "clean" code with the "I don't really like it" motivations. 


  


