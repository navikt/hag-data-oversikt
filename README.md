# hag-data-oversikt

En rekke SQL spørringer for å hente statestikk

## Getting started
For å kjøre en spørring i LPS-API:

```bash
nais login
nais postgres grant -c prod-gcp sykepenger-im-lps-api
nais postgres proxy -c prod-gcp sykepenger-im-lps-api
```