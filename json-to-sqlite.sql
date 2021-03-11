-- cities

create table city (
    id text,
    name text,
    url text,
    fullkey
);

insert into city (id, name, url, fullkey)
select
   json_extract(value, '$.id') as id,
   json_extract(value, '$.name') as name,
   json_extract(value, '$.url') as url,
   fullkey
from json_tree(readfile('data/metro.${locale}.json'))
where path = '$' and type = 'object';

-- lines

create table line (
    id text,
    city_id text,
    name text,
    hex_color text,
    fullkey
);

insert into line (id, name, hex_color, fullkey)
select
   json_extract(value, '$.id') as id,
   json_extract(value, '$.name') as name,
   json_extract(value, '$.hex_color') as hex_color,
   fullkey
from json_tree(readfile('data/metro.${locale}.json'))
where path like '%.lines' and type = 'object';

update line
set city_id = (select id from city where line.fullkey like city.fullkey || '%');

-- stations

create table station (
    id text,
    city_id text,
    line_id text,
    name text,
    lat real,
    lng real,
    "order" integer,
    fullkey
);

insert into station (id, name, lat, lng, "order", fullkey)
select
   json_extract(value, '$.id') as id,
   json_extract(value, '$.name') as name,
   json_extract(value, '$.lat') as lat,
   json_extract(value, '$.lng') as lng,
   json_extract(value, '$.order') as "order",
   fullkey
from json_tree(readfile('data/metro.${locale}.json'))
where path like '%.stations' and type = 'object';

update station
set line_id = (select id from line where station.fullkey like line.fullkey || '%');

update station
set city_id = (select city_id from line where line.id = station.line_id);

-- all together now

create view metro as
select
  city.id as city_id,
  city.name as city_name,
  line.id as line_id,
  line.name as line_name,
  line.hex_color as line_hex_color,
  station.id as station_id,
  station.name as station_name,
  station.lat,
  station.lng,
  station."order"
from station
  join line on line.id = station.line_id
  join city on city.id = station.city_id
;

