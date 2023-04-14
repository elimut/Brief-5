-- Ajout valeur clef étrangère relative aux données médicales pour les membres en fonction de la date de CM
update membres set fk_id_donnee_medicale = (select id_donnee_medicale from donnees_medicales where date_certificat_medical = '2022/11/25' limit 1) where nom = 'Clinton';
update membres set fk_id_donnee_medicale = (select id_donnee_medicale from donnees_medicales where date_certificat_medical = '2023/01/15' limit 1) where nom = 'Bellic';
update membres set fk_id_donnee_medicale = (select id_donnee_medicale from donnees_medicales where date_certificat_medical = '2022/10/21' limit 1) where nom = 'Jakowski';

-- Modification table medecins, ajout colonne libelle
ALTER TABLE medecins
ADD libelle varchar(30);

-- Mise à jour des lignes suite à l'ajout de la colonne
update medecins set libelle = 'Doctor 1' where nom = 'Dugan';
update medecins set libelle = 'Doctor 2' where nom = 'Martinez';
update medecins set libelle = 'Doctor 3' where nom = 'Jonas Busch';

-- Vérification d' une requête
SELECT membres.nom,medecins.nom, medecins.libelle from membres
join donnees_medicales
on membres.fk_id_donnee_medicale = donnees_medicales.id_donnee_medicale
join medecins
on donnees_medicales.id_medecin = medecins.id_medecin;