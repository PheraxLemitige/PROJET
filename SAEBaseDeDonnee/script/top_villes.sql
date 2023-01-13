CREATE OR REPLACE FUNCTION affichage_top_villes()
returns void as $$

DECLARE

    ligne record;
    place int;
    nom_ville ville.Vnom%type;

BEGIN
    place = 1;
    for ligne in select * from classement_villes ORDER BY ville_pts DESC
    LOOP
        SELECT Vnom INTO nom_ville FROM ville WHERE id_ville = ligne.id_ville;
        raise notice 'A la place % il y a le ville % avec % de points', place, nom_ville, ligne.ville_pts;
        place = place + 1;
    END LOOP;
END;
$$
language plpgsql;
