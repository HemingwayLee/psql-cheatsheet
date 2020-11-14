DO language plpgsql $$
BEGIN

if 'abc' <> NULL then
  raise notice '<> is working';
end if;

if 'abc' is distinct from NULL then
  raise notice 'is distinct from is working';
end if;

END
$$;
