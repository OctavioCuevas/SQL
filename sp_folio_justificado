CREATE OR ALTER procedure DSA_FOLIO_JUST (
    V_CONSECUTIVO ENTERO,
    V_SERIE varchar(3))
returns (
    folio_just FOLIO_TYPE)
as
BEGIN
    /* Este procedimiento almacenado es para obtener un folio justificado
        (Por ejemplo: 'F15' => 'F00000015')*/
    SELECT IIF(:v_serie = '@','',:v_serie) ||
            TRIM(CASE CHAR_LENGTH (:v_consecutivo || IIF(:v_serie = '@','',:v_serie))
            WHEN 1 THEN '00000000'
            WHEN 2 THEN '0000000'
            WHEN 3 THEN '000000'
            WHEN 4 THEN '00000'
            WHEN 5 THEN '0000'
            WHEN 6 THEN '000'
            WHEN 7 THEN '00'
            WHEN 8 THEN '0'
            ELSE ''
        END) || :v_consecutivo
    FROM rdb$database
    INTO :folio_just;
    SUSPEND;
END
