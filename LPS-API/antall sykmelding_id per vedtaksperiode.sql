-- sql
-- Join på tvers fra forespørsel til søknad
-- Group by vedtaksperiode_id og tell antall unike sykmelding_id knyttet til hver vedtaksperiode_id
-- Group by resultatet på antall_knyttet_sykmelding_ider for å gi en oversikt
WITH sykmelding_id_counts AS (
    SELECT
        fsp.vedtaksperiode_id,
        COUNT(DISTINCT sok.sykmelding_id) AS antall_knyttet_sykmelding_ider
    FROM public.status_i_speil sis
    JOIN public.forespoersel fsp
    ON sis.vedtaksperiode_id = fsp.vedtaksperiode_id
    join public.soknad sok
    on sok.soknad_id = sis.soeknad_id
    GROUP BY fsp.vedtaksperiode_id
)
SELECT
    COUNT(*) AS antall_vedtaksperiode_ider,
    antall_knyttet_sykmelding_ider AS knyttet_til_N_sykmelding_ider
FROM sykmelding_id_counts
GROUP BY antall_knyttet_sykmelding_ider
ORDER BY antall_knyttet_sykmelding_ider DESC;