CREATE OR REPLACE FUNCTION affichage_top_armes()
returns void as $$

DECLARE

    ligne record;
    place int;
    nom_arme arme.Anom%type;

BEGIN
    place = 1;
    for ligne in select * from classement_armes ORDER BY arme_pts DESC
    LOOP
        SELECT Anom INTO nom_arme FROM arme WHERE id_arme = ligne.id_arme;
        raise notice 'A la place % il y a l arme % avec % de points', place, nom_arme, ligne.arme_pts;
        place = place + 1;
    END LOOP;
END;
$$
language plpgsql;
