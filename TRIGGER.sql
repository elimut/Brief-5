create table if not exists corbeille_membre(
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
fk_id_donnee_medicale int
);

delimiter //
create trigger membre_after_delete
after delete
on membres
for each row
begin
	insert into corbeille_membre
		(id_membre ,
		type,
		nom,
		prenom,
		mail,
		genre,
		date_de_naissance,
		bilan_corporel_effectue,
		numero_de_telephone,
		fk_id_connection ,
		fk_id_adresses ,
		fk_id_abonnement ,
		fk_id_donnee_medicale)
	values (old.id_membre,
		old.type,
		old.nom,
		old.prenom,
		old.mail,
		old.genre,
		old.date_de_naissance,
		old.bilan_corporel_effectue,
		old.numero_de_telephone,
		old.fk_id_connection,
		old.fk_id_adresses,
		old.fk_id_abonnement,
		old.fk_id_donnee_medicale);
        
end;
delimiter//

delete from membres where nom = 'Clinton';
select * from membres;
select * from corbeille_membre;
