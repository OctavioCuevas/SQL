CREATE OR ALTER procedure DSA_FOLIO_SIN_JUST (
    V_FOLIO FOLIO_TYPE)
returns (
    folio_sin_just FOLIO_TYPE)
as
BEGIN
    /* Este procedimiento almacenado es para obtener un folio sin justificar
        (Por ejemplo: 'F00000015' => 'F15')*/
    SELECT
    CASE (SELECT si_no FROM dsa_es_numero(SUBSTRING(:V_FOLIO FROM 1 FOR 1)))
        WHEN 'S' THEN CAST(:V_FOLIO AS INTEGER)
        ELSE CASE (SELECT si_no
                FROM dsa_es_numero(SUBSTRING(:V_FOLIO FROM 2 FOR 1)))
                WHEN 'S'
                    THEN SUBSTRING(:V_FOLIO FROM 1 FOR 1)
                    || CAST(SUBSTRING(:V_FOLIO FROM 2 FOR 8) AS INTEGER)
                ELSE CASE (SELECT si_no
                        FROM dsa_es_numero(SUBSTRING(:V_FOLIO FROM 3 FOR 1)))
                        WHEN 'S' THEN SUBSTRING(:V_FOLIO FROM 1 FOR 2)
                        || CAST(SUBSTRING(:V_FOLIO FROM 3 FOR 8) AS INTEGER)
                        ELSE SUBSTRING(:V_FOLIO FROM 1 FOR 3)
                        || CAST(SUBSTRING(:V_FOLIO FROM 4 FOR 8) AS INTEGER)
                     END
             END
    END
    FROM rdb$database
    INTO :folio_sin_just;
    SUSPEND;
END
