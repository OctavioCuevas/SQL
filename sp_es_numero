CREATE OR ALTER procedure es_numero (
    V_CARACTER char(1))
returns (
    SI_NO char(1))
as
BEGIN
    SELECT
    CASE CAST(:V_caracter AS char)
         WHEN '0' then 'S'
         WHEN '1' then 'S'
         WHEN '2' then 'S'
         WHEN '3' then 'S'
         WHEN '4' then 'S'
         WHEN '5' then 'S'
         WHEN '6' then 'S'
         WHEN '7' then 'S'
         WHEN '8' then 'S'
         WHEN '9' then 'S'
         ELSE 'N'
    END
    FROM rdb$database
    INTO :si_no;
    SUSPEND;
END
