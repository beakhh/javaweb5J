/* guest.sql */
show tables;

create table B_guest (
  idx  int not null auto_increment primary key,	/* 방명록 고유번호 */
  name varchar(20) not null, 		/* 방명록 작성자 성명 */
  mid varchar(20), 		/* 방명록 작성자 아이디 */
  content  text  not null,			/* 방명록 내용 */
  visitDate datetime default now(),	/* 방문일자 */
  hostIp 	 varchar(30) not null	/* 방문자 접속 IP */
);

desc guest;

insert into B_guest values (default,'관리자','admin','방명록 서비스를 시작합니다.',default,'192.168.50.20');

select * from B_guest;


/* 등업관련 */
create table B_gCount(
	idx  int not null auto_increment primary key,
	mid varchar(20),
	count  int default 0
);

drop table B_gCount;