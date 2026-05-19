WITH cols_stage AS (
    SELECT
        table_name,
        column_name,
        data_type,
        character_maximum_length,
        numeric_precision,
        numeric_scale,
        is_nullable
    FROM information_schema.columns
    WHERE table_schema = 'stage'
      AND table_name = 'hm_d300_00_r06'
),
cols_base AS (
    SELECT
        table_name,
        column_name,
        data_type,
        character_maximum_length,
        numeric_precision,
        numeric_scale,
        is_nullable
    FROM information_schema.columns
    WHERE table_schema = 'base'
      AND table_name = 'hm_d300_00_r29'
)
SELECT
    COALESCE(a.table_name, 'stage.hm_d300_00_r06') AS stage_table,
    COALESCE(b.table_name, 'base.hm_d300_00_r29') AS base_table,
    COALESCE(a.column_name, b.column_name) AS column_name,
    COALESCE(
        a.data_type ||
        COALESCE('(' || a.character_maximum_length || ')', '') ||
        COALESCE('(' || a.numeric_precision || ',' || a.numeric_scale || ')', ''),
        'NULL'
    )
    || ' \\ ' ||
    COALESCE(
        b.data_type ||
        COALESCE('(' || b.character_maximum_length || ')', '') ||
        COALESCE('(' || b.numeric_precision || ',' || b.numeric_scale || ')', ''),
        'NULL'
    ) AS type_difference,
    COALESCE(a.is_nullable, 'NULL')
    || ' \\ ' ||
    COALESCE(b.is_nullable, 'NULL') AS null_difference
FROM cols_stage a
FULL OUTER JOIN cols_base b
    ON a.column_name = b.column_name
WHERE
       a.column_name IS NULL
    OR b.column_name IS NULL
    OR a.data_type <> b.data_type
    OR COALESCE(a.character_maximum_length, -1)
       <> COALESCE(b.character_maximum_length, -1)
    OR COALESCE(a.numeric_precision, -1)
       <> COALESCE(b.numeric_precision, -1)
    OR COALESCE(a.numeric_scale, -1)
       <> COALESCE(b.numeric_scale, -1)
    OR a.is_nullable <> b.is_nullable
ORDER BY column_name;
