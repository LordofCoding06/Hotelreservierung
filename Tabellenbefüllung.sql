BEGIN
    INSERT INTO ort (oid, plz, ort, land, region) VALUES (1, '10115', 'Berlin', 'Deutschland', 'Berlin');
    INSERT INTO ort (oid, plz, ort, land, region) VALUES (2, '8000', 'Zürich', 'Schweiz', 'Zürich');
    INSERT INTO ort (oid, plz, ort, land, region) VALUES (3, '75001', 'Paris', 'Frankreich', 'Île-de-France');
    INSERT INTO ort (oid, plz, ort, land, region) VALUES (4, '10001', 'New York', 'USA', 'New York');
END;
/

BEGIN
    INSERT INTO buchungsquelle (bqid, name, beschreibung) VALUES (1, 'Booking.com', 'Online Buchungsplattform');
    INSERT INTO buchungsquelle (bqid, name, beschreibung) VALUES (2, 'Expedia', 'Online Reiseagentur');
    INSERT INTO buchungsquelle (bqid, name, beschreibung) VALUES (3, 'Direktbuchung', 'Direkt beim Hotel gebucht');
END;
/

BEGIN
    INSERT INTO bezahlmethode (bmid, methode, zusätzliche_gebühren) VALUES (1, 'Kreditkarte', 0);
    INSERT INTO bezahlmethode (bmid, methode, zusätzliche_gebühren) VALUES (2, 'PayPal', 2.5);
    INSERT INTO bezahlmethode (bmid, methode, zusätzliche_gebühren) VALUES (3, 'Barzahlung', 0);
END;
/

BEGIN
    INSERT INTO person (peid, name, vorname, geschlecht, telefonnummer, adresse, email, geburtsdatum, nationalität, sprache, oid)
    VALUES (1, 'Müller', 'Anna', 'weiblich', '0301234567', 'Straße 1, 10115 Berlin', 'anna.mueller@example.com', TO_DATE('1985-06-15', 'YYYY-MM-DD'), 'Deutschland', 'Deutsch', 1);
    
    INSERT INTO person (peid, name, vorname, geschlecht, telefonnummer, adresse, email, geburtsdatum, nationalität, sprache, oid)
    VALUES (2, 'Meier', 'Max', 'männlich', '0447894561', 'Bahnhofstrasse 5, 8000 Zürich', 'max.meier@example.ch', TO_DATE('1990-04-22', 'YYYY-MM-DD'), 'Schweiz', 'Deutsch', 2);
    
    INSERT INTO person (peid, name, vorname, geschlecht, telefonnummer, adresse, email, geburtsdatum, nationalität, sprache, oid)
    VALUES (3, 'Durand', 'Jean', 'männlich', '+33123456789', 'Rue de Rivoli 20, 75001 Paris', 'jean.durand@example.fr', TO_DATE('1978-09-10', 'YYYY-MM-DD'), 'Frankreich', 'Französisch', 3);
END;
/

BEGIN
    INSERT INTO rolle (roid, name, beschreibung) VALUES (1, 'Gast', 'Hotelgast');
    INSERT INTO rolle (roid, name, beschreibung) VALUES (2, 'Mitarbeiter', 'Hotelmitarbeiter');
    INSERT INTO rolle (roid, name, beschreibung) VALUES (3, 'Manager', 'Hotelmanager');
END;
/

BEGIN
    INSERT INTO person_rolle (peid, roid, registrierungsdatum, startdatum, enddatum)
    VALUES (1, 1, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL);
    
    INSERT INTO person_rolle (peid, roid, registrierungsdatum, startdatum, enddatum)
    VALUES (2, 1, TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2022-02-15', 'YYYY-MM-DD'), NULL);
    
    INSERT INTO person_rolle (peid, roid, registrierungsdatum, startdatum, enddatum)
    VALUES (3, 1, TO_DATE('2022-03-10', 'YYYY-MM-DD'), TO_DATE('2022-03-10', 'YYYY-MM-DD'), NULL);
END;
/

BEGIN
    INSERT INTO hotel (hid, name, adresse, bewertung, sterne, kette, zimmer_anzahl, telefonnummer, email, website, baujahr, standortbeschreibung, beschreibung, oid, bqid)
    VALUES (1, 'Hotel Berlin', 'Straße 2, 10115 Berlin', 4, 4, 'Berlin Hotels', 120, '0309876543', 'info@hotelberlin.de', 'www.hotelberlin.de', 1995, 'Im Zentrum von Berlin', 'Modernes 4-Sterne-Hotel', 1, 1);
    
    INSERT INTO hotel (hid, name, adresse, bewertung, sterne, kette, zimmer_anzahl, telefonnummer, email, website, baujahr, standortbeschreibung, beschreibung, oid, bqid)
    VALUES (2, 'Grand Hotel Zürich', 'Bahnhofstrasse 10, 8000 Zürich', 5, 5, 'Swiss Luxury Hotels', 200, '0449876543', 'contact@grandhotelzurich.ch', 'www.grandhotelzurich.ch', 1980, 'Luxus im Herzen von Zürich', 'Elegantes 5-Sterne-Hotel', 2, 2);
    
    INSERT INTO hotel (hid, name, adresse, bewertung, sterne, kette, zimmer_anzahl, telefonnummer, email, website, baujahr, standortbeschreibung, beschreibung, oid, bqid)
    VALUES (3, 'Hôtel Parisien', 'Champs-Élysées 5, 75001 Paris', 4, 4, 'French Hospitality', 150, '+33198765432', 'contact@hotelparisien.fr', 'www.hotelparisien.fr', 1970, 'Boutique Hotel in Paris', 'Charmantes 4-Sterne-Hotel', 3, 3);
END;
/

BEGIN
    INSERT INTO ausstattung (aid, name, beschreibung) VALUES (1, 'WLAN', 'Schnelles Internet');
    INSERT INTO ausstattung (aid, name, beschreibung) VALUES (2, 'Frühstück', 'Kontinentales Frühstück');
    INSERT INTO ausstattung (aid, name, beschreibung) VALUES (3, 'Parkplatz', 'Kostenlose Parkplätze');
END;
/

BEGIN
    INSERT INTO zimmer (zid, zimmernummer, kapazität, kategorie, zimmerpreis, status, beschreibung, hid)
    VALUES (1, '101', 2, 'Deluxe', 150, 'frei', 'Großes Doppelzimmer mit Blick auf die Stadt', 1);
    
    INSERT INTO zimmer (zid, zimmernummer, kapazität, kategorie, zimmerpreis, status, beschreibung, hid)
    VALUES (2, '102', 2, 'Standard', 100, 'frei', 'Standardzimmer mit Queen-Size-Bett', 1);
    
    INSERT INTO zimmer (zid, zimmernummer, kapazität, kategorie, zimmerpreis, status, beschreibung, hid)
    VALUES (3, '201', 2, 'Executive', 200, 'besetzt', 'Luxuriöses Zimmer mit großem Balkon', 2);
    
    INSERT INTO zimmer (zid, zimmernummer, kapazität, kategorie, zimmerpreis, status, beschreibung, hid)
    VALUES (4, '202', 1, 'Einzelzimmer', 120, 'frei', 'Einzelzimmer mit Dusche', 2);
    
    INSERT INTO zimmer (zid, zimmernummer, kapazität, kategorie, zimmerpreis, status, beschreibung, hid)
    VALUES (5, '301', 2, 'Superior', 180, 'besetzt', 'Zimmer mit Aussicht auf den Eiffelturm', 3);
END;
/

BEGIN
    INSERT INTO person_rolle (peid, roid, registrierungsdatum, startdatum, enddatum)
    VALUES (1, 1, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL);
    
    INSERT INTO person_rolle (peid, roid, registrierungsdatum, startdatum, enddatum)
    VALUES (2, 1, TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2022-02-15', 'YYYY-MM-DD'), NULL);
    
    INSERT INTO person_rolle (peid, roid, registrierungsdatum, startdatum, enddatum)
    VALUES (3, 1, TO_DATE('2022-03-10', 'YYYY-MM-DD'), TO_DATE('2022-03-10', 'YYYY-MM-DD'), NULL);
END;
/

BEGIN
    INSERT INTO zimmer_ausstattung (zid, aid)
    VALUES (1, 1);
    
    INSERT INTO zimmer_ausstattung (zid, aid)
    VALUES (1, 2);
    
    INSERT INTO zimmer_ausstattung (zid, aid)
    VALUES (2, 1);
    
    INSERT INTO zimmer_ausstattung (zid, aid)
    VALUES (2, 3);
    
    INSERT INTO zimmer_ausstattung (zid, aid)
    VALUES (3, 1);
    
    INSERT INTO zimmer_ausstattung (zid, aid)
    VALUES (3, 2);
    
    INSERT INTO zimmer_ausstattung (zid, aid)
    VALUES (4, 1);
END;
/

BEGIN
    INSERT INTO einrichtung (eid, name, beschreibung)
    VALUES (1, 'WLAN', 'Schnelles Internet in allen Bereichen');
    
    INSERT INTO einrichtung (eid, name, beschreibung)
    VALUES (2, 'Frühstück', 'Kontinentales Frühstücksbuffet');
    
    INSERT INTO einrichtung (eid, name, beschreibung)
    VALUES (3, 'Fitnessstudio', 'Modernes Fitnessstudio mit hochwertigen Geräten');
    
    INSERT INTO einrichtung (eid, name, beschreibung)
    VALUES (4, 'Konferenzräume', 'Räume für Meetings und Veranstaltungen');
    
    INSERT INTO einrichtung (eid, name, beschreibung)
    VALUES (5, 'Spa', 'Wellness- und Spa-Bereich mit Sauna und Massagen');
END;
/

BEGIN
    INSERT INTO hotel_einrichtung (hid, eid, anzahl)
    VALUES (1, 1, 20);
    
    INSERT INTO hotel_einrichtung (hid, eid, anzahl)
    VALUES (1, 2, 100);
    
    INSERT INTO hotel_einrichtung (hid, eid, anzahl)
    VALUES (2, 1, 30);
    
    INSERT INTO hotel_einrichtung (hid, eid, anzahl)
    VALUES (3, 1, 25);
END;
/

BEGIN
    INSERT INTO preisregel (prid, saison, startdatum, enddatum, preis, rabatt, zid)
    VALUES (1, 'Sommer', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 150, 10, 1);
    
    INSERT INTO preisregel (prid, saison, startdatum, enddatum, preis, rabatt, zid)
    VALUES (2, 'Winter', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2024-02-28', 'YYYY-MM-DD'), 120, 15, 2);
    
    INSERT INTO preisregel (prid, saison, startdatum, enddatum, preis, rabatt, zid)
    VALUES (3, 'Frühling', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-05-31', 'YYYY-MM-DD'), 200, 5, 3);
END;
/

BEGIN
    INSERT INTO reservation (rid, status, checkin_datum, checkout_datum, reservierungs_datum, gast_bewertung, zid, peid)
    VALUES (1, 'abgeschlossen', TO_DATE('2023-07-28', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-07-15', 'YYYY-MM-DD'), 'Sehr gut', 1, 1);
    
    INSERT INTO reservation (rid, status, checkin_datum, checkout_datum, reservierungs_datum, gast_bewertung, zid, peid)
    VALUES (2, 'abgeschlossen', TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('2023-09-15', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 'Gut', 2, 2);
    
    INSERT INTO reservation (rid, status, checkin_datum, checkout_datum, reservierungs_datum, gast_bewertung, zid, peid)
    VALUES (3, 'offen', TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-10', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'), NULL, 3, 3);
END;
/

BEGIN
    INSERT INTO bezahlung (bid, betrag, zahlungs_status, zahlungsdatum, rechnungsnummer, rid, bmid, bqid)
    VALUES (1, 150.00, 'bezahlt', TO_DATE('2023-08-01', 'YYYY-MM-DD'), 'R001', 1, 1, 1);
    
    INSERT INTO bezahlung (bid, betrag, zahlungs_status, zahlungsdatum, rechnungsnummer, rid, bmid, bqid)
    VALUES (2, 100.00, 'bezahlt', TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'R002', 2, 2, 2);
    
    INSERT INTO bezahlung (bid, betrag, zahlungs_status, zahlungsdatum, rechnungsnummer, rid, bmid, bqid)
    VALUES (3, 180.00, 'offen', TO_DATE('2023-10-10', 'YYYY-MM-DD'), 'R003', 3, 3, 3);
END;
/