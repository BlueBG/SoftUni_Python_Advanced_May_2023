DROP FUNCTION IF EXISTS fn_stadium_team_name(VARCHAR(30));

CREATE OR REPLACE FUNCTION fn_stadium_team_name(stadium_name VARCHAR(30))
RETURNS TABLE (team_name VARCHAR)
AS
$$
    DECLARE
        team_name VARCHAR(30);
    BEGIN
        RETURN QUERY
        SELECT
            t.name
        FROM
            teams AS t
        JOIN
            stadiums AS s
        ON
            s.id = t.stadium_id
        WHERE
            s.name = stadium_name
        ORDER BY
            t.name ASC;



    END;
$$ LANGUAGE plpgsql;

