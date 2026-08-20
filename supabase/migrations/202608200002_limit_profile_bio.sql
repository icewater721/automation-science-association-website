update public.profiles
set bio = left(bio, 30)
where char_length(bio) > 30;

alter table public.profiles
drop constraint if exists bio_length;

alter table public.profiles
add constraint bio_length check (char_length(bio) <= 30);
