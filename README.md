# Big Data - Semester 241

[Click here to visit our demo](http://ducthuy.com:5115/)

## Overview

In this project, we will do a Mastodon instance domain processing, to monitor posts and events from Mastodon,

Within this context, we assume a candidate approval is based on the number of post **contains the candidate name** as keyword.
This does not accommodate for the sentimental of the post (i.e, whether the post is positive or negative about the candidate).

## Repository structure

- [docker-compose.yaml](./docker-compose.yaml) is the Docker specification for deploying Arroyo in a containerize environment.
- [arroyo.toml](./arroyo.toml) is Arroyo configuration, specifying the type of database serving as Arroyo operational & checkpoints storage.
- [001-pipeline-demo-mastodon-sse.sql)](./001-pipeline-demo-mastodon-sse.sql) store Arroyo code for previewing the raw data structure coming from Mastodon SSE and the velocity of the data.
- [002-pipeline-demo-aggr-15s.sql](./002-pipeline-demo-aggr-15s.sql) store Arroyo code for previewing the final result output, within a shorter time window period of 15 seconds (support for development & quick demo).
- [pipeline.arroyo.sql](./pipeline.arroyo.sql) is the actual code deployed.

## Demo preview

Applying SQL Streaming on analyzing social network interaction data

[![YouTube Video Thumbnail](https://img.youtube.com/vi/z8z_jYJGqDE/0.jpg)](https://www.youtube.com/watch?v=z8z_jYJGqDE)

## Deployment strategy

![](docs/system-diagram.png)

## SWOT analysis

### Strength

- Fast and lightweight (good enough).
- Built-in support for Kafka
- Lightweight

### Weakness

- "Battery not included":
  - Does not work natively with common databases: PostgreSQL, MySQL, ...
  - Should only work with "lightweight" connectors: WebSocket, MQTT, ...
- New, lack of supports from communities
- Lack of more-advanced query features:
  - Count number of substring occurrences

### Opportunities

- Deploy on edge or small performance devices: Raspberry Pi

### Threats

- Kafka Connect:
  - Kafka at the core
  - Many community-built connectors
  - Faster setup and deploy
- Apache Flink:
  - Popular, widely supported
