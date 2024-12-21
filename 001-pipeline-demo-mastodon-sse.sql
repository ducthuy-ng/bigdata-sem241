CREATE TABLE mastodon (
    uri TEXT
    , content TEXT
) WITH (
    connector = 'sse',
    format = 'json',
    endpoint = 'http://mastodon.arroyo.dev/api/v1/streaming/public',
    events = 'update'
);

SELECT
    uri
    , content
FROM mastodon;
