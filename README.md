# Metro stations

Dataset with metro lines and stations for cities in Belorussia, Kazakhstan, Russia and Ukraine.

Data is provided in JSON, CSV and SQLite formats, in English and Russian languages. See `data` directory for details.

English data:

- [metro.en.json](data/metro.en.json) - dataset as provided by [HeadHunter API](https://github.com/hhru/api/blob/master/docs_eng/metro.md)
- [metro.en.db](data/metro.en.db) - dataset as SQLite database
- [metro.en.csv](data/metro.en.csv) - dataset as CSV
- [city.en.csv](data/city.en.csv) - individual cities as CSV
- [line.en.csv](data/line.en.csv) - individual lines as CSV
- [station.en.csv](data/station.en.csv) - individual stations as CSV

Russian data:

- [metro.ru.json](data/metro.ru.json) - dataset as provided by [HeadHunter API](https://github.com/hhru/api/blob/master/docs/metro.md)
- [metro.ru.db](data/metro.ru.db) - dataset as SQLite database
- [metro.ru.csv](data/metro.ru.csv) - dataset as CSV
- [city.ru.csv](data/city.ru.csv) - individual cities as CSV
- [line.ru.csv](data/line.ru.csv) - individual lines as CSV
- [station.ru.csv](data/station.ru.csv) - individual stations as CSV

ETL process is defined in [scrape.yaml](.github/workflows/scrape.yaml) workflow.

Dataset automatically updates daily at 23:00 UTC if there are any changes in source data.