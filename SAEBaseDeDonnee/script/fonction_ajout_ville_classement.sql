CREATE OR REPLACE FUNCTION ajout_classement_ville()
returns trigger as $$
 
BEGIN
    INSERT INTO classement_villes values (new.id_ville,0);
    return NEW;

END;
$$
language plpgsql;
    
/* Creation du trigger d'actualisation */
CREATE trigger  ajout_cla_vil
AFTER insert on ville
for each row
execute procedure ajout_classement_ville();