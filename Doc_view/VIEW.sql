-- Création d'une vue qui affiche les informations médicales de base d'un membre
CREATE VIEW membre_medical AS 
select membres.nom, membres.prenom, donnees_medicales.date_certificat_medical, medecins.libelle
from membres
join donnees_medicales on donnees_medicales.id_donnee_medicale = membres.fk_id_donnee_medicale
join medecins on donnees_medicales.id_medecin = donnees_medicales.id_medecin;
​
select * from membre_medical;

