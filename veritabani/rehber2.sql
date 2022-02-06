BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "rehber2" (
	"kisi_id"	INTEGER UNIQUE,
	"kisi_ad"	TEXT,
	"kisi_yas"	INTEGER,
	PRIMARY KEY("kisi_id" AUTOINCREMENT)
);
INSERT INTO "rehber2" VALUES (1,'Ahmet',20),
 (2,'Veli',22),
 (3,'Mehmet',13);
COMMIT;
