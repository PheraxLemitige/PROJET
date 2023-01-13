/* Procédure d'actualisation du classement */
CREATE OR REPLACE FUNCTION actualisation_cla_terr(id_terr confrontation.id_terrain%type)
returns void as $$
BEGIN

    UPDATE classement_terrains
    SET terrain_pts = terrain_pts+1
    where id_terrain=id_terr;
      
END;
$$
language plpgsql;



/* Procédure appelee par le TRIGGER */

CREATE OR REPLACE FUNCTION actu_class_terrain()
returns trigger as $$

BEGIN

    PERFORM actualisation_cla_terr(new.id_terrain);
    return NEW;

END;
$$
language plpgsql;
    
/* Creation du trigger d'actualisation */
CREATE trigger  actu_class_terr
AFTER insert on confrontation
for each row
execute procedure actu_class_terrain();
