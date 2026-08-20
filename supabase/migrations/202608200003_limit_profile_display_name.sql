update public.profiles
set display_name = left(display_name, 12)
where char_length(display_name) > 12;

alter table public.profiles
drop constraint if exists display_name_length;

alter table public.profiles
add constraint display_name_length check (char_length(display_name) <= 12);
