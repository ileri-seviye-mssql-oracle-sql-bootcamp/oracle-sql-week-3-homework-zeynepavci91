--WEEK3--  
alter table sys.kitap add kitap_stok varchar2(255)
alter table sys.kitap add kitap_bask� varchar2(255)

update sys.kitap set kitap_stok='Yok' where kitap_id=1
update sys.kitap set kitap_stok='Yok' where kitap_id in('6','8')

update sys.kitap set kitap_bask�='58.Bask�' where kitap_id=1
update sys.kitap set kitap_bask�='45.Bask�' where kitap_id=2
update sys.kitap set kitap_bask�='23.Bask�' where kitap_id=3
update sys.kitap set kitap_bask�='25.Bask�' where kitap_id=4
update sys.kitap set kitap_bask�='106.Bask�' where kitap_id=5
update sys.kitap set kitap_bask�='4.Bask�' where kitap_id=6
update sys.kitap set kitap_bask�='12.Bask�' where kitap_id=7
update sys.kitap set kitap_bask�='2.Bask�' where kitap_id=8


Insert into sys.kitap (kitap_id,kitap_adi,kitap_fiyat,kitap_tur,yazar_id) values (6,'Satran�',8,'Modern Klasik',006);
Insert into sys.kitap (kitap_id,kitap_adi,kitap_fiyat,kitap_tur,yazar_id) values (7,'Ay I���� Soka��',7,'Modern Klasik',007);
Insert into sys.kitap (kitap_id,kitap_adi,kitap_fiyat,kitap_tur,yazar_id) values (8,'Oz B�y�c�s�',12,'Modern Klaisk',008);  
Insert into sys.kitap (kitap_id,kitap_adi,kitap_fiyat,kitap_tur,yazar_id,kitap_stok,kitap_bask�) values (9,'Harry Potter',30,'Fantastik',003,'Yok','1.Bask�');
Insert into sys.kitap (kitap_id,kitap_adi,kitap_fiyat,kitap_tur,yazar_id,kitap_stok,kitap_bask�) values (10,'Yuzuklerin Efendisi',40,'Fantastik',004,'Yok','1.bask�');

Insert into sys.yazar (yazar_id, yazar_isim, yazar_soyadi, yazar_puan, yayinevi_id) values (006,'Stefan','Zweig',7,'02');
Insert into sys.yazar (yazar_id, yazar_isim, yazar_soyadi, yazar_puan, yayinevi_id) values (007,'Stefan','Zweig',7,'03');
Insert into sys.yazar (yazar_id, yazar_isim, yazar_soyadi, yazar_puan, yayinevi_id) values (008,'L. Frank','Baum',8,'03');

Insert into sys.yayinevi (yayinevi_id,yayinevi_isim, yayinevi_adres, yayinevi_bolge, yayinevi_sube_sayisi) values(04,'K�rm�z� Kedi','�stanbul','Marmara',57);
Insert into sys.yayinevi (yayinevi_id,yayinevi_isim, yayinevi_adres, yayinevi_bolge, yayinevi_sube_sayisi) values(05,'Yabanc�','�stanbul','Marmara',22);
Insert into sys.yayinevi (yayinevi_id,yayinevi_isim, yayinevi_adres, yayinevi_bolge, yayinevi_sube_sayisi) values(06,'Artemis','�stanbul','Marmara',102);
Insert into sys.yayinevi (yayinevi_id,yayinevi_isim, yayinevi_adres, yayinevi_bolge, yayinevi_sube_sayisi) values(07,'Remzi Kitabevi','Ankara','�� Anadolu',205);
Insert into sys.yayinevi (yayinevi_id,yayinevi_isim, yayinevi_adres, yayinevi_bolge, yayinevi_sube_sayisi) values(08,'NTV','�stanbul','Marmara',60);

select * from sys.kitap
select * from sys.yazar
select * from sys.yayinevi

--4 JOIN--
select d�st�nct(k.yazar_id),k.kitap_adi, y.yazar_isim from sys.kitap k 
inner join sys.yazar y on y.yazar_id=k.yazar_id
order by k.yazar_id

select d�st�nct(k.yazar_id),k.kitap_adi, y.yazar_isim from sys.kitap k 
inner join sys.yazar y on y.yazar_id=k.yazar_id
where yazar_isim like 'J%'

select y.yazar_id,ye.yayinevi_id,y.yazar_isim,y.yazar_soyad� from sys.yazar y
left join sys.yayinevi ye on ye.yayinevi_id=y.yayinevi_id
where ye.yayinevi_id=3
order by yazar_id

select y.yazar_id,ye.yayinevi_id,y.yazar_soyad�,y.yazar_puan from sys.yazar y
left join sys.yayinevi ye on ye.yayinevi_id=y.yayinevi_id
where y.yazar_puan>8
order by yazar_puan

--4 COMBINE--
select k.yazar_id, k.kitap_adi,y.yazar_isim,k.kitap_stok from sys.kitap k
inner join sys.yazar y on y.yazar_id=k.yazar_id
where k.kitap_stok='Var'
UNION
select k.yazar_id, k.kitap_adi,y.yazar_isim,k.kitap_stok from sys.kitap k
inner join sys.yazar y on y.yazar_id=k.yazar_id
where k.kitap_stok='Yok'

select * from sys.kitap k where k.kitap_stok <> 'Var'
MINUS
select * from sys.kitap k where k.kitap_stok <> 'Yok'

select * from sys.kitap k where k.kitap_stok='Var'
INTERSECT
select * from sys.kitap k where k.kitap_tur='Fantastik'

select k.yazar_id, k.kitap_adi,y.yazar_isim,k.kitap_tur from sys.kitap k
inner join sys.yazar y on y.yazar_id=k.yazar_id
where k.kitap_tur='Klasik'
UNION ALL
select k.yazar_id, k.kitap_adi,y.yazar_isim,k.kitap_tur from sys.kitap k
inner join sys.yazar y on y.yazar_id=k.yazar_id
where k.kitap_tur='Modern Klasik'

--15-20 adet tek sat�r fonksiyonu--

--LENGTH
select length('Y�z�klerin Efendisi:Y�z�k Karde�li�i') from dual;
select length('Y�z�klerin Efendisi:�ki Kule') from dual;

--SUBSTR
select substr('Y�z�klerin Efendisi:Y�z�k Karde�li�i',0,5) from dual;
select substr('Y�z�klerin Efendisi:Y�z�k Karde�li�i',12,8) from dual;

--INSTR
select instr('Y�z�klerin Efendisi:Y�z�k Karde�li�i','�') from dual;
select instr('Y�z�klerin Efendisi:Y�z�k Karde�li�i','�') from dual;
select instr('Y�z�klerin Efendisi:Y�z�k Karde�li�i','�',1,3) from dual;

--LPAD
select lpad('Y�z�klerin Efendisi:Y�z�k Karde�li�i',8,'-') from dual;
select lpad('Star Wars',5,'-') from dual;

--RPAD
select rpad('Mustafa Kemal Atat�rk',9,'-') from dual;

--TRIM
select trim(leading '2' from '222710095555986611555') from dual;
select trim(trailing '5' from '222710095555986611555') from dual;
select trim(both '0' from '00222710095555986611000') from dual;

--REPLACE
select replace ('Happy New Year:) HO HO HO','HO HO HO') from dual;
select replace('Happy New Year','New Year','Birthday') from dual;

--UPPER,LOWER,INITCAP
select upper('harry potter') from dual;
select lower('HARRY POTTER') from dual;
select initcap('HARRY POTTER') from dual;

--ROUND,TRUNC,CEIL
select round(9.1234) from dual;
select trunc(9.123456) from dual;
select ceil(9.1234) from dual;

--MOD
select mod (19,3) from dual;

--NEXT DAY, LAST DAY
select to_char(sysdate,'Day') from dual;
select to_char(sysdate,'Month') from dual;
select to_char(sysdate,'Year') from dual;

