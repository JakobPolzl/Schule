-- 1
select nachname, vorname, Coalesce(stipendiumbetrag, 0)
from schueler;

-- 2
select nachname,
case 
    when gehalt > 2400 then 'Reich'
    when gehalt > 1500 then 'Arm'
    when gehalt <= 1500 then 'Sehr Arm'
    else 'Unbekannt'
end as Gkategorie
from lehrer;

-- 3
select replace(nachname, 'ü', 'ue')
from schueler;

-- 4
select nachname
from schueler
where upper(nachname) like 'MUELLER' or upper(nachname) like 'MÜLLER';

-- 5
select vorname, nachname, substr(sprechstunde, 1, 3) as Tag, substr(sprechstunde, 4) as Stunde
from lehrer;

-- 6
select nachname, substr(emailadresse, 1, instr(emailadresse, '@') - 1) as EmailFirst, substr(emailadresse, instr(emailadresse, '@') + 1, length(emailadresse)) as EmailLast
from schueler
where emailadresse is not null;

-- 7
select schueler.nachname, lehrer.nachname, schueler.gebdat
from lehrer, schueler
where extract(day from schueler.gebdat) = extract(day from to_date(lehrer.gebdat, 'yyyy.mm.dd')) and 
      extract(month from schueler.gebdat) = extract(month from to_date(lehrer.gebdat, 'yyyy.mm.dd'));

--   8
select nachname, substr("Strasse und Ort", 1, instr("Strasse und Ort", ';') - 1) as Strasse, substr("Strasse und Ort", instr("Strasse und Ort", ';') + 1, length("Strasse und Ort")) as Ort
from schueler;

--   9
select substr(substr("Strasse und Ort", 1, instr("Strasse und Ort", ';')), 1, instr("Strasse und Ort", ' ')) as Strasse,
trim(substr(substr("Strasse und Ort", 1, instr("Strasse und Ort", ';') - 1), instr("Strasse und Ort", ' '))) as Nummer,
trim(substr("Strasse und Ort", instr("Strasse und Ort", ';') + 1)) as Ort
from schueler;