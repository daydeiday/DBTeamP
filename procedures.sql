procedure&function


create or replace procedure insertEval(sStudentId in varchar2, sCourseId in varchar2, sScore number, result out varchar2) is
too_long_review exception;
begin
result := '';


DBMS_OUTPUT.PUT_LINE('수강평가를 완료했습니다.');

insert into evaluation values(sStudentId, sCourseId, sScore);

commit;
result := '수강평가를 완료했습니다.';

exception
when others then
rollback;
result := SQLCODE;

end;
/


create or replace function beenEval(p1 in varchar2, p2 in varchar2) return number is
result number;
nCnt number;
begin
select count(*)
into nCnt
from evaluation
where s_id = p1 and c_id = p2;

if(nCnt>0) then
result := 0;
else
result := 1;
end if;

return result;
end;
/


create or replace function avgScore(sCourseId in varchar2) return varchar2 is
sAvg varchar2(15);

begin
select to_Char(avg(score))
into sAvg
from evaluation
where c_id = sCourseId;

return sAvg;
end;