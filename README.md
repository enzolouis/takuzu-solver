# takuzu-solver

## Introduction

Le Takuzu est un jeu de réflexion consistant à remplir une grille à l'origine partiellement rempli par des déductions logiques en suivant quelques simples règles :

1. Chaque ligne ou colonne ne doit pas comporter plus de deux 0 ou deux 1 à la suite

❌❌❌❌❌❌❌❌❌❌
| 0 | 1 | 1 | 1 | 0 | 0 |
|:-:|:-:|:-:|:-:|:-:|:-:|

2. Le nombre de 0 et de 1 doit être égal sur une même ligne et une même colonne

❌❌❌❌❌❌❌❌❌❌
| 1 | 1 | 0 | 1 | 0 | 1 |
|:-:|:-:|:-:|:-:|:-:|:-:|


3. Aucune ligne ou colonne ne peut être identique

❌❌❌❌❌❌❌❌❌❌

| 1 | 1 | 0 | 1 | 0 | 0 |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 1 | 1 | 0 | 1 | 0 | 0 |


## Exemple

### Grille de taille n = 6

| 1 |   |   |   | 0 | 0 |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 1 |   |   |   |   |   |
|   |   |   | 0 |   | 0 |
|   | 0 |   | 0 | 0 |   |
|   |   |   |   | 1 |   |
|   | 0 |   |   |   |   |

### Grille résolu

| 1 | 1 | 0 | 1 | 0 | 0 |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 1 | 0 | 0 | 1 | 0 | 1 |
| 0 | 1 | 1 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 0 | 1 |
| 0 | 1 | 0 | 1 | 1 | 0 |
| 0 | 0 | 1 | 0 | 1 | 1 |


## Méthodes de résolution

### Première méthode naïve : Utilisation de 4 règles simple, dérivées et traduites des règles du Takuzu

	Règle A : Y a-t-il 2 cases côte à côte à la gauche ou à la droite de la case courante contenant le même chiffre (Ligne & Colonne) ?

| 0 | 1 | 1 |   |   |   |
|:-:|:-:|:-:|:-:|:-:|:-:|

	-> Oui, alors remplir la case courante avec le complément du chiffre

| 0 | 1 | 1 | 0 |   |   |
|:-:|:-:|:-:|:-:|:-:|:-:|

	Règle B : Y a-t-il 1 case de même chiffre de chaque côté de la case courante (Ligne & Colonne) ? 

|   |   |   | 0 |   | 0 |
|:-:|:-:|:-:|:-:|:-:|:-:|

	-> Oui, alors remplir la case courante avec le complément du chiffre

|   |   |   | 0 | 1 | 0 |
|:-:|:-:|:-:|:-:|:-:|:-:|

	Règle C : Y a-t-il n / 2 cases de même chiffre dans une même rangée (Ligne & Colonne) soit n la taille d'une ligne/colonne

| 1 | 1 | 0 |   |   | 1 |
|:-:|:-:|:-:|:-:|:-:|:-:|

	-> Oui, alors remplir la rangée avec le complément du chiffre

| 1 | 1 | 0 | 0 | 0 | 1 |
|:-:|:-:|:-:|:-:|:-:|:-:|

	Règle D : La grille ne peut posséder 2 mêmes lignes ou 2 mêmes colonnes

Avec ces 4 règles, on peut résoudre 4 grilles entièrement sur les 9 (voir dossier grilles).

### Deuxième méthode par backtracking itératif

On se base sur la validité de la grille en respectant les deux premières règles énoncés au début (1., 2.) :

1. S'il y a plus de deux 0 ou deux 1 dans une même ligne ou colonne : la grille n'est pas valide
2. Si le nombre de 0 ou de 1 est supérieur à n / 2 soit n la taille d'une rangée de la grille : la grille n'est pas valide

Le principe est de se déplacer à chaque tour de boucle à la première case vide disponible puis :

	Début
	Si un 0 est possible dans la case alors
		on met un 0 dans cette case
	Sinon Si le 0 est impossible mais que le 1 est possible alors
		on met un 1 dans cette case
	Sinon Si le 0 et le 1 sont impossibles, on a forcément un problème avant alors
		on vide toutes les cases contenant un 1 précédent cette case
		une fois un 0 atteint : on remplace le contenu de cette case par 1
	Passage à la case vide suivante et retour au Début
	Fin;

Explication pour le troisième "Si" : lorsque l'on remonte case par case, si la case contient un 1 ca veut dire qu'elle ne peut pas contenir de 0 à ce moment précis dans la procédure, donc on la vide directement, alors qu'un 0 peut devenir un 1

## Précision

La méthode par backtracking résout toutes les grilles possibles, mais n'est pas la solution la plus rapide, pour optimiser la résolution, on combine avec la méthode naïve (exécuté avant) afin de donner le plus d'informations possibles au backtracking et ne pas scanner les cases obtenus grâce à cette méthode naïve.

Des tests sont intégrés ainsi que les grilles sur lesquels ont été testées les algorithmes

## Optimisations possibles

Refaire le backtracking en récursif au lieu d'itératif.
