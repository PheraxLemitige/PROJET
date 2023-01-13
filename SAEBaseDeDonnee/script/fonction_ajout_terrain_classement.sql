CREATE OR REPLACE FUNCTION ajout_classement_terrain()
returns trigger as $$
 
BEGIN
    INSERT INTO classement_terrains values (new.id_terrain,0);
    return NEW;

END;
$$
language plpgsql;
    
/* Creation du trigger d'actualisation */
CREATE trigger  ajout_cla_jou
AFTER insert on terrain
for each row
execute procedure ajout_classement_terrain();