CREATE OR REPLACE FUNCTION ajout_classement_arme()
returns trigger as $$
 
BEGIN
    INSERT INTO classement_armes values (new.id_arme,0);
    return NEW;
END;
$$
language plpgsql;
    
/* Creation du trigger d'actualisation */
CREATE trigger  ajout_cla_arme
AFTER insert on arme
for each row
execute procedure ajout_classement_arme();