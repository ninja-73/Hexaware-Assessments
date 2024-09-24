create database VirtualArtGallery

--Virtual Art Gallery Shema DDL and DML

-- Create the Artists table
CREATE TABLE Artists (
 ArtistID INT PRIMARY KEY,
 Name VARCHAR(255) NOT NULL,
 Biography TEXT,
 Nationality VARCHAR(100))

-- Create the Categories table
CREATE TABLE Categories (
 CategoryID INT PRIMARY KEY,
 Name VARCHAR(100) NOT NULL)

-- Create the Artworks table
CREATE TABLE Artworks (
 ArtworkID INT PRIMARY KEY,
 Title VARCHAR(255) NOT NULL,
 ArtistID INT,
 CategoryID INT,
 Year INT,
 Description TEXT,
 ImageURL VARCHAR(255),
 FOREIGN KEY (ArtistID) REFERENCES Artists (ArtistID),
 FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID))

-- Create the Exhibitions table
CREATE TABLE Exhibitions (
 ExhibitionID INT PRIMARY KEY,
 Title VARCHAR(255) NOT NULL,
 StartDate DATE,
 EndDate DATE,
 Description TEXT)

-- Create a table to associate artworks with exhibitions
CREATE TABLE ExhibitionArtworks (
 ExhibitionID INT,
 ArtworkID INT,
 PRIMARY KEY (ExhibitionID, ArtworkID),
 FOREIGN KEY (ExhibitionID) REFERENCES Exhibitions (ExhibitionID),
 FOREIGN KEY (ArtworkID) REFERENCES Artworks (ArtworkID));

 --DML(Insert sample data to tables)
 -- Insert sample data into the Artists table
INSERT INTO Artists (ArtistID, Name, Biography, Nationality) VALUES
 (1, 'Pablo Picasso', 'Renowned Spanish painter and sculptor.', 'Spanish'),
 (2, 'Vincent van Gogh', 'Dutch post-impressionist painter.', 'Dutch'),
 (3, 'Leonardo da Vinci', 'Italian polymath of the Renaissance.', 'Italian')

-- Insert sample data into the Categories table
INSERT INTO Categories (CategoryID, Name) VALUES
 (1, 'Painting'),
 (2, 'Sculpture'),
 (3, 'Photography')

-- Insert sample data into the Artworks table
INSERT INTO Artworks (ArtworkID, Title, ArtistID, CategoryID, Year, Description, ImageURL) VALUES
 (1, 'Starry Night', 2, 1, 1889, 'A famous painting by Vincent van Gogh.', 'starry_night.jpg'),
 (2, 'Mona Lisa', 3, 1, 1503, 'The iconic portrait by Leonardo da Vinci.', 'mona_lisa.jpg'),
 (3, 'Guernica', 1, 1, 1937, 'Pablo Picasso''s powerful anti-war mural.', 'guernica.jpg')

-- Insert sample data into the Exhibitions table
INSERT INTO Exhibitions (ExhibitionID, Title, StartDate, EndDate, Description) VALUES
 (1, 'Modern Art Masterpieces', '2023-01-01', '2023-03-01', 'A collection of modern art masterpieces.'),
 (2, 'Renaissance Art', '2023-04-01', '2023-06-01', 'A showcase of Renaissance art treasures.')

-- Insert artworks into exhibitions
INSERT INTO ExhibitionArtworks (ExhibitionID, ArtworkID) VALUES
 (1, 1),
 (1, 2),
 (1, 3),
 (2, 2)
 -- 1. Retrieve the names of all artists along with the number of artworks they have in the gallery, and list them in descending order of the number of artworks. select a.name as [Artist Name], count(aw.artistid) as [Number of Artworks]
 from Artists a
 left join Artworks aw on a.ArtistID = aw.ArtistID
 group by aw.ArtistID, a.name
 order by count(aw.artistid) desc

-- 2. List the titles of artworks created by artists from 'Spanish' and 'Dutch' nationalities, and order them by the year in ascending order
select aw.title as [Title of Artwork], a.Nationality
from Artworks aw
join Artists a on a.ArtistID = aw.ArtistID
where a.Nationality in ('Spanish', 'Dutch')
order by aw.Year

-- 3. Find the names of all artists who have artworks in the 'Painting' category, and the number of artworks they have in this category
select a.Name, count(aw.ArtworkID) as [Number of Artworks]
from Artists a
join Artworks as aw on a.ArtistID = aw.ArtistID
join Categories as c on aw.CategoryID = c.CategoryID
where c.Name = 'Painting'
group by a.Name

-- 4. List the names of artworks from the 'Modern Art Masterpieces' exhibition, along with their artists and categories
select aw.title, a.name as [Artist Name], c.name as [Category], e.Title as [Exhibition]
from Artworks aw
join Artists a on a.ArtistID = aw.ArtistID
join Categories c on aw.CategoryID = c.CategoryID
join ExhibitionArtworks eaw on eaw.ArtworkID = eaw.ExhibitionID
join Exhibitions e on e.ExhibitionID = eaw.ExhibitionID
where e.Title = 'Modern art Masterpieces'

-- 5. Find the artists who have more than two artworks in the gallery
select a.ArtistID, a.Name
from Artists a 
join Artworks aw on a.ArtistID = aw.ArtistID
group by a.ArtistID, a.Name
having count(aw.ArtworkID) > 2

-- 6. Find the titles of artworks that were exhibited in both 'Modern Art Masterpieces' and 'Renaissance Art' exhibitions
select aw.Title
from Artworks aw
join ExhibitionArtworks eaw on aw.ArtworkID = eaw.ArtworkID
join Exhibitions e on e.ExhibitionID = eaw.ExhibitionID
where e.Title in ('Modern Art Masterpieces', 'Renaissance Art')
group by aw.ArtworkID, aw.Title
having count(distinct e.Title) = 2

-- 7. Find the total number of artworks in each category
select c.Name, count(aw.ArtworkID)
from Categories c
left join Artworks aw on aw.CategoryID = c.CategoryID
group by aw.CategoryID, c.name

-- 8. List artists who have more than 3 artworks in the gallery
select a.Name
from Artists a
join Artworks aw on a.ArtistID = aw.ArtistID
group by a.ArtistID, a.Name
having count(aw.ArtworkId) > 3

-- 9. Find the artworks created by artists from a specific nationality (e.g., Spanish)
select a.Name, aw.Title, a.Nationality
from Artists a
join Artworks aw on a.ArtistID = aw.ArtistID
where a.Nationality = 'Spanish'

-- 10. List exhibitions that feature artwork by both Vincent van Gogh and Leonardo da Vinci
select e.Title
from Exhibitions e
join ExhibitionArtworks eaw on e.ExhibitionID = eaw.ExhibitionID
join Artworks aw on eaw.ArtworkID = aw.ArtworkID
join Artists a on aw.ArtistID = a.ArtistID
where a.Name in ('Vincent van Gogh', 'Leonardo da Vinci')
group by e.Title, e.ExhibitionID
having count(distinct a.Name) = 2

-- 11. Find all the artworks that have not been included in any exhibition
select aw.ArtworkID
from Artworks aw
where not exists 
(select eaw.ArtworkID 
from ExhibitionArtworks eaw
where aw.artworkID = eaw.ArtworkID)

-- 12. List artists who have created artworks in all available categories
select a.Name
from Artists a
join Artworks aw on a.ArtistID = aw.ArtistID
join Categories c on aw.CategoryID = c.CategoryID
group by a.Name, a.ArtistID
having count(distinct aw.CategoryID) = (select count(c.CategoryID) from Categories c) 

-- 13. List the total number of artworks in each category
select c.Name, count(aw.ArtworkID)
from Categories c
left join Artworks aw on aw.CategoryID = c.CategoryID
group by aw.CategoryID, c.name

-- 14. Find the artists who have more than 2 artworks in the gallery
select a.Name
from Artists a
join Artworks aw on a.ArtistID = aw.ArtistID
group by a.ArtistID, a.Name
having count(aw.ArtworkId) > 2

-- 15. List the categories with the average year of artworks they contain, only for categories with more than 1 artwork
select c.Name, avg(aw.year) as [Average Year]
from Categories c
join Artworks aw on aw.CategoryID = c.CategoryID
group by c.Name
having count(aw.ArtworkID) > 1

-- 16. Find the artworks that were exhibited in the 'Modern Art Masterpieces' exhibitionselect aw.Title
from Artworks aw
join ExhibitionArtworks eaw on aw.ArtworkID = eaw.ArtworkID
join Exhibitions e on eaw.ExhibitionID = e.ExhibitionID
where e.Title = 'Modern Art Masterpieces'

-- 17. Find the categories where the average year of artworks is greater than the average year of all artworks
select c.Name
from Categories c
join Artworks aw on c.CategoryID = aw.CategoryID
group by c.Name
having avg(year) > (select avg(year) from Artworks)

-- 18. List the artworks that were not exhibited in any exhibition
select aw.ArtworkID
from Artworks aw
where not exists 
(select eaw.ArtworkID 
from ExhibitionArtworks eaw
where aw.artworkID = eaw.ArtworkID)

-- 19. Show artists who have artworks in the same category as "Mona Lisa"
select a.Name
from Artists a
join Artworks aw on a.ArtistID = aw.ArtistID
join Categories c on aw.CategoryID = c.CategoryID
where c.Name = (select c1.name from categories c1
join artworks aw1 on c1.categoryID = aw1.categoryID where aw1.Title = 'Mona Lisa')

-- 20. List the names of artists and the number of artworks they have in the gallery
select a.Name, count(aw.artworkID) as [Number of Artworks]
from Artists a
join Artworks aw on a.ArtistID = aw.ArtistID
group by a.Name

