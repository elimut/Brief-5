use euro_fit_anne_sophie;

INSERT INTO codes_postaux (code_postal) VALUES ('85590');
INSERT INTO codes_postaux (code_postal) VALUES ('1072 AE');
INSERT INTO codes_postaux (code_postal) VALUES ('85590');

INSERT INTO villes (ville, id_code_postal) VALUES ('les epesses',(select id_code_postal from codes_postaux where code_postal = '85590' ));
INSERT INTO villes (ville,id_code_postal) VALUES ('Saint-Mars-la-Réorthe',(select id_code_postal from codes_postaux where code_postal = '85590' ));
INSERT INTO villes (ville,id_code_postal) VALUES ('amsterdam', (select id_code_postal from codes_postaux where code_postal = '1072 AE' ));

INSERT INTO adresses (adresse, id_code_postal) VALUES ('30 Rue de la Fontaine',(select id_code_postal from codes_postaux where code_postal = '85590' ));
INSERT INTO adresses (adresse, id_code_postal) VALUES ('Stadhouderskade 56',(select id_code_postal from codes_postaux where code_postal = '1072 AE' ));
INSERT INTO adresses (adresse, id_code_postal) VALUES ('42 Rue de Lattre de Tassigny',(select id_code_postal from codes_postaux where code_postal = '85590' ));

INSERT INTO membres (type, nom, prenom, mail, genre, date_de_naissance, bilan_corporel_effectue, numero_de_telephone, fk_id_adresses)
VALUES ('coach', 'Clinton', 'Nicolas', 'musclefit@yahoo.com', 'homme','1995/04/20', true, '+336.42.06.97.55', (select id_adresse from adresses where adresse = '30 Rue de la Fontaine' order by id_adresse limit 1));
INSERT INTO membres (type, nom, prenom, mail, genre, date_de_naissance, bilan_corporel_effectue, numero_de_telephone, fk_id_adresses)
VALUES ('premium international', 'Bellic', 'Lamar', 'imporage@gmail.com', 'homme','1978/04/19', true, '+45.11.52.75.63', (select id_adresse from adresses where adresse = 'Stadhouderskade 56' order by id_adresse limit 1));
INSERT INTO membres (type, nom, prenom, mail, genre, date_de_naissance, bilan_corporel_effectue, numero_de_telephone, fk_id_adresses)
VALUES ('VIP', 'Jakowski', 'Franklin', 'frajaski@aol.com', 'inconnu','1970/04/10', FALSE, '+336.35.48.75.65', (select id_adresse from adresses where adresse = '42 Rue de Lattre de Tassigny' order by id_adresse limit 1));

INSERT INTO medecins (nom, prenom) values ('Dugan', 'Agatha');
INSERT INTO medecins (nom, prenom) values ('Martinez', 'Sacha');
INSERT INTO medecins (nom, prenom) values ('Jonas Busch', 'Karim');

INSERT INTO donnees_medicales (date_certificat_medical,id_medecin) values ('2022/11/25', (select id_medecin from medecins where nom ='Dugan'));
INSERT INTO donnees_medicales (date_certificat_medical,id_medecin) values ('2023/01/15', (select id_medecin from medecins where nom ='Martinez'));
INSERT INTO donnees_medicales (date_certificat_medical,id_medecin) values ('2022/10/21', (select id_medecin from medecins where nom ='Jonas Busch'));


INSERT INTO membres (fk_id_donnee_medicale) values ((select id_donnee_medicale from donnees_medicales where date_certificat_medical = '2022/11/25' limit 1 ));

INSERT INTO pays (pays) VALUES ('France');
INSERT INTO pays (pays) VALUES ('Amsterdam');

INSERT INTO clubs (nom) values ('Nutella'), ('Chocolat');
