.mode csv
.headers on

.once data/city.${locale}.csv
select id, name from city;

.once data/line.${locale}.csv
select id, city_id, name, hex_color from line;

.once data/station.${locale}.csv
select id, city_id, line_id, name, lat, lng, "order" from station;

.once data/metro.${locale}.csv
select * from metro;