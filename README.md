# Problème HomeController (TableView)
Pour une vue de l'application type "Explore", il m'était nécessaire de pouvoir recevoir une liste d'exercices classés par tags depuis l'API,
que nous diviserions ensuite en listes propres aux tags . Dans le cas présent, j'ai formé les listes "Exercices populaires" et "Exercices récents".
Si faire ceci en me basant sur ce que tu nous avais enseigné m'a beaucoup plu, j'ai par contre été totalement bloqué par l'étape où
on en vient à injecter ces données dans deux listes distinctes sur la même vue avec le même table view.

J'ai vu des thread sur StackOverflow où les développeurs voulaient faire quelque chose de semblable avec un seul tableau de données comme source
j'ai essayé mais sans succès, je me suis toujours pris un warning ou un problème de typage.
Je ne pense pas qu'il faille rajouter de TableViewCell, le code commenté dans HomeController semble s'appliquer automatiquement à toute instance de TableViewCell.


#UserDefault singleton
Vu qu'on utilise une connexion avec un JSONWeb Token, j'ai eu besoin de stocker les infos de connexion et le token propres au user
de manière locale afin de pouvoir faire les requêtes ensuite, et de pouvoir retrouver ces infos lorsque je le veux dans une session.
J'ai trouvé sur StackOverflow ce que l'on trouve ici dans CurrentUser.swift, excepté qu'il s'agissait d'une classe User à mon avis custom.
J'ai quand même voulu l'utiliser avec UserDefault mais je me choppais souvent des erreurs quand j'essayais de récupérer l'instance du user.

Est-ce qu'il est possible d'utiliser le concept du singleton avec UserDefault ou ce n'est pas nécessaire et il existe d'autre moyen de
le récupérer ?


#Entry segue point
J'ai fait un onboarding pour l'app, histoire d'avoir plus de vues qu'un écran de connexion, et un autre d'inscription valides, mais
un accueil aujourd'hui inabouti. Pour cela j'ai utilisé PaperOnboarding, assez sympa d'ailleurs pour faire un onboarding simple et rapidement ([bon tuto de Brian Advent](https://www.youtube.com/watch?v=G5UkS4Mrepo) sur Youtube disponible).
En revanche, une fois l'onbaording passé, il n'est plus nécessaire que l'utilisateur le voie à nouveau lorsqu'il lance l'application. Aussi j'ai set un booléen sur UserDefault dans AppDelegate pour gérer la première vue apparaissant. Et après j'ai supprimé le segue Entry Point sur le Main.storyboard. Du coup je ne peux plus voir l'onboarding (c'est ballot pour tester) car je n'ai pas trouvé comment récréer le segue point. 
Une suggestion ? 
