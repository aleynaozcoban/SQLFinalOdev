
-- \c EğitimPlatformu

CREATE TABLE Members (
    kullaniciID SERIAL PRIMARY KEY,
    kullaniciAdi VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    sifre VARCHAR(255) NOT NULL,
    kayitTarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    adi VARCHAR(50) NOT NULL,
    soyadi VARCHAR(50) NOT NULL
);

CREATE TABLE Categories (
    kategoriID SERIAL PRIMARY KEY,
    kategoriAdi VARCHAR(100) NOT NULL
);

INSERT INTO Categories (kategoriAdi) 
VALUES ('Yapay Zeka'), ('Blokzincir'), ('Siber Güvenlik');

CREATE TABLE Courses (
    egitimID SERIAL PRIMARY KEY,
    egitimAdi VARCHAR(200) NOT NULL,
    aciklama TEXT NOT NULL,
    baslangicTarihi DATE NOT NULL,
    bitisTarihi DATE NOT NULL,
    egitmen VARCHAR(100) NOT NULL,
    kategoriID INT,
    FOREIGN KEY (kategoriID) REFERENCES Categories(kategoriID)
);

CREATE TABLE Enrollments (
    katilimID SERIAL PRIMARY KEY,
    kullaniciID INT NOT NULL,
    egitimID INT NOT NULL,
    katilimTarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (kullaniciID) REFERENCES Members(kullaniciID),
    FOREIGN KEY (egitimID) REFERENCES Courses(egitimID)
);


CREATE TABLE Certificates (
    sertifikaID SERIAL PRIMARY KEY,
    sertifikaKodu VARCHAR(100) UNIQUE NOT NULL,
    verilisTarih DATE NOT NULL
);


CREATE TABLE CertificateAssignments (
    atamaID SERIAL PRIMARY KEY,
    kullaniciID INT NOT NULL,
    sertifikaID INT NOT NULL,
    alimTarihi DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (kullaniciID) REFERENCES Members(kullaniciID),
    FOREIGN KEY (sertifikaID) REFERENCES Certificates(sertifikaID)
);


CREATE TABLE BlogPosts (
    blogID SERIAL PRIMARY KEY,
    baslik VARCHAR(255) NOT NULL,
    icerik TEXT NOT NULL,
    yayinTarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    yazarID INT NOT NULL,
    FOREIGN KEY (yazarID) REFERENCES Members(kullaniciID)
);
