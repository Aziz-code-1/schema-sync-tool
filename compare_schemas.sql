WITH common_tables AS (
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'schema_a'
    INTERSECT
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'schema_b'
),
cols_a AS (
    SELECT table_name, column_name, data_type, character_maximum_length, is_nullable
    FROM information_schema.columns
    WHERE table_schema = 'schema_a'
),
cols_b AS (
    SELECT table_name, column_name, data_type, character_maximum_length, is_nullable
    FROM information_schema.columns
    WHERE table_schema = 'schema_b'
)
SELECT 
    a.table_name,
    a.column_name,
    a.data_type || COALESCE('(' || a.character_maximum_length || ')', '') 
    AS schema_a_type,
    b.data_type || COALESCE('(' || b.character_maximum_length || ')', '') 
    AS schema_b_type,
    CASE WHEN a.is_nullable = 'YES' THEN 'null' ELSE 'not null' END AS schema_a_null,
    CASE WHEN b.is_nullable = 'YES' THEN 'null' ELSE 'not null' END AS schema_b_null
FROM cols_a a
JOIN cols_b b
    ON a.table_name = b.table_name
   AND a.column_name = b.column_name
JOIN common_tables t
    ON a.table_name = t.table_name
WHERE 
    a.data_type <> b.data_type
 OR COALESCE(a.character_maximum_length, -1) 
    <> COALESCE(b.character_maximum_length, -1)
 OR a.is_nullable <> b.is_nullable;
