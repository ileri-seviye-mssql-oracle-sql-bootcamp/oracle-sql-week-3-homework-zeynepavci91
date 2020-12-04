--WEEK3--  
alter table sys.kitap add kitap_stok varchar2(255)
alter table sys.kitap add kitap_baský varchar2(255)

update sys.kitap set kitap_stok='Yok' where kitap_id=1
update sys.kitap set kitap_stok='Yok' where kitap_id in('6','8')

update sys.kitap set kitap_baský='58.Baský' where kitap_id=1
update sys.kitap set kitap_baský='45.Baský' where kitap_id=2
update sys.kitap set kitap_baský='23.Baský' where kitap_id=3
update sys.kitap set kitap_baský='25.Baský' where kitap_id=4
update sys.kitap set kitap_baský='106.Baský' where kitap_id=5
update sys.kitap set kitap_baský='4.Baský' where kitap_id=6
update sys.kitap set kitap_baský='12.Baský' where kitap_id=7
update sys.kitap set kitap_baský='2.Baský' where kitap_id=8


Insert into sys.kitap (kitap_id,kitap_adi,kitap_fiyat,kitap_tur,yazar_id) values (6,'Satranç',8,'Modern Klasik',006);
Insert into sys.kitap (kitap_id,kitap_adi,kitap_fiyat,kitap_tur,yazar_id) values (7,'Ay Iþýðý Sokaðý',7,'Modern Klasik',007);
Insert into sys.kitap (kitap_id,kitap_adi,kitap_fiyat,kitap_tur,yazar_id) values (8,'Oz Büyücüsü',12,'Modern Klaisk',008);  
Insert into sys.kitap (kitap_id,kitap_adi,kitap_fiyat,kitap_tur,yazar_id,kitap_stok,kitap_baský) values (9,'Harry Potter',30,'Fantastik',003,'Yok','1.Baský');
Insert into sys.kitap (kitap_id,kitap_adi,kitap_fiyat,kitap_tur,yazar_id,kitap_stok,kitap_baský) values (10,'Yuzuklerin Efendisi',40,'Fantastik',004,'Yok','1.baský');

Insert into sys.yazar (yazar_id, yazar_isim, yazar_soyadi, yazar_puan, yayinevi_id) values (006,'Stefan','Zweig',7,'02');
Insert into sys.yazar (yazar_id, yazar_isim, yazar_soyadi, yazar_puan, yayinevi_id) values (007,'Stefan','Zweig',7,'03');
Insert into sys.yazar (yazar_id, yazar_isim, yazar_soyadi, yazar_puan, yayinevi_id) values (008,'L. Frank','Baum',8,'03');

Insert into sys.yayinevi (yayinevi_id,yayinevi_isim, yayinevi_adres, yayinevi_bolge, yayinevi_sube_sayisi) values(04,'Kýrmýzý Kedi','Ýstanbul','Marmara',57);
Insert into sys.yayinevi (yayinevi_id,yayinevi_isim, yayinevi_adres, yayinevi_bolge, yayinevi_sube_sayisi) values(05,'Yabancý','Ýstanbul','Marmara',22);
Insert into sys.yayinevi (yayinevi_id,yayinevi_isim, yayinevi_adres, yayinevi_bolge, yayinevi_sube_sayisi) values(06,'Artemis','Ýstanbul','Marmara',102);
Insert into sys.yayinevi (yayinevi_id,yayinevi_isim, yayinevi_adres, yayinevi_bolge, yayinevi_sube_sayisi) values(07,'Remzi Kitabevi','Ankara','Ýç Anadolu',205);
Insert into sys.yayinevi (yayinevi_id,yayinevi_isim, yayinevi_adres, yayinevi_bolge, yayinevi_sube_sayisi) values(08,'NTV','Ýstanbul','Marmara',60);

select * from sys.kitap
select * from sys.yazar
select * from sys.yayinevi

--4 JOIN--
select dýstýnct(k.yazar_id),k.kitap_adi, y.yazar_isim from sys.kitap k 
inner join sys.yazar y on y.yazar_id=k.yazar_id
order by k.yazar_id

select dýstýnct(k.yazar_id),k.kitap_adi, y.yazar_isim from sys.kitap k 
inner join sys.yazar y on y.yazar_id=k.yazar_id
where yazar_isim like 'J%'

select y.yazar_id,ye.yayinevi_id,y.yazar_isim,y.yazar_soyadý from sys.yazar y
left join sys.yayinevi ye on ye.yayinevi_id=y.yayinevi_id
where ye.yayinevi_id=3
order by yazar_id

select y.yazar_id,ye.yayinevi_id,y.yazar_soyadý,y.yazar_puan from sys.yazar y
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

--15-20 adet tek satýr fonksiyonu--

--LENGTH
select length('Yüzüklerin Efendisi:Yüzük Kardeþliði') from dual;
select length('Yüzüklerin Efendisi:Ýki Kule') from dual;

--SUBSTR
select substr('Yüzüklerin Efendisi:Yüzük Kardeþliði',0,5) from dual;
select substr('Yüzüklerin Efendisi:Yüzük Kardeþliði',12,8) from dual;

--INSTR
select instr('Yüzüklerin Efendisi:Yüzük Kardeþliði','ü') from dual;
select instr('Yüzüklerin Efendisi:Yüzük Kardeþliði','ð') from dual;
select instr('Yüzüklerin Efendisi:Yüzük Kardeþliði','ü',1,3) from dual;

--LPAD
select lpad('Yüzüklerin Efendisi:Yüzük Kardeþliði',8,'-') from dual;
select lpad('Star Wars',5,'-') from dual;

--RPAD
select rpad('Mustafa Kemal Atatürk',9,'-') from dual;

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

