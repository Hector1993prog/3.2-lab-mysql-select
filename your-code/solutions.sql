CREATE TABLE "Challenge_1" AS SELECT A.au_id as "AUTHOR ID", 
A.au_lname as "LAST NAME", A.au_fname as "FIRST NAME", T.title as "TITLE", P.pub_name as "PUBLISHER"
from authors A INNER JOIN titleauthor TI 
on A.au_id =TI.au_id INNER JOIN titles T
on TI.title_id = T.title_id INNER JOIN publishers P 
on T.pub_id =P.pub_id ;
-- Traducción al lenguaje "humano": Seleccioname estas columnas con estos nombres, desde la uníon
-- de las tablas autores con titulos de autores mediante el id del autor, de títulos mediante el id del título,y de editoriales con la id de la editorial.

SELECT COUNT() FROM Chanlenge_1  

SELECT COUNT() FROM titleauthor


CREATE TABLE  "Chanlenge_2" AS SELECT A.au_id as "AUTHOR ID",
A.au_lname as "LAST NAME",
A.au_fname as "FIRST NAME", 
P.pub_name as "PUBLISHER", COUNT(T.title) as "NUMBER OF TITLES" 
from authors A INNER JOIN titleauthor TI 
on A.au_id =TI.au_id INNER JOIN titles T
on TI.title_id = T.title_id INNER JOIN publishers P 
on T.pub_id =P.pub_id
GROUP BY PUBLISHER, "AUTHOR ID";

CREATE TABLE "Challenge_3" AS SELECT A.au_id as "AUTHOR ID", 
A.au_lname as "LAST NAME", 
A.au_fname as "FIRST NAME", 
SUM(S.qty) AS "TOTAL" FROM
authors A INNER JOIN titleauthor TI 
ON "AUTHOR ID"= TI.au_id INNER JOIN sales S 
ON TI.title_id= S.title_id
GROUP BY "AUTHOR ID"
ORDER BY "TOTAL" DESC
LIMIT 3;

CREATE TABLE "Challenge_4" AS SELECT A.au_id as "AUTHOR ID", 
A.au_lname as "LAST NAME", 
A.au_fname as "FIRST NAME",COALESCE  
(SUM(S.qty), 0) AS "TOTAL" FROM
authors A LEFT JOIN titleauthor TI 
ON "AUTHOR ID"= TI.au_id LEFT JOIN sales S 
ON TI.title_id= S.title_id
GROUP BY "AUTHOR ID" 
ORDER BY "TOTAL" DESC;



