-- Delete entry from a table

DELETE FROM `shop`
WHERE `name` = 'Aldi';

-- Ignore errors while deleting

DELETE IGNORE FROM `shop`
WHERE `name` IN ('Rimi', 'Aldi');
