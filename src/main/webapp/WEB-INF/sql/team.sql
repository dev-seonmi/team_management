-- 팀 테이블
use webtest;
drop table if exists team;
create table team (
	teamno	int				not null	auto_increment comment '번호',
	tname	varchar(30)		not null 					comment '이름',
	skills	varchar(100)	not null 					comment 'java,jsp,spring',
	phone 	varchar(15)		not null					comment '전화번호',
	address	varchar(100)	not null					comment '주소',
	zipcode int				not null 					comment '우편번호',
    gender	varchar(10)		not null 					comment '성별',
	rdate	datetime 		not null default now()		comment '등록일',
    primary key(teamno)
);

-- create (5건)
insert into team(tname, skills, phone, address, zipcode, gender)
values ('이이름', 'java', '010-1234-5678', '군산시 미룡동', '123456', '여자');
insert into team(tname, skills, phone, address, zipcode, gender)
values ('가나다', 'java,jsp', '011-1234-5678', '군산시 미룡동 aaaa', '456824', '남자');
insert into team(tname, skills, phone, address, zipcode, gender)
values ('나다라', 'java, spring', '012-1234-5678', '군산시 미룡동 bbbg', '976284', '남자');
insert into team(tname, skills, phone, address, zipcode, gender)
values ('다라마', 'spring, jsp', '013-1234-5678', '군산시 미룡동 cccc', '123456', '여자');
insert into team(tname, skills, phone, address, zipcode, gender)
values ('라마바', 'java, jsp, spring', '014-1234-5678', '군산시 미룡동 dddd', '498315', '젠더');
insert into team(tname, skills, phone, address, zipcode, gender)
values ('abcdefg bbbasleignwoij', 'java, jsp, spring', '010-5465-9512', '쩌어기 멀리 어디 살고있음', '751512', '여자');

-- read (1건)
select *
from team
where teamno = 2;

-- update
update team
set skills = 'java, jsp, spring'
where teamno = 2;

-- delete
delete from team
where teamno = 2;

-- list(검색, 페이징, 이름, 스킬, 전화번호, 성별)


set sql_safe_updates = 0;