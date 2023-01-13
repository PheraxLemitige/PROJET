CREATE OR REPLACE FUNCTION affichage_top_joueurs()
returns void as $$

DECLARE

    ligne record;
    place int;
    nom_joueur joueur.Jnom%type;
    prenom_joueur joueur.Jprenom%type;

BEGIN
    place = 1;
    for ligne in select * from classement_joueurs ORDER BY joueur_pts DESC
    LOOP
        SELECT Jnom INTO nom_joueur FROM joueur WHERE id_joueur = ligne.id_joueur;
        SELECT Jprenom INTO prenom_joueur FROM joueur WHERE id_joueur = ligne.id_joueur;
        raise notice 'A la place % il y a le joueur % % avec % de points', place, nom_joueur, prenom_joueur, ligne.joueur_pts;
        place = place + 1;
    END LOOP;
END;
$$
language plpgsql;
