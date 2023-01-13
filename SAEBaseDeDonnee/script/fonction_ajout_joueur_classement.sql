CREATE OR REPLACE FUNCTION ajout_classement_joueur()
returns trigger as $$
 
BEGIN
    INSERT INTO classement_joueurs values (new.id_joueur,0);
    return NEW;

END;
$$
language plpgsql;
    
/* Creation du trigger d'actualisation */
CREATE trigger  ajout_cla_jou
AFTER insert on joueur
for each row
execute procedure ajout_classement_joueur();