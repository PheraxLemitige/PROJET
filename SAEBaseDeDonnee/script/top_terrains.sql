CREATE OR REPLACE FUNCTION affichage_top_terrains()
returns void as $$

DECLARE

    ligne record;
    place int;
    nom_terrain terrain.Tnom%type;

BEGIN
    place = 1;
    for ligne in select * from classement_terrains ORDER BY terrain_pts DESC
    LOOP
        SELECT Tnom INTO nom_terrain FROM terrain WHERE id_terrain = ligne.id_terrain;
        raise notice 'A la place % il y a le terrain % avec % de points', place, nom_terrain, ligne.terrain_pts;
        place = place + 1;
    END LOOP;
END;
$$
language plpgsql;
