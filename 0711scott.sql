select * from E;
/*p.357 */
/*Q1. �� */
/*emp ���̺��� ������ ����*/
create table empidx
    as select * from emp
        where 1<>1;
        
 /*emp ���̺��� ��� ���ڵ���� ����*/
create table empidx
    as select * from emp;
    
select * from empidx;

/*Q1. �� */
create index idx_empidx_empno
    on empidx (empno);

 /*Q1. �� */
select * from user_indexes
    where index_name='idx_empidx_empno';
 
 
 /*Q2. view ���� */
 create view empidx_over15k   
    as (select empno, ename, job, deptno, sal,
            NVL2(comm, 'O', 'X') as comm
            from empidx
            where sal >1500);
            
            
 /*Q3. �� */
create table deptseq
    as select *
        from dept;
        
 /*Q3. �� */
 create sequence seq_deptseq
    increment by 1
    start with 1
    maxvalue 99
    minvalue 1
    nocycle  /* �μ���ȣ �ִ񰪿��� ���� �ߴ�*/
    nocache; 
 
 /*Q3. �� */
 insert into deptseq (deptno, dname, loc)
    values (seq_deptseq.nextval, 'DATABASE', 'SEOUL');

insert into deptseq (deptno, dname, loc)
    values (seq_deptseq.nextval, 'WEB', 'BUSAN');
    
insert into  deptseq (deptno, dname, loc)
    values (seq_deptseq.nextval, 'MOBILE', 'ILSAN');

