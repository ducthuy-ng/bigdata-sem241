CREATE TABLE mastodon (
    uri TEXT
    , content TEXT
) WITH (
    connector = 'sse',
    format = 'json',
    endpoint = 'http://mastodon.arroyo.dev/api/v1/streaming/public',
    events = 'update'
);


WITH extract_domain AS (
    SELECT
        split_part(
            substr(uri, strpos(uri, '://') + 3),
            '/',
            1
        ) AS instance_domain
    FROM mastodon
)
, instance_domain_count AS (
    SELECT
        TUMBLE(interval '15 seconds') AS window
        , instance_domain
        , COUNT(*) AS cnt
    FROM extract_domain
    GROUP BY window, instance_domain
)
, instance_domain_sort AS (
    SELECT
        window
        , instance_domain
        , cnt
        , ROW_NUMBER() OVER (PARTITION BY window ORDER BY cnt DESC) AS order
    FROM instance_domain_count
)
SELECT
    window
    , instance_domain
    , cnt
FROM instance_domain_sort
WHERE order <= 5;