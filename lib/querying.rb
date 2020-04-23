def select_books_titles_and_years_in_first_series_order_by_year
# "SELECT title, year
# FROM books
# ORDER BY year ASC"; #wrong

"SELECT books.title, books.year 
 FROM books 
 JOIN series on books.series_id = series.id 
 WHERE books.series_id = 1 
 ORDER by books.year";
 end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto
  FROM characters 
  ORDER BY motto limit 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, count(species) FROM characters 
   GROUP BY species 
   ORDER BY count(species) desc limit 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors
  JOIN series on series.author_id = authors.id 
  JOIN subgenres on series.subgenre_id = subgenres.id";
end

def select_series_title_with_most_human_characters
  "SELECT series.title 
  FROM series
  JOIN books on books.series_id = series.id 
  JOIN character_books on character_books.book_id
  JOIN characters on character_books.character_id = characters.id
  WHERE characters.species = 'human' group by series.title order by count(*) desc limit 1";
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(*) 
   FROM character_books 
   JOIN characters on character_books.character_id = characters.id 
   GROUP by characters.name order by count(*) desc";
end
