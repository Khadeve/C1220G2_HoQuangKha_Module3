delimiter //
drop procedure if exists find_info_student_by_keyword;
create procedure find_info_student_by_keyword (p_keyword varchar(10))
begin
	select * from students
		where `name` like concat('%', p_keyword, '%');
end;
// delimiter ;

set @matcher = 'kh';
call find_info_student_by_keyword (@matcher);
select @matcher;
