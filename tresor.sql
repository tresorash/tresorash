1. Afficher toutes les todolist
=>SELECT * FROM todoliste

2. Afficher le pseudo de tous les utilisateurs
SELECT pseudo FROM utilisateurs

3. Afficher le nombre d’utilisateurs
=>SELECT COUNT(*) FROM utilisateurs

4. Afficher les todolistes de tous les utilisateurs
=> Libellé todoliste et pseudo utilisateurs
SELECT todoliste.libelle,utilisateurs.pseudo FROM todoliste JOIN utilisateurs ON todolite.utilisateurs_id=utilisateurs.id;
SELECT t.libelle,u.pseudo FROM todoliste AS t JOIN  utilisateurs AS u ON t.utilisateur_id=u.id;

 5. Afficher les todolistes de Alice
=>SELECT * FROM todoliste JOIN utilisateurs ON todolite.utilisateurs_id = utilisateurs.id WHERE utilisateurs.pseudo = 'Alice';
SELECT * FROM todoliste AS t JOIN utilisateurs AS u ON t.utilisateurs_id = u.id WHERE u.pseudo = 'Alice';


6. Afficher toutes les taches et leurs états de toutes les todolistes
SELECT todoliste.libelle,taches.libelle,etat.libelle FROM taches JOIN etat ON taches.idETAT=etat.id JOIN todoliste ON taches.idTodo =todoliste.id;
SELECT t.libelle,ta.libelle,e.libelle FROM taches AS ta JOIN etat AS e ON ta.idETAT=e.id JOIN todoliste AS t ON ta.idTodo =t.id;
=> Libellé todoliste, Libellé taches , libellé état

 7. Afficher toutes les taches de Bob ainsi que leurs états
SELECT taches.libelle,etat.libelle FROM taches JOIN etat ON taches.idETAT=etat.id JOIN todoliste ON taches.idTodo=todo.id JOIN utilisateurs ON todoliste.utilisateurs_id=utilisateurs.id WHERE utilisateurs.pseudo = 'Bob';
=> Libellé taches , libellé état.

 8. Afficher toutes les taches qui ont un état « done »
SELECT * FROM taches JOIN etat ON taches.idETAT = etat.id WHERE etat.libelle = 'done';
SELECT * FROM taches AS ta JOIN etat AS e ON ta.idETAT = e.id WHERE e.libelle = 'done';

9. Afficher toutes les taches des utilisateurs avec leur todolist correspondant et leurs états
SELECT utilisateurs.pseudo,todoliste.libelle,taches.libelle,etat.libelle FROM  taches JOIN etat ON taches.idETAT = etat.id JOIN todoliste ON taches.idtodo=todoliste.id JOIN utilisateurs ON todoliste.utilisateurs_id=utilisateurs.id;
=> pseudo, libellé todoliste, libellé taches, libellé état 