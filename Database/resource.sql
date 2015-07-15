alter table activity_submission add hasReturned tinyint(1) default false;

alter table activity_location add multiple tinyint(1) default false;

create table activity_limitnumber (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    desk INT(11) DEFAULT 0,
    beachDesk INT(11) DEFAULT 0,
    tent INT(11) DEFAULT 0,
    campus VARCHAR(10)
);

insert into `activity_limitnumber` (`desk`, `beachDesk`, `tent`, `campus`) values
(2, 22, 1, "zhuhai"),
(0, 0, 0, "north"),
(0, 0, 0, "east"),
(0, 0, 0, "south");