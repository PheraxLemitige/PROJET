/* Procédure d'actualisation du classement */
CREATE OR REPLACE FUNCTION actualisation_cla_eqp(id_eqp ville.id_ville%type, pts_a_ajouter_ou_a_retirer INTEGER)
returns void as $$

DECLARE

    /* Une variable contenant les pts actuels du joueurs, permettant l'actualisation */
    pts classement_equipes.equipe_pts%type;

BEGIN

    /* On selectionne ses pts, on y ajoute la nouvelle valeur (celle en paramètres) */
    SELECT equipe_pts into pts  FROM classement_equipes  where id_ville=id_eqp ;
    pts=pts+pts_a_ajouter_ou_a_retirer;
    UPDATE classement_equipes
    SET equipe_pts = pts
    where id_equipe=id_eqp;
      
END;
$$
language plpgsql;



/* Procédure appelee par le TRIGGER */

CREATE OR REPLACE FUNCTION actu_class_ville()
returns trigger as $$

DECLARE
    /* Id joueurs */
    id_jou_gagnant eliminer.id_joueur%type;
    id_jou_vaincue eliminer.id_joueur_1%type;
    /* Id équipes */
    id_equi_jou_gagnant joueur.id_equipe%type;
    id_equi_jou_vaincue joueur.id_equipe%type;
    /* Id villes */
    id_ville_jou_gagnant joueur.id_ville%type;
    id_ville_jou_vaincue joueur.id_ville%type;
    /* Pts à changer dans le classement */
    pts_jou_gagnant int;
    pts_jou_vaincue int;
    

BEGIN

    /*Ici on récupère l'id des joueurs*/   
    id_jou_gagnant=new.id_joueur;
    id_jou_vaincue=new.id_joueur_1;

    /* l'id de leur équipe */
    SELECT id_equipe into id_equi_jou_gagnant from joueur where id_jou_gagnant=id_joueur;
    SELECT id_equipe into id_equi_jou_vaincue from joueur where id_jou_vaincue=id_joueur;

    /*l'id de leur ville */
    SELECT id_ville into id_ville_jou_gagnant from joueur where id_jou_gagnant=id_joueur;
    SELECT id_ville into id_ville_jou_vaincue from joueur where id_jou_vaincue=id_joueur;

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
    PERFORM actualisation_cla_eqp(id_ville_jou_gagnant,pts_jou_gagnant);
    PERFORM actualisation_cla_eqp(id_ville_jou_vaincue,pts_jou_vaincue);
    return NEW;

END;
$$
language plpgsql;
    
/* Creation du trigger d'actualisation */
CREATE trigger  actu_class_equ
AFTER insert on Eliminer
for each row
execute procedure actu_class_ville();
