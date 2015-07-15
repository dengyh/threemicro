INSERT INTO `committee_societies` (`name`, `committee_id`) VALUES
("街舞团", "3"),
("合唱团", "3"),
("管弦乐团", "3"),
("民舞团", "3"),
("话剧社", "3"),
("书画协会", "3"),
("Tuesday乐队", "3"),

("FLA外语协会", "3"),
("心里学社", "3"),
("北校区医疗队", "3"),
("青年志愿者协会", "3"),
("红十字会", "3"),
("星声关爱孤独症儿童协会", "3"),
("中大Enactus", "3"),
("向日葵健康推广社", "3"),
("招生志愿者协会", "3"),
("爱心助学协会", "3"),
("爱心同盟协会", "3"),
("理发协会", "3"),
("红丝带协会", "3"),
("环境保护协会", "3"),
("学生.校友协会", "3"),
("羽毛球协会", "3"),
("乒乓球协会", "3"),
("武术协会", "3"),
("足球协会", "3"),
("排球协会", "3"),
("篮球协会", "3"),
("定向越野协会", "3"),
("跆拳道协会", "3"),
("散打协会", "3"),
("中大职协&强生未来领袖学院", "3"),

("摄影协会", "3"),
("棋艺协会", "3"),
("动漫协会", "3"),
("纸艺协会", "3"),
("求进报社", "3"),
("广播台", "3"),
("中大青年", "3");

ALTER TABLE activity_number add campus varchar(10);
ALTER TABLE activity_number add tent int(11);
DELETE FROM activity_number WHERE id=1;


INSERT INTO `activity_number` (`campus`, `desk`, `beachDesk`, `tent`) VALUES
("zhuhai", "100", "100", "25"),
("north", "100", "100", "25"),
("east", "100", "100", "25"),
("south", "100", "100", "25");

ALTER TABLE activity_activity add academicType varchar(16);
ALTER TABLE activity_activity add detailType varchar(16);
ALTER TABLE activity_activity add academicTypeMark TINYINT(1) default true;
ALTER TABLE activity_activity add detailTypeMark TINYINT(1) default true;
ALTER TABLE activity_submission add tentNumber INT(11) default 0;
ALTER TABLE activity_submission add tentNumberMark TINYINT(1) default true;