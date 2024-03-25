--part2 q8
DELETE FROM table_youtube_final
WHERE table_youtube_final.id IN (SELECT table_youtube_duplicates.id FROM table_youtube_duplicates);