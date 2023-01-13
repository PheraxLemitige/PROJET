#include <iostream>
#include <random>
#include "GameOfLife.hpp"



GameOfLife::GameOfLife(const int x, const int y, const bool tore, const int version, int* tableau)
{
    this->tableau = new int[x * y];
    this->longueur = x;
    this->largeur = y;
    this->tore = tore;
    this->version = version;

    if (tableau != nullptr){
        this->tableau = tableau;
    }
    if (this->version == 1){
        for(int i = 0; i < this->longueur * this->largeur; i++){
                this->tableau[i] = 0;
        }
    }
    if(this->version == 2){
        for(int i = 0; i < this->longueur * this->largeur; i++){
                this->tableau[i] = 1;
        }
    }
    if(this->version == 3){
        for(int i = 0; i < this->longueur * this->largeur; i++){
                if (i % 2 == 0){
                    this->tableau[i] = 0;
                }
                else{
                    this->tableau[i] = 1;
                }
        }
    }
    if(this->version == 4){
        srand(time(0));
        for(int i = 0; i < this->longueur * this->largeur; i++){
                this->tableau[i] = rand() % 2;
        }
    }
}

GameOfLife::~GameOfLife()   
{

}

int GameOfLife::getCaseCordonnee(const int x, const int y){
    return this->tableau[x + (y * this->largeur)];
}

int GameOfLife::getCase(const int index){
    return this->tableau[index];
}

void GameOfLife::setCase(const int x, const int y, const int newCase){
    this->tableau[x + (y * this->largeur)] = newCase;
}

int GameOfLife::nbrVoisinVivant(const int x, const int y){
    int nbrVoisin = 0;
    for (int i = -1 ; i < 2; i++){
        for(int j = -1; j< 2; j++){
            if(!(x + i < 0) && !(x + i >= this->largeur) && !(y + j < 0) && !(y + j >= this->longueur)){
                if (x + i + (y + j) * this->largeur != x + y * this->largeur){
                    if(this->tableau[x + i + (y + j) * this->largeur] == 1){
                        nbrVoisin = nbrVoisin + 1;
                    }        
                }
            }
        }
    }

    return nbrVoisin;
}

int GameOfLife::nbrVoisinVivantTore(const int x, const int y){
    int nbrVoisin = 0;
    for (int i = -1 ; i < 2; i++){
        for(int j = -1; j< 2; j++){
                if ((x + i) % this->longueur + ((y + j) % this->largeur) * this->largeur != x + y * this->largeur){
                    if(this->tableau[(x + i) % this->longueur + ((y + j) % this->largeur) * this->largeur] == 1){
                        nbrVoisin = nbrVoisin + 1;
                    }        
                }
        }
    }

    return nbrVoisin;
}

bool GameOfLife::encoreVivante (const int x, const int y){
    int voisin;
    if (this->tore){
        voisin = nbrVoisinVivantTore(x,y);
    }
    else{
        voisin = nbrVoisinVivant(x,y);
    }
    return !(voisin < 2 || voisin > 3);
}

bool GameOfLife::naissanceCellule (const int x, const int y){
    int voisin = nbrVoisinVivant(x,y);
    return voisin == 3; 
}

void GameOfLife::iterationSuivante (){
    int* copieGrille = new int[this->longueur * this->largeur];
    for (int i = 0; i < this->longueur * this->largeur; i++){
        copieGrille[i] = getCase(i);
    }
    int index;
    for (int x = 0; x < this->longueur; x++){
        for (int y = 0; y < this->longueur; y++){
            index = x  + y * this->largeur;
            if (this->tableau[index] == 1){
                if (!(encoreVivante(x, y))){ 
                    copieGrille[index] = 0;
                }
            }
            else{
                if (naissanceCellule(x, y)){
                    copieGrille[index] = 1;
                }
            }
        }
        
    }
    this->tableau = copieGrille;
}

void GameOfLife::jouer (const int n){
    for (int i = 0; i < n; i++){
        afficher();
        iterationSuivante ();
        std::cout << "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-" << std::endl;
    }
    afficher();
}

int GameOfLife::count(int etat){
    int nbr = 0;
    for (int i = 0; i < this->longueur; i++){
        nbr = nbr + 1;
    }
    return nbr;
}

int* GameOfLife::stat (){
    int* statistic = new int[2];
    statistic[0] = count(0);
    statistic[1] = count(1);
    return statistic;
}

void GameOfLife::afficher(){

        for (int i = 0; i < this->largeur; i++){
            for (int j = 0; j < this->longueur; j++){

                    if (this->tableau[j + (i * this->largeur)] == 0){
                        std::cout << " |";
                    }
                    else{
                        std::cout << "X|";
                    }
            }
            std::cout <<  std::endl;
            for (int j = 0; j < this->longueur; j++){
                    std::cout << "--";
            }
            std::cout <<  std::endl;
        }

}