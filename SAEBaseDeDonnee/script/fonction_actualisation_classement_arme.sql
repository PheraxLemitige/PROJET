/* Procédure d'actualisation du classement */
CREATE OR REPLACE FUNCTION actualisation_cla_arm(id_arm arme.id_arme%type, pts_a_ajouter_ou_a_retirer INTEGER)
returns void as $$

DECLARE

    /* Une variable contenant les pts actuels du joueurs, permettant l'actualisation */
    pts classement_equipes.equipe_pts%type;

BEGIN

    /* On selectionne ses pts, on y ajoute la nouvelle valeur (celle en paramètres) */
    SELECT arme_pts into pts  FROM classement_armes  where id_arme=id_arm ;
    pts=pts+pts_a_ajouter_ou_a_retirer;
    UPDATE classement_armes
    SET arme_pts = pts
    where id_arme=id_arm;
      
END;
$$
language plpgsql;



/* Procédure appelee par le TRIGGER */

CREATE OR REPLACE FUNCTION actu_class_arme()
returns trigger as $$

DECLARE
    /* Id joueurs */
    id_jou_gagnant Eliminer.id_joueur%type;
    id_jou_vaincue Eliminer.id_joueur_1%type;
    /* Id arme */
    id_arm_jou_gagnant arme.id_arme%type;
    /* Pts à changer dans le classement */
    pts_jou_gagnant int;
    pts_jou_vaincue int;
    /* Id équipes */
    id_equi_jou_gagnant joueur.id_equipe%type;
    id_equi_jou_vaincue joueur.id_equipe%type;
    

BEGIN

    /*Ici on récupère l'id des joueurs*/   
    id_jou_gagnant=new.id_joueur;
    id_jou_vaincue=new.id_joueur_1;
    /* l'id de leur équipe */
    SELECT id_equipe into id_equi_jou_gagnant from joueur where id_jou_gagnant=id_joueur;
    SELECT id_equipe into id_equi_jou_vaincue from joueur where id_jou_vaincue=id_joueur;
    /* L'id de l'arme du gagnant */
    SELECT id_arme into id_arm_jou_gagnant from joueur where id_jou_gagnant=id_joueur;

    /*Ici, on va vérifier s'il sont de la même équipe (-1 pts pour l'arme du gagnant)
    Sinon +1 pts */
    IF id_equi_jou_gagnant=id_equi_jou_vaincue THEN
    pts_jou_gagnant=-1;
    ELSE
    pts_jou_gagnant=1;
    END IF;

    /* Ici on appel la fonction actualisant le score d'un joueur dans le classement des joueurs */
    PERFORM actualisation_cla_arm(id_arm_jou_gagnant,pts_jou_gagnant);
    return NEW;

END;
$$
language plpgsql;
    
/* Creation du trigger d'actualisation */
CREATE trigger  actu_class_arme
AFTER insert on Eliminer
for each row
execute procedure actu_class_arme();
