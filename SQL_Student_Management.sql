-- 1 Create
CREATE TABLE Students 
(
	StudentID VARCHAR(5) Primary key,
	StudentName VARCHAR(200) NOT NULL,
	Gender CHAR(10) NOT NULL,
	DateOfBirth DATE NOT NULL
);
-- 2 Create
INSERT INTO Students(StudentID,StudentName,Gender,DateOfBirth)
VALUES ('ST001','Koy Dara','Male','1999-01-03');
INSERT INTO Students(StudentID,StudentName,Gender,DateOfBirth)
VALUES ('ST002','Mork Pisey','Female','1995-12-15');
INSERT INTO Students(StudentID,StudentName,Gender,DateOfBirth)
VALUES ('ST003','Pin Mony','Male','1998-02-01');
INSERT INTO Students(StudentID,StudentName,Gender,DateOfBirth)
VALUES ('ST004','Bin Nita','Male','1997-02-25');
INSERT INTO Students(StudentID,StudentName,Gender,DateOfBirth)
VALUES ('ST005','Chin Sothy','Female','1997-05-01');

CREATE NONCLUSTERED INDEX idx_Sd
on Students 
(
	StudentName asc
)
SELECT * FROM Students
-- 3 Create Table
CREATE TABLE Subjects
(
	SubjectID VARCHAR(5) Primary key,
	SubjectName NVARCHAR(200) NOT NULL,
);
insert into Subjects(SubjectID,SubjectName)
VALUES ('SUB01',N'រូបវិទ្យា')
insert into Subjects(SubjectID,SubjectName)
VALUES ('SUB02',N'ភាសាខ្មែរ')
insert into Subjects(SubjectID,SubjectName)
VALUES ('SUB03',N'គណិតវិទ្យា')
insert into Subjects(SubjectID,SubjectName)
VALUES ('SUB04',N'ជីវវិទ្យា')
insert into Subjects(SubjectID,SubjectName)
VALUES ('SUB05',N'គីមីវិទ្យា')

SELECT * FROM Subjects

CREATE NONCLUSTERED INDEX idx_Sb
on Subjects
(
	SubjectName asc
)

-- 4 Create tbl Result
CREATE TABLE Results
(
	ID INT IDENTITY(1,1) Primary key,
	StudentID VARCHAR(5) ,
	SubjectID VARCHAR(5) ,
	Score float 
);
INSERT INTO Results (StudendtID,SubjectID,Score)
VALUES ('ST001','SUB01',90.00)
INSERT INTO Results (StudendtID,SubjectID,Score)
VALUES ('ST001','SUB02',35.00)
INSERT INTO Results (StudendtID,SubjectID,Score)
VALUES ('ST002','SUB01',50.00)
INSERT INTO Results (StudendtID,SubjectID,Score)
VALUES ('ST002','SUB02',75.00)
INSERT INTO Results (StudendtID,SubjectID,Score)
VALUES ('ST003','SUB01',45.00)
INSERT INTO Results (StudendtID,SubjectID,Score)
VALUES ('ST003','SUB02',65.00)
INSERT INTO Results (StudendtID,SubjectID,Score)
VALUES ('ST004','SUB01',23.00)
INSERT INTO Results (StudendtID,SubjectID,Score)
VALUES ('ST004','SUB02',58.00)
INSERT INTO Results (StudendtID,SubjectID,Score)
VALUES ('ST005','SUB01',21.00)
INSERT INTO Results (StudendtID,SubjectID,Score)
VALUES ('ST005','SUB02',58.00)

SELECT * FROM Results

-- 5
ALTER TABLE Results
ADD CONSTRAINT FK_Staff_ST
	FOREIGN KEY (StudentID)
	REFERENCES Students(StudentID);

ALTER TABLE Results
ADD CONSTRAINT FK_Staff_SB
	FOREIGN KEY (SubjectID)
	REFERENCES Subjects(SubjectID);
--6
create function GetResults(@average decimal(6,2))
returns varchar(10) as begin 
	declare @result varchar(10)
	if @average<250
		set @result='Fail';
	else 
		set @result='Pass';
	return @result
end;