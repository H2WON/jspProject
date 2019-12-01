show databases;

create table member(
id varchar(20) not null primary key,
passwd varchar(15) not null,
name varchar(35) not null,
reg_date datetime not null);

desc member;

select * from member;

create table guestbook_gn(
no_gn int not null AUTO_INCREMENT primary key,
writer_gn varchar(35) not null ,
content_gn varchar(300) not null,
date_gn datetime not null);

desc guestbook_gn;

select * from guestbook_gn;

delete from member where id="";

update member set name="kimheewon" where id="id1";

create table gn_board(
gn_postid int not null AUTO_INCREMENT primary key,
gn_title varchar(100) not null,
gn_writer varchar(35) not null,
gn_content varchar(600) not null,
gn_date datetime not null,
gn_hit int,
gn_ref int,
gn_indent int,
gn_step int );

drop table gn_board;

desc gn_board;

select * from gn_board;

create table gn_reply(
gn_replyid int not null AUTO_INCREMENT primary key,
gn_rwriter varchar(35) not null,
gn_rcontent varchar(300) not null,
gn_rdate datetime not null,
gn_rpostid int not null);

select * from gn_reply;

desc gn_reply;
