/* Procédure d'actualisation du classement */
CREATE OR REPLACE FUNCTION actualisation_clas_joueur(id_jou joueur.id_joueur%type, classpts INTEGER)
returns void as $$

DECLARE
    /* Une variable contenant les pts actuels du joueurs, permettant l'actualisation */
    pts classement_joueurs.joueur_pts%type;

BEGIN
    /* On selectionne ses pts, on y ajoute la nouvelle valeur (celle en paramètres) */
    SELECT joueur_pts into pts  FROM classement_joueurs where id_joueur=id_jou ;
    pts=pts+classpts;
    UPDATE classement_joueurs
    SET joueur_pts = pts
    where id_joueur=id_jou;  
END;
$$
language plpgsql;



/* Procédure appelee par le TRIGGER */

CREATE OR REPLACE FUNCTION actu_class_joueur()
returns trigger as $$

DECLARE
    /* Id joueurs */
    id_jou_gagnant Eliminer.id_joueur%type;
    id_jou_vaincue Eliminer.id_joueur_1%type;
    /* Id équipes */
    id_equi_jou_gagnant joueur.id_equipe%type;
    id_equi_jou_vaincue joueur.id_equipe%type;
    /* Pts à changer dans le classement */
    pts_jou_gagnant int;
    pts_jou_vaincue int;

BEGIN
    /*Ici on récupère l'id des joueurs et l'id de leur équipe */
    id_jou_gagnant=new.id_joueur;
    id_jou_vaincue=new.id_joueur_1;
    SELECT id_equipe into id_equi_jou_gagnant from joueur where id_jou_gagnant=id_joueur;
    SELECT id_equipe into id_equi_jou_vaincue from joueur where id_jou_vaincue=id_joueur;

    /*Ici, on va vérifier s'il sont de la même équipe (-1 pts pour le 'gagnant') 
    ou s'ils sont d'une équipe différente (+1pts pour le 'gagnant')
    Le joueur vaincue perd quoi qu'il arrive 1pts */
    pts_jou_vaincue=-1;
    IF id_equi_jou_gagnant=id_equi_jou_vaincue THEN
    pts_jou_gagnant=-1;
    ELSE
    pts_jou_gagnant=1;
    END IF;

    /* Ici on appel la fonction actualisant le score d'un joueur dans le classement des joueurs */
    PERFORM actualisation_clas_joueur(id_jou_gagnant,pts_jou_gagnant);
    PERFORM actualisation_clas_joueur(id_jou_vaincue,pts_jou_vaincue);
    return NEW;

END;
$$
language plpgsql;
    
/* Creation du trigger d'actualisation */
CREATE trigger  actu_class_jou
AFTER insert on Eliminer
for each row
execute procedure actu_class_joueur();
