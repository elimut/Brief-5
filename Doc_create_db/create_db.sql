CREATE SCHEMA euro_fit_Anne_Sophie;

USE euro_fit_Anne_Sophie;

create table if not exists pays(
id_pays int not null auto_increment,
pays varchar(50),
primary key(id_pays)
);

create table if not exists codes_postaux(
id_code_postal int not null auto_increment,
code_postal varchar(15),
primary key(id_code_postal)
);

create table if not exists villes(
id_ville int not null auto_increment,
ville varchar(30),
primary key(id_ville),
id_code_postal int,
id_pays int,
CONSTRAINT fk_id_code_postal FOREIGN KEY (id_code_postal) REFERENCES codes_postaux (id_code_postal) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT fk_id_pays FOREIGN KEY (id_pays) REFERENCES pays (id_pays) ON DELETE SET NULL ON UPDATE CASCADE
);

create table if not exists medecins(
id_medecin int not null auto_increment,
nom varchar(30),
prenom varchar(30),
primary key(id_medecin)
);

create table if not exists donnees_medicales(
id_donnee_medicale int not null auto_increment,
date_certificat_medical date,
primary key(id_donnee_medicale),
id_medecin int,
CONSTRAINT fk_id_medecin FOREIGN KEY (id_medecin) REFERENCES medecins (id_medecin) ON DELETE SET NULL ON UPDATE CASCADE
);

create table if not exists parrainages(
id_parrainage int not null auto_increment,
parrain varchar(50),
filleule varchar(50),
primary key(id_parrainage)
);

create table if not exists adresses(
id_adresse int not null auto_increment,
adresse varchar(255),
primary key(id_adresse),
id_code_postal int,
CONSTRAINT id_code_postal FOREIGN KEY (id_code_postal) REFERENCES codes_postaux (id_code_postal) ON DELETE SET NULL ON UPDATE CASCADE
);

create table if not exists etablissements_bancaires(
id_etablissement int not null auto_increment,
nom varchar(50),
primary key(id_etablissement)
);

create table if not exists finances(
id_finance int not null auto_increment,
rib varchar(50),
cotisation_a_jour boolean,
primary key(id_finance),
id_etablissement int,
CONSTRAINT id_etablissement FOREIGN KEY (id_etablissement) REFERENCES etablissements_bancaires(id_etablissement) ON DELETE SET NULL ON UPDATE CASCADE
);

create table if not exists assurances(
id_assurance int not null auto_increment,
numero_de_contrat varchar(50),
primary key(id_assurance)
);

create table if not exists machines(
id_machines int not null auto_increment,
date_badge_debut date,
date_badge_fin date,
type varchar(30),
primary key(id_machines)
);

create table if not exists salles(
id_salle int not null auto_increment,
type varchar(30),
primary key(id_salle),
id_machines int,
CONSTRAINT id_machines FOREIGN KEY (id_machines) REFERENCES machines(id_machines) ON DELETE SET NULL ON UPDATE CASCADE
);


create table if not exists produits(
id_produits int not null auto_increment,
prix float,
primary key(id_produits)
);

create table if not exists achats(
id_achat int not null auto_increment,
facture varchar(50),
livraison boolean,
primary key(id_achat),
 id_produits int,
CONSTRAINT id_produits FOREIGN KEY (id_produits) REFERENCES produits(id_produits) ON DELETE SET NULL ON UPDATE CASCADE
);

create table if not exists donnees_sante(
id_donnee_sante int not null auto_increment,
type varchar(50),
primary key(id_donnee_sante),
 id_machine int,
CONSTRAINT id_machine FOREIGN KEY (id_machine) REFERENCES machines(id_machines) ON DELETE SET NULL ON UPDATE CASCADE
);

create table if not exists fournisseurs(
id_fournisseur int not null auto_increment,
facture varchar(50),
prix float,
primary key(id_fournisseur),
 id_produit int,
 id_adresse int,
 CONSTRAINT id_produit FOREIGN KEY (id_produit) REFERENCES produits(id_produits) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT id_adresse FOREIGN KEY (id_adresse) REFERENCES adresses(id_adresse) ON DELETE SET NULL ON UPDATE CASCADE
);

create table if not exists magasins(
id_magasin int not null auto_increment,
numero_de_telephone varchar(30),
livraison boolean,
primary key(id_magasin),
 id_achat int,
 id_adresse int,
 CONSTRAINT id_achat FOREIGN KEY (id_achat) REFERENCES achats(id_achat) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT fk_id_adresse FOREIGN KEY (id_adresse) REFERENCES adresses(id_adresse) ON DELETE SET NULL ON UPDATE CASCADE
);

create table if not exists connexions(
id_connexion int not null auto_increment,
login varchar(50),
mot_de_passe varchar(255),
question_secrete varchar(50),
primary key(id_connexion)
);

create table if not exists clubs(
id_club int not null auto_increment,
nom varchar(50),
numero_de_telephone varchar(30),
primary key(id_club),
 id_assurance int,
 id_salle int,
 id_donnee_sante int,
 id_connexion int,
 CONSTRAINT id_assurance FOREIGN KEY (id_assurance) REFERENCES assurances(id_assurance) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT id_salle FOREIGN KEY (id_salle) REFERENCES salles(id_salle) ON DELETE SET NULL ON UPDATE CASCADE,
 CONSTRAINT id_donnee_sante FOREIGN KEY (id_donnee_sante) REFERENCES donnees_sante(id_donnee_sante) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT id_connexion FOREIGN KEY (id_connexion) REFERENCES connexions(id_connexion) ON DELETE SET NULL ON UPDATE CASCADE
);

create table if not exists administrateurs(
id_administrateur int not null auto_increment,
nom varchar(50),
prenom varchar(50),
statut varchar(50),
primary key(id_administrateur),
 fk_id_connexion int,
CONSTRAINT fk_id_connexion FOREIGN KEY (fk_id_connexion) REFERENCES connexions(id_connexion) ON DELETE SET NULL ON UPDATE CASCADE
);

create table if not exists abonnements(
id_abonnement int not null auto_increment,
type varchar(30),
tarif float,
bilan_corporel_offert boolean,
duree int,
primary key(id_abonnement),
fk_id_connexions int,
fk_id_parrainage int,
fk_id_club int,
fk_id_finance int,
CONSTRAINT fk_id_connexions FOREIGN KEY (fk_id_connexions) REFERENCES connexions(id_connexion) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT fk_id_parrainage FOREIGN KEY (fk_id_parrainage) REFERENCES parrainages(id_parrainage) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT fk_id_finance FOREIGN KEY (fk_id_finance) REFERENCES finances(id_finance) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT fk_id_club FOREIGN KEY (fk_id_club) REFERENCES clubs(id_club) ON DELETE SET NULL ON UPDATE CASCADE
);

create table if not exists membres(
id_membre int not null auto_increment,
type varchar(30),
nom varchar(50),
prenom varchar(50),
mail varchar(255),
genre VARCHAR(15),
date_de_naissance date,
bilan_corporel_effectue boolean,
numero_de_telephone varchar(30),
primary key(id_membre),
fk_id_connection int,
fk_id_adresses int,
fk_id_abonnement int,
fk_id_donnee_medicale int,
CONSTRAINT fk_id_connection FOREIGN KEY (fk_id_connection) REFERENCES connexions(id_connexion) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT fk_id_adresses FOREIGN KEY (fk_id_adresses) REFERENCES adresses(id_adresse) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT fk_id_abonnement FOREIGN KEY (fk_id_abonnement) REFERENCES abonnements(id_abonnement) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT fk_id_donnee_medicale FOREIGN KEY (fk_id_donnee_medicale) REFERENCES donnees_medicales(id_donnee_medicale) ON DELETE SET NULL ON UPDATE CASCADE
);

