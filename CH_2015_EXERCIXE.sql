
select bc.no_of_copies
from book b, book_copies bc, library_branch bl 
where 	b.bookid = bc.bookid and
	    	bc.branchid = bl.branchid and
title='the lost tribe' and branchname='sharpstown';

 
select no_of_copies
from ((book natural join book_copies ) natural join 	library_branch ) 
where title='the lost tribe' and branchname='sharpstown';


 
select	name
from		borrower b
where	cardno not in (select cardno
					from book_loans );

            select b.title, r.name, r.address
from book b, borrower r, book_loans bl, library_branch lb
where lb.branchname='sharpstown' and lb.branchid=bl.branchid and
bl.duedate='today' and bl.cardno=r.cardno and bl.bookid=b.bookid

            select	l.branchname, count(*)
from		library_branch l, book_loans bl
where	bl.branchid = l.branchid
group by	l.branchname;

select	b.name, b.address, count(*)
from		borrower b, book_loans l
where	b.cardno = l.cardno
group by	b.cardno, b.name, b.address
having	count(*) > 5;


 
select	title, no_of_copies
from   (((book_authors natural join book) natural join book_copies) natural join library_branch)where author_name='stephen king' and branchname='central'; 


            select	 lname, fname
from	employee, works_on, project
where	dno=5 and ssn=essn and pno=pnumber and pname='productx' 	and hours>10; 

            select		pname, sum (hours)
from		project, works_on
where		pnumber=pno
 
select	e.lname, e.fname
from	employee e
where	not exists (select pnumber
			from 	project
			where	pnumber not in (select pno 
						from works_on
						where essn=e.ssn ) );




 
select	lname, fname
from	employee
where	not exists (select pnumber
			from 	project
			where 	not exists (select *
					from works_on
					where pnumber=pno and essn=ssn ) );


 
select		lname, fname
from		employee
where		ssn not in ( select essn
				          from works_on);
				      
 


 
select	 lname, fname, address 
from	employee
where	exists ( select * 
			from works_on w, project p, dept_locations dl
			where 	w.pno = p.pnumber and
					p.dnum = dl.dnum   and
					dl.dlocation <> ‘houston’);
 


select	lname, fname
from		employee
where	exists ( select *
			from department
			where ssn=mgrssn )
			and
			not exists ( select *
			from dependent
			where ssn=essn );

