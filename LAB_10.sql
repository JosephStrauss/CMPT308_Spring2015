----------------------------------------------------------------------------------------
-- Courses and Prerequisites
-- by Alan G. Labouseur
-- Tested on Postgres 9.3.2
----------------------------------------------------------------------------------------

--
-- The table of courses.
--
create table Courses (
    num      integer not null,
    name     text    not null,
    credits  integer not null,
  primary key (num)
);


insert into Courses(num, name, credits)
values (499, 'CS/ITS Capping', 3 );

insert into Courses(num, name, credits)
values (308, 'Database Systems', 4 );

insert into Courses(num, name, credits)
values (221, 'Software Development Two', 4 );

insert into Courses(num, name, credits)
values (220, 'Software Development One', 4 );

insert into Courses(num, name, credits)
values (120, 'Introduction to Programming', 4);

select * 
from courses
order by num ASC;


--
-- Courses and their prerequisites
--
create table Prerequisites (
    courseNum integer not null references Courses(num),
    preReqNum integer not null references Courses(num),
  primary key (courseNum, preReqNum)
);

insert into Prerequisites(courseNum, preReqNum)
values (499, 308);

insert into Prerequisites(courseNum, preReqNum)
values (499, 221);

insert into Prerequisites(courseNum, preReqNum)
values (308, 120);

insert into Prerequisites(courseNum, preReqNum)
values (221, 220);

insert into Prerequisites(courseNum, preReqNum)
values (220, 120);

select *
from Prerequisites
order by courseNum DESC;


--
-- An example stored procedure ("function")
--
create or replace function get_courses_by_credits(int, REFCURSOR) returns refcursor as 
$$
declare
   num_credits int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select num, name, credits
      from   courses
       where  credits >= num_credits;
   return resultset;
end;
$$ 
language plpgsql;

select get_courses_by_credits(0, 'results');
Fetch all from results;


-----------------------------------------------
-- JOE STRAUSS
-- LAB 10
-- SPRING 2015
-----------------------------------------------

--                                            __
--                        ____               /._\
--                        \__<---____________X__/                  -Row
--                    .-^"~___~Z"^-._`'_____ ___~-.______
--       ___,.---==='~[~~7^___^\"-._ 7~_____H__||"-. \__.^~""~"-------...,__
--   .--^---+-----------Y /\_/\ Y--^Y [_____H__||   ^._______/"~~~~"^------^---,-
--   |______|___________l [/ \] !___l       H  "^----z^------^----------------{
--    "~^----....________\^---^/_____\      H    _.-~_____________,...---------^
--                       ~"---"~     ~"-----"---^~~~"
-- 
--                       "Millenium Falcon"
--                       Modified Corellian YT-1300 Transport


-- 1.
-- This Function returns the immediate pre-requisites for the
-- passed-in course number.

-- For TESTING
-- DROP FUNCTION PreReqsFor(int, REFCURSOR);

create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as
$$
declare
    courseNum int := $1;
    resultset REFCURSOR := $2;
begin
   open resultset for
	SELECT num, name, credits
	FROM Courses
	WHERE num in (SELECT prereqnum
		      FROM Prerequisites
		      Where $1 = Prerequisites.coursenum);
   return resultset;
end;
$$
LANGUAGE plpgsql;

select PreReqsFor(308, 'results');
Fetch all from results;


-- 2.
-- This Function returns the courses for which the passed-in
-- course number is a immediate pre-requisites;

-- For TESTING
-- DROP FUNCTION PreReqsFor(int, REFCURSOR);

create or replace function IsPreReqsFor(int, REFCURSOR) returns refcursor as
$$
declare
    courseNum int := $1;
    resultset REFCURSOR := $2;
begin
   open resultset for
	SELECT num, name, credits
	FROM Courses
	WHERE num in (SELECT Prerequisites.courseNum
		      FROM Prerequisites
		      Where $1 = Prerequisites.PreReqNum);
   return resultset;
end;
$$
LANGUAGE plpgsql;

select IsPreReqsFor(120, 'results');
Fetch all from results;
