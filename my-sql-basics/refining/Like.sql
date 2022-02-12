-- filtering data using LIKE clause. 
--data for all the slected items will be there in which author_fname starts with "da"
select
  title,
  author_fname
from
  books
where
  author_fname like "da%";

--data for all the slected items will be there in which author_fname ends with "da"
select
  title,
  author_fname
from
  books
where
  author_fname like "%da";

--data for all the slected items will be there in which author_fname anywhere have "da" within string.
select
  title,
  author_fname
from
  books
where
  author_fname like "%da%";