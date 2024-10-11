CREATE TABLE ort (
    oid NUMBER PRIMARY KEY,
    plz VARCHAR2(10),
    ort VARCHAR2(50),
    land VARCHAR2(50),
    region VARCHAR2(50)
);

CREATE TABLE buchungsquelle (
    bqid NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    beschreibung VARCHAR2(100)
);

CREATE TABLE bezahlmethode (
    bmid NUMBER PRIMARY KEY,
    methode VARCHAR2(50),
    zusätzliche_gebühren NUMBER
);

CREATE TABLE person (
    peid NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    vorname VARCHAR2(50),
    geschlecht VARCHAR2(10),
    telefonnummer VARCHAR2(20),
    adresse VARCHAR2(100),
    email VARCHAR2(100),
    geburtsdatum DATE,
    nationalität VARCHAR2(50),
    sprache VARCHAR2(50),
    oid NUMBER,
    CONSTRAINT fk_person_ort FOREIGN KEY (oid) REFERENCES ort (oid)
);

CREATE TABLE rolle (
    roid NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    beschreibung VARCHAR2(100)
);

CREATE TABLE person_rolle (
    peid NUMBER,
    roid NUMBER,
    registrierungsdatum DATE,
    startdatum DATE,
    enddatum DATE,
    CONSTRAINT fk_person_rolle_person FOREIGN KEY (peid) REFERENCES person (peid),
    CONSTRAINT fk_person_rolle_rolle FOREIGN KEY (roid) REFERENCES rolle (roid)
);

CREATE TABLE hotel (
    hid NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    adresse VARCHAR2(100),
    bewertung NUMBER,
    sterne NUMBER,
    kette VARCHAR2(100),
    zimmer_anzahl NUMBER,
    telefonnummer VARCHAR2(20),
    email VARCHAR2(100),
    website VARCHAR2(100),
    baujahr NUMBER,
    standortbeschreibung VARCHAR2(255),
    beschreibung VARCHAR2(255),
    oid NUMBER,
    bqid NUMBER,
    CONSTRAINT fk_hotel_ort FOREIGN KEY (oid) REFERENCES ort (oid),
    CONSTRAINT fk_hotel_buchungsquelle FOREIGN KEY (bqid) REFERENCES buchungsquelle (bqid)
);

CREATE TABLE ausstattung (
    aid NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    beschreibung VARCHAR2(100)
);

CREATE TABLE zimmer (
    zid NUMBER PRIMARY KEY,
    zimmernummer VARCHAR2(20),
    kapazität NUMBER,
    kategorie VARCHAR2(50),
    zimmerpreis NUMBER,
    status VARCHAR2(20),
    beschreibung VARCHAR2(255),
    hid NUMBER,
    CONSTRAINT fk_zimmer_hotel FOREIGN KEY (hid) REFERENCES hotel (hid)
);

CREATE TABLE preisregel (
    prid NUMBER PRIMARY KEY,
    saison VARCHAR2(50),
    startdatum DATE,
    enddatum DATE,
    preis NUMBER,
    rabatt NUMBER,
    zid NUMBER,
    CONSTRAINT fk_preisregel_zimmer FOREIGN KEY (zid) REFERENCES zimmer (zid)
);

CREATE TABLE reservation (
    rid NUMBER PRIMARY KEY,
    status VARCHAR2(20),
    checkin_datum DATE,
    checkout_datum DATE,
    reservierungs_datum DATE,
    gast_bewertung VARCHAR2(255),
    zid NUMBER,
    peid NUMBER,
    CONSTRAINT fk_reservation_zimmer FOREIGN KEY (zid) REFERENCES zimmer (zid),
    CONSTRAINT fk_reservation_person FOREIGN KEY (peid) REFERENCES person (peid)
);

CREATE TABLE bezahlung (
    bid NUMBER PRIMARY KEY,
    betrag NUMBER,
    zahlungs_status VARCHAR2(20),
    zahlungsdatum DATE,
    rechnungsnummer VARCHAR2(50),
    rid NUMBER,
    bmid NUMBER,
    bqid NUMBER,
    CONSTRAINT fk_bezahlung_reservation FOREIGN KEY (rid) REFERENCES reservation (rid),
    CONSTRAINT fk_bezahlung_bezahlmethode FOREIGN KEY (bmid) REFERENCES bezahlmethode (bmid),
    CONSTRAINT fk_bezahlung_buchungsquelle FOREIGN KEY (bqid) REFERENCES buchungsquelle (bqid)
);

CREATE TABLE zimmer_ausstattung (
    zid NUMBER,
    aid NUMBER,
    CONSTRAINT fk_zimmer_ausstattung_zimmer FOREIGN KEY (zid) REFERENCES zimmer (zid),
    CONSTRAINT fk_zimmer_ausstattung_ausstattung FOREIGN KEY (aid) REFERENCES ausstattung (aid)
);

CREATE TABLE einrichtung (
    eid NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    beschreibung VARCHAR2(100)
);

CREATE TABLE hotel_einrichtung (
    hid NUMBER,
    eid NUMBER,
    anzahl NUMBER,
    CONSTRAINT fk_hotel_einrichtung_hotel FOREIGN KEY (hid) REFERENCES hotel (hid),
    CONSTRAINT fk_hotel_einrichtung_einrichtung FOREIGN KEY (eid) REFERENCES einrichtung (eid)
);