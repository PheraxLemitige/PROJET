CREATE OR REPLACE FUNCTION ajout_classement_equipe()
returns trigger as $$
 
BEGIN
    INSERT INTO classement_equipes values (new.id_equipe,0);
    return NEW;

END;
$$
language plpgsql;
    
/* Creation du trigger d'actualisation */
CREATE trigger  ajout_cla_jou
AFTER insert on equipe
for each row
execute procedure ajout_classement_equipe();