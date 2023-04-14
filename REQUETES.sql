-- Requête pour afficher les nom, prenom et date de certificat des membres
SELECT nom,prenom,date_certificat_medical from membres
join donnees_medicales 
on membres.fk_id_donnee_medicale = donnees_medicales.id_donnee_medicale;

-- Requête pour afficher le nom des membres et le nom de leurs médecins
SELECT membres.nom,medecins.nom from membres
join donnees_medicales
on membres.fk_id_donnee_medicale = donnees_medicales.id_donnee_medicale
join medecins
on donnees_medicales.id_medecin = medecins.id_medecin;

-- Savoir combien j'ai de membres
select count(id_membre) from membres;

