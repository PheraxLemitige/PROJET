INSERT INTO type_arme values(1, 'poing');
INSERT INTO type_arme values(2, 'precision');
INSERT INTO type_arme values(3, 'pompe');
INSERT INTO type_arme values(4, 'mitraillette');
INSERT INTO type_arme values(5, 'assaut');
INSERT INTO type_arme values(6, 'mitrailleuses legeres');



INSERT INTO arme values (1, 'berreta 92', 'berreta', 1);
INSERT INTO arme values(2, 'makarov pm', 'makarov', 1);
INSERT INTO arme values(3, 'dragunov svd', 'dragunov', 2);
INSERT INTO arme values(4, 'remington 870p', 'remington', 3);
INSERT INTO arme values(5, 'mauser k98', 'mauser', 2);
INSERT INTO arme values(6, 'mossberg 500', 'mossberg', 3);
INSERT INTO arme values(7, 'cz scorpion', 'scorpion', 4);
INSERT INTO arme values(8, 'fn p90', 'p90', 4);
INSERT INTO arme values(9, 'uzi', 'uzi', 4);
INSERT INTO arme values(10, 'ak-47', 'ak', 5);
INSERT INTO arme values(11, 'famas f1', 'famas', 5);
INSERT INTO arme values(12, 'ar 15', 'ar', 5);
INSERT INTO arme values(13, 'pk', 'pk', 6);

INSERT INTO ville values(1, 'calais', '62100');
INSERT INTO ville values(2, 'paris', '75000');
INSERT INTO ville values(3, 'lyon', '69000');
INSERT INTO ville values(4, 'marseille', '13000');
INSERT INTO ville values(5, 'vanne', '70130');
INSERT INTO ville values(6, 'brest', '29200');
INSERT INTO ville values(7, 'colombiers', '17460');
INSERT INTO ville values(8, 'lille', '59000');
INSERT INTO ville values(9, 'chateauroux', '36000');
INSERT INTO ville values(10, 'bordeaux', '33000');
INSERT INTO ville values(11, 'arras', '62000');
INSERT INTO ville values(12, 'pons', '17800');
INSERT INTO ville values(13, 'pau', '64000');


INSERT INTO equipe values(1, 'sk', 'violet', 1);
INSERT INTO equipe values(2, 'armarda', 'rose', 2);
INSERT INTO equipe values(3, 'tribe', 'rouge', 3);
INSERT INTO equipe values(4, 'pokegame', 'gris', 4);
INSERT INTO equipe values(5, 'julius', 'marron', 5);
INSERT INTO equipe values(6, 'tarteaupomme', 'vert', 6);
INSERT INTO equipe values(7, 'superdoph', 'bleu', 7);
INSERT INTO equipe values(8, 'nba', 'oraange', 8);
INSERT INTO equipe values(9, 'laps', 'noire', 9);
INSERT INTO equipe values(10, 'scrum', 'grisclair', 10);
INSERT INTO equipe values(11, 'bestofriiendo', 'turquoise', 11);
INSERT INTO equipe values(12, 'elucidor', 'blanc', 12);
INSERT INTO equipe values(13, 'tiro', 'bleuciel', 13);
INSERT INTO equipe values(14, 'yggdrazir', 'ecarlate', 1);
INSERT INTO equipe values(15, 'loups', 'vertpomme', 2);


INSERT INTO joueur values (1, 'lutic', 'enzo', 19, 1, 1, 4);
INSERT INTO joueur values (2, 'massias', 'theo', 20, 2, 2, 1);
INSERT INTO joueur values (3, 'devienne', 'nathan', 26, 3, 3, 2);
INSERT INTO joueur values (4, 'vankalk', 'salome', 21, 4, 4, 3);
INSERT INTO joueur values (5, 'hurdebourcq', 'paul', 19, 5, 5, 5);
INSERT INTO joueur values (6, 'karma', 'marie', 20, 6, 6, 6);
INSERT INTO joueur values (7, 'smith', 'paul', 36, 7, 7, 7);
INSERT INTO joueur values (8, 'carrey', 'thomas', 36, 8, 8, 8);
INSERT INTO joueur values (9, 'lacaster', 'emma', 24, 9, 9, 9);
INSERT INTO joueur values (10, 'amar', 'jean', 23, 10, 10, 10);
INSERT INTO joueur values (11, 'mio', 'stephane', 25, 11, 11, 11);
INSERT INTO joueur values (12, 'tartin', 'enzo', 18, 12, 12, 12);
INSERT INTO joueur values (13, 'riette', 'maxime', 27, 13, 13, 13);
INSERT INTO joueur values (14, 'appart', 'jean', 23, 1, 13, 14);
INSERT INTO joueur values (15, 'mirtille', 'emma', 42, 2, 12, 15);
INSERT INTO joueur values (16, 'chiq', 'nadia', 28, 3, 11, 1);
INSERT INTO joueur values (17, 'poulpi', 'paul', 29, 4, 10, 2);
INSERT INTO joueur values (18, 'dango', 'tom', 30, 5, 9, 3);
INSERT INTO joueur values (19, 'pingui', 'carl', 31, 6, 8, 4);
INSERT INTO joueur values (20, 'cerfeuille', 'elena', 32, 7, 7, 5);
INSERT INTO joueur values (21, 'mouanette', 'ange', 20, 8, 6, 6);
INSERT INTO joueur values (22, 'goudale', 'jeancharle', 21, 9, 5, 7);
INSERT INTO joueur values (23, 'crik', 'noe', 22, 10, 4, 8);
INSERT INTO joueur values (24, 'pin', 'pong', 23, 11, 3, 9);
INSERT INTO joueur values (25, 'muto', 'yugi', 24, 12, 2, 10);
INSERT INTO joueur values (26, 'soulon', 'patrick', 25, 13, 1, 11);
INSERT INTO joueur values (27, 'disney', 'enzo', 26, 8, 2, 12);
INSERT INTO joueur values (28, 'sins', 'jonny', 27, 9, 5, 13);
INSERT INTO joueur values (29, 'red', 'molly', 28, 4, 2, 14);
INSERT INTO joueur values (30, 'bros', 'alicia', 29, 9, 3, 15);

INSERT INTO terrain values (1, 'stade de la rose', 12, 1);
INSERT INTO terrain values (2, 'terrain des lions', 50, 2);
INSERT INTO terrain values (3, 'terreins de poulpi', 35, 3);
INSERT INTO terrain values (4, 'parc des reines', 15, 4);
INSERT INTO terrain values (5, 'stade du sang', 65, 5);
INSERT INTO terrain values (6, 'terrain neutre', 55, 6);
INSERT INTO terrain values (7, 'terrain des pub', 75, 7);
INSERT INTO terrain values (8, 'stade des dragons', 45, 8);
INSERT INTO terrain values (9, 'parc des haricots', 40, 9);
INSERT INTO terrain values (10, 'terrain de magic', 25, 10);
INSERT INTO terrain values (11, 'stade des pinguins', 30, 11);
INSERT INTO terrain values (12, 'terrains des fruits', 35, 12);
INSERT INTO terrain values (13, 'parc des heros', 40, 13);

