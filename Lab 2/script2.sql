insert into takes values (1,301), (1,204), (1,405), (1,101), (2,204), (2,101), (3,301), (4,301), (5,301), (5,204), (5,101), (6,405), (6,101), (7,101);
update instructor set teaches=301 where instr_id=4;
update instructor set teaches=301 where instr_id=3 ;
update instructor set teaches=101 where instr_id=2;
update instructor set teaches=204 where instr_id=1;
update instructor set teaches=405 where instr_id=7;
update project set head_id = 1 where proj_id = 70;
update project set head_id = 4 where proj_id = 68;
update project set head_id = 3 where proj_id = 9;
update project set head_id = 5 where proj_id = 2;
update project set head_id = 6 where proj_id = 5;
update student set proj_id = 68 where id = 1;
update student set proj_id = 9 where id = 2;
update student set proj_id =2  where id = 3;
update student set proj_id = 5 where id = 4;
update student set proj_id = 70 where id = 5;
update student set proj_id = 70 where id = 6;
update student set proj_id = 9 where id = 7;