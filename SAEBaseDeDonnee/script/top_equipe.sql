CREATE OR REPLACE FUNCTION affichage_top_equipes()
returns void as $$

DECLARE

    ligne record;
    place int;
    nom_equipe equipe.Enom%type;

BEGIN
    place = 1;
    for ligne in select * from classement_equipes ORDER BY equipe_pts DESC
    LOOP
        SELECT Enom INTO nom_equipe FROM equipe WHERE id_equipe = ligne.id_equipe;
        raise notice 'A la place % il y a l equipe % avec % de points', place, nom_equipe, ligne.equipe_pts;
        place = place + 1;
    END LOOP;
END;
$$
language plpgsql;
