--Author: Debopriya Deb Roy (190104065)
--Offline 1:

-- precautionary drop statement to run properly on any machine
drop table Student;
drop table Borrows;
drop table Book;
drop table Author;

--Ans to the Ques no 1:

-- crate table statements
create table Student(studentID number,name varchar2(50),phone varchar2(50),age number);
create table Borrows(studentID number, bookID number, dateBorrowed date);
create table Book(bookID number,authorID number,title varchar2(50), genre varchar2(50));
create table Author(authorID number,name varchar2(50), age number);

-- insert data into student table
insert into Student Values(190104065,'Debopriya Deb Roy','01990288897',22);
insert into Student Values(190104070,'Noumi Moyeen','01990288898',23);
insert into Student Values(190104053,'Tanzina Taher','01990288899',22);
insert into Student Values(190104003,'Sonjukta Sweta','01990288890',23);
insert into Student Values(190104083,'Aritra Das','01990288891',24);
-- insert data into borrows table
insert into Borrows Values(190104065,101,DATE'2022-04-05');
insert into Borrows Values(190104070,101,DATE'2022-07-06');
insert into Borrows Values(190104053,103,DATE'2022-03-05');
insert into Borrows Values(190104003,104,DATE'2022-09-02');
insert into Borrows Values(190104083,105,DATE'2022-06-06');
insert into Borrows Values(190104003,104,DATE'2022-09-03');
insert into Borrows Values(190104003,104,DATE'2022-09-10');
insert into Borrows Values(190104003,104,DATE'2022-09-11');
insert into Borrows Values(190104003,104,DATE'2022-09-12');
-- insert data into book table
insert into Book Values(101,1011,'Gulliver’s Travels','Fiction');
insert into Book Values(202,1012,' Chokher Bali','Fiction');
insert into Book Values(103,1013,'After Kurukshetra','Non Fiction');
insert into Book Values(104,1014,'Geetanjali','Literature');
insert into Book Values(105,1015,' Jagori: The Vigil','Non Fiction');
-- insert data into author table
insert into Author Values(1011,'Dr. Jonathon',68);
insert into Author Values(1012,'Rabindranath Tagore',55);
insert into Author Values(1013,'Mahasweta Devi',89);
insert into Author Values(1014,'Rabidranath Tagore',110);
insert into Author Values(1015,'Satinath Bhaduri',69);


--Ans to the Ques no 2(a):
select name from Student inner join Borrows on Student.studentID=Borrows.studentID inner join Book on Borrows.bookID=Book.bookID where title = 'Gulliver’s Travels';

--Ans to the Ques no 2(b):
select Max(age) from Author inner join Book on Book.authorID = Author.authorID where genre = 'Non Fiction';

--Ans to the Ques no 2(c):
select phone from Student inner join Borrows on Borrows.studentID =Student.studentID inner join Book on Borrows.bookID=Book.bookID where title = 'Geetanjali' group by (phone) having count(Borrows.studentID) > 2;