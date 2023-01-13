#include "GameOfLife.hpp"
#include <iostream>

int main()
{
    GameOfLife jeux = GameOfLife(10, 10, false, 13, nullptr);

    jeux.jouer(2);

    return 0;
}