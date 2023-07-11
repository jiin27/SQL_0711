select * from E;
/*p.357 */
/*Q1. ① */
/*emp 테이블의 구조만 복사*/
create table empidx
    as select * from emp
        where 1<>1;
        
 /*emp 테이블의 모든 레코드까지 복사*/
create table empidx
    as select * from emp;
    
select * from empidx;

/*Q1. ② */
create index idx_empidx_empno
    on empidx (empno);

 /*Q1. ③ */
select * from user_indexes
    where index_name='idx_empidx_empno';
 
 
 /*Q2. view 생성 */
 create view empidx_over15k   
    as (select empno, ename, job, deptno, sal,
            NVL2(comm, 'O', 'X') as comm
            from empidx
            where sal >1500);
            
            
 /*Q3. ① */
create table deptseq
    as select *
        from dept;
        
 /*Q3. ② */
 create sequence seq_deptseq
    increment by 1
    start with 1
    maxvalue 99
    minvalue 1
    nocycle  /* 부서번호 최댓값에서 생성 중단*/
    nocache; 
 
 /*Q3. ③ */
 insert into deptseq (deptno, dname, loc)
    values (seq_deptseq.nextval, 'DATABASE', 'SEOUL');

insert into deptseq (deptno, dname, loc)
    values (seq_deptseq.nextval, 'WEB', 'BUSAN');
    
insert into  deptseq (deptno, dname, loc)
    values (seq_deptseq.nextval, 'MOBILE', 'ILSAN');

