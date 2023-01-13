CREATE TABLE type_arme(
   id_type INT,
   Tnom VARCHAR(50),
   PRIMARY KEY(id_type)
);

CREATE TABLE ville(
   id_ville INT,
   Vnom VARCHAR(50),
   Vcode_postal VARCHAR(50),
   PRIMARY KEY(id_ville)
);

CREATE TABLE equipe(
   id_equipe INT,
   Enom VARCHAR(50) NOT NULL,
   Ecouleur VARCHAR(50) NOT NULL,
   id_ville INT NOT NULL,
   PRIMARY KEY(id_equipe),
   UNIQUE(Enom),
   UNIQUE(Ecouleur),
   FOREIGN KEY(id_ville) REFERENCES ville(id_ville)
);

CREATE TABLE terrain(
   id_terrain INT,
   Tnom VARCHAR(50),
   Ttaille INT,
   id_ville INT NOT NULL,
   PRIMARY KEY(id_terrain),
   FOREIGN KEY(id_ville) REFERENCES ville(id_ville)
);

CREATE TABLE confrontation(
   id_conf INT,
   Cdate DATE,
   id_terrain INT NOT NULL,
   PRIMARY KEY(id_conf),
   FOREIGN KEY(id_terrain) REFERENCES terrain(id_terrain)
);

CREATE TABLE jouer_contre(
   id_equipe INT,
   id_equipe_1 INT,
   id_conf INT,
   PRIMARY KEY(id_conf),
   FOREIGN KEY(id_equipe) REFERENCES equipe(id_equipe),
   FOREIGN KEY(id_equipe_1) REFERENCES equipe(id_equipe),
   FOREIGN KEY(id_conf) REFERENCES confrontation(id_conf)
);

CREATE TABLE arme(
   id_arme INT,
   Anom VARCHAR(50) NOT NULL,
   Aacronyme VARCHAR(50) NOT NULL,
   Atype INT,
   PRIMARY KEY(id_arme),
   FOREIGN KEY(Atype) REFERENCES type_arme(id_type)
);

CREATE TABLE joueur(
   id_joueur INT,
   Jnom VARCHAR(50) NOT NULL,
   Jprenom VARCHAR(50) NOT NULL,
   Jage INT,
   id_ville INT NOT NULL,
   id_arme INT NOT NULL,
   id_equipe INT NOT NULL,
   PRIMARY KEY(id_joueur),
   FOREIGN KEY(id_ville) REFERENCES ville(id_ville),
   FOREIGN KEY(id_arme) REFERENCES arme(id_arme),
   FOREIGN KEY(id_equipe) REFERENCES equipe(id_equipe)
);

CREATE TABLE eliminer(
   id_elimination int,
   id_joueur INT,
   id_joueur_1 INT,
   PRIMARY KEY(id_elimination),
   FOREIGN KEY(id_joueur) REFERENCES joueur(id_joueur),
   FOREIGN KEY(id_joueur_1) REFERENCES joueur(id_joueur)
);



CREATE TABLE classement_equipes(
   id_equipe INT,
   equipe_pts INT,
   PRIMARY KEY(id_equipe)
);

CREATE TABLE classement_joueurs(
   id_joueur INT,
   joueur_pts INT,
   PRIMARY KEY(id_joueur)
);

CREATE TABLE classement_armes(
   id_arme INT,
   arme_pts INT,
   PRIMARY KEY(id_arme)
);

CREATE TABLE classement_villes(
   id_ville INT,
   ville_pts INT,
   PRIMARY KEY(id_ville)
);

CREATE TABLE classement_terrains(
   id_terrain INT,
   terrain_pts INT,
   PRIMARY KEY(id_terrain)
);