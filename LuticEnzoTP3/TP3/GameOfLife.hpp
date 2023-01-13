#ifndef _GAMELIFE_
#define _GAMELIFE_

class GameOfLife
{
private:
    int* tableau;
    int longueur = 10;
    int largeur = 10;
    bool tore;
    int version;
public:
    GameOfLife(const int x, const int y, const bool tore, const int version, int* tableau = nullptr);
    ~GameOfLife();
    int getCaseCordonnee(const int x, const int y);
    int getCase(const int index);
    void setCase(const int x, const int y, const int newCase);
    int nbrVoisinVivant(const int x, const int y);
    int nbrVoisinVivantTore(const int x, const int y);
    bool encoreVivante (const int x, const int y);
    bool naissanceCellule (const int x, const int y);
    void iterationSuivante ();
    void jouer (const int n);
    int count(int etat);
    int* stat ();
    void afficher();
    void jouer();
};


#endif