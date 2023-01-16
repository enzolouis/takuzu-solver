# takuzu-solver

## Introduction

Le Takuzu est un jeu de réflexion consistant à remplir une grille à l'origine partiellement rempli par des déductions logiques en suivant quelques simples règles :

1. Chaque ligne ou colonne ne doit pas comporter plus de deux 0 ou deux 1 à la suite;
2. Le nombre de 0 et de 1 doit être égal sur une même ligne et une même colonne;
3. Aucune ligne ou colonne ne peut être identique.

## Exemples

### Grille 1 de taille 6

| 1 |   |   |   | 0 | 0 |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 1 |   |   |   |   |   |
|   |   |   | 0 |   | 0 |
|   | 0 |   | 0 | 0 |   |
|   |   |   |   | 1 |   |
|   | 0 |   |   |   |   |

### Grille 1 résolu

| 1 | 1 | 0 | 1 | 0 | 0 |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 1 | 0 | 0 | 1 | 0 | 1 |
| 0 | 1 | 1 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 0 | 1 |
| 0 | 1 | 0 | 1 | 1 | 0 |
| 0 | 0 | 1 | 0 | 1 | 1 |


## Méthodes de résolution

Première méthode naïve : Utilisation de 4 règles simple, dérivées et traduites des règles du Takuzu :

	Règle A : Y a-t-il 2 cases côte à côte à la gauche ou à la droite de la case courante contenant le même chiffre (Ligne & Colonne) : remplir la case courante avec le complément du chiffre
	Règle B : Y a-t-il 1 case de même chiffre de chaque côté de la case courante (Ligne & Colonne) : remplir la case courante avec le complément du chiffre
	Règle C : Y a-t-il 4 case de même chiffre dans une même rangée (Ligne & Colonne) : remplir la rangée avec le complément du chiffre
	Règle D : La grille ne peut posséder 2 mêmes lignes ou 2 mêmes colonnes

Avec ces 4 règles, on peut résoudre 4 grilles entièrement sur les 8 (voir dossier grilles).