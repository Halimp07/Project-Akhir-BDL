CREATE TABLE PELAMAR (	
    ID_PELAMAR NUMBER(20,0), 
	NAMA VARCHAR2(50 BYTE), 
	NO_TELP NUMBER(20,0), 
	KOTA VARCHAR2(50 BYTE), 
	ALAMAT VARCHAR2(50 BYTE), 
	EMAIL VARCHAR2(50 BYTE)
    )
-- DROP TABLE LOWONGAN;
-- DROP TABLE TRANSAKSI;
-- DROP TABLE PELAMAR;

CREATE TABLE LOWONGAN (	
    ID_LOWONGAN NUMBER(15,0), 
	NAMA_PEKERJAAN VARCHAR2(80 BYTE), 
	PERUSAHAAN VARCHAR2(50 BYTE), 
	LOWONGAN_TERSEDIA NUMBER(10,0)
)

CREATE TABLE TRANSAKSI (	
    ID_TRANSAKSI NUMBER(15,0), 
	ID_PELAMAR NUMBER(20,0), 
	ID_LOWONGAN NUMBER(15, 0), 
    KETERANGAN VARCHAR2(10 BYTE),
	TANGGAL DATE
)

--Procedure registrasi_pelamar
CREATE OR REPLACE PROCEDURE registrasi_pelamar
(
    ID_PELAMAR_ IN NUMBER, 
	NAMA_ IN VARCHAR2, 
	NO_TELP_ IN NUMBER, 
	KOTA_ IN VARCHAR2, 
	ALAMAT_ IN VARCHAR2, 
	EMAIL_ IN VARCHAR2,
    _ACTION IN VARCHAR2
)
IS
BEGIN    
    IF LOWER(_ACTION) = 'insert'
    THEN
        INSERT INTO PELAMAR VALUES (ID_PELAMAR_, NAMA_, NO_TELP_, KOTA_, ALAMAT_, EMAIL_);
    ELSIF LOWER(_ACTION) = 'update'
    THEN
        UPDATE PELAMAR SET NAMA=NAMA_, NO_TELP=NO_TELP_, KOTA=KOTA_, ALAMAT=ALAMAT_, EMAIL=EMAIL_ WHERE ID_PELAMAR=ID_PELAMAR_;
    ELSIF LOWER(_ACTION) = 'delete'
    THEN
        DELETE PELAMAR WHERE ID_PELAMAR=ID_PELAMAR_;
    END IF;
    COMMIT;
END registrasi_pelamar;

--Procedure registrasi_lowongan
CREATE OR REPLACE PROCEDURE registrasi_lowongan
(
    ID_LOWONGAN_ IN NUMBER, 
	NAMA_PEKERJAAN_ IN VARCHAR2, 
	PERUSAHAAN_ IN VARCHAR2, 
	LOWONGAN_TERSEDIA_ IN NUMBER,
    _ACTION IN VARCHAR2
)
IS
BEGIN
    IF LOWER(_ACTION) = 'insert'
    THEN
        INSERT INTO LOWONGAN VALUES (ID_LOWONGAN_, NAMA_PEKERJAAN_, PERUSAHAAN_, LOWONGAN_TERSEDIA_);
    ELSIF LOWER(_ACTION) = 'update'
    THEN
        UPDATE LOWONGAN SET NAMA_PEKERJAAN=NAMA_PEKERJAAN_, PERUSAHAAN=PERUSAHAAN_, LOWONGAN_TERSEDIA=LOWONGAN_TERSEDIA_ WHERE ID_LOWONGAN=ID_LOWONGAN_;
    ELSIF LOWER(_ACTION) = 'delete'
    THEN
        DELETE LOWONGAN WHERE ID_LOWONGAN=ID_LOWONGAN_;
    END IF;
    COMMIT;
END registrasi_LOWONGAN;

--Procedure transaksi
CREATE OR REPLACE PROCEDURE transaksi
(
    ID_TRANSAKSI_ IN NUMBER, 
	ID_PELAMAR_ IN NUMBER, 
	ID_LOWONGAN_ IN NUMBER, 
    KETERANGAN_ IN VARCHAR2,
	TANGGAL_ IN DATE,
    _ACTION IN VARCHAR2
)
IS
BEGIN
    IF LOWER(_ACTION) = 'insert'
    THEN
        INSERT INTO TRANSAKSI VALUES (ID_TRANSAKSI_, ID_PELAMAR_, ID_LOWONGAN_, KETERANGAN_, TANGGAL_);
    ELSIF LOWER(_ACTION) = 'update'
    THEN
        UPDATE TRANSAKSI SET ID_PELAMAR=ID_PELAMAR_, ID_LOWONGAN=ID_LOWONGAN_, KETERANGAN=KETERANGAN_, TANGGAL=TANGGAL_ WHERE ID_TRANSAKSI=ID_TRANSAKSI_;
    ELSIF LOWER(_ACTION) = 'delete'
    THEN
        DELETE TRANSAKSI WHERE ID=ID_;
    END IF;
    COMMIT;
END transaksi_TRANSAKSI;

SELECT T.ID_TRANSAKSI, L.NAMA_PEKERJAAN AS NAMA_PEKERJAAN, P.NAMA AS NAMA_PELAMAR, T.TANGGAL FROM TRANSAKSI T, PELAMAR P, LOWONGAN L WHERE T.ID_LOWONGAN=L.ID_LOWONGAN AND T.ID_PELAMAR=P.ID_PELAMAR
SELECT T.ID_TRANSAKSI, L.NAMA_PEKERJAAN AS NAMA_PEKERJAAN, P.NAMA AS NAMA_PELAMAR, T.KETERANGAN, T.TANGGAL FROM TRANSAKSI T, PELAMAR P, LOWONGAN L WHERE T.ID_LOWONGAN=L.ID_LOWONGAN AND T.ID_PELAMAR=P.ID_PELAMAR AND  