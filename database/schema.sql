-- Execute uma vez no SQL Editor do seu projeto Supabase.
-- A chave secreta é usada SOMENTE pela função de servidor da Vercel.
create table if not exists public.interface_settings (
  id text primary key,
  value text not null
);
create table if not exists public.interface_classes (
  id uuid primary key,
  name text not null,
  code text unique not null,
  released integer[] not null default '{}',
  enrollment_open boolean not null default true,
  created_at timestamptz not null default now()
);
create table if not exists public.interface_students (
  id uuid primary key,
  class_id uuid not null references public.interface_classes(id),
  name text not null,
  access_code text unique not null,
  pin_hash text not null,
  version integer not null default 1,
  official_grade numeric check (official_grade >= 0 and official_grade <= 10),
  grade_note text,
  created_at timestamptz not null default now()
);
create table if not exists public.interface_submissions (
  id uuid primary key,
  student_id uuid not null references public.interface_students(id),
  class_id uuid not null references public.interface_classes(id),
  task_id text not null,
  lesson_id integer not null check (lesson_id between 1 and 10),
  payload jsonb not null,
  status text not null check (status in ('pending','approved','revision')),
  xp integer not null default 0 check (xp >= 0 and xp <= 180),
  feedback text not null,
  updated_at timestamptz not null default now(),
  unique (student_id, task_id)
);
create index if not exists interface_students_class on public.interface_students(class_id);
create index if not exists interface_submissions_student on public.interface_submissions(student_id);
create index if not exists interface_submissions_class on public.interface_submissions(class_id);
create table if not exists public.interface_limits (
  id text primary key,
  hits integer not null default 1,
  created_at timestamptz not null default now()
);
create or replace function public.interface_take_limit(p_key text,p_max integer)
returns boolean language plpgsql security definer set search_path=public as $$
declare n integer;
begin
  insert into interface_limits(id,hits) values(p_key,1)
  on conflict(id) do update set hits=interface_limits.hits+1
  returning hits into n;
  delete from interface_limits where created_at < now()-interval '1 day';
  return n <= p_max;
end;
$$;
alter table public.interface_settings enable row level security;
alter table public.interface_classes enable row level security;
alter table public.interface_students enable row level security;
alter table public.interface_submissions enable row level security;
alter table public.interface_limits enable row level security;
revoke all on public.interface_settings,public.interface_classes,public.interface_students,public.interface_submissions,public.interface_limits from anon,authenticated;
grant all on public.interface_settings,public.interface_classes,public.interface_students,public.interface_submissions,public.interface_limits to service_role;
revoke all on function public.interface_take_limit(text,integer) from public,anon,authenticated;
grant execute on function public.interface_take_limit(text,integer) to service_role;
