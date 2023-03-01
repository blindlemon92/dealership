select * from PARTS_ORDER

create or replace procedure emp_disc(
    ORDER_NUM numeric,
    discamount numeric
)
language plpgsql
as $$
begin
    update PARTS_ORDER
    set PART_COST = PART_COST - discamount
    where PO_NUM = ORDER_NUM;
    commit;
end;
$$

call emp_disc(654213, 5.00);

select * from repair_order

create or replace procedure BIG_emp_disc(
    ORDER_NUM numeric,
    discamount numeric
)
language plpgsql
as $$
begin
    update REPAIR_ORDER
    set due_on_return = due_on_return - discamount
    where PO_NUM = ORDER_NUM;
    commit;
end;
$$

call BIG_emp_disc(654213, 25.00);

select * from repair_order