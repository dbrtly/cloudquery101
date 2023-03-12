# CloudQuery 101

[CloudQuery](cloudquery.io) is an open source high performance data integration platform built for developers.

I perceive the key benefits as:

- framework for ingestion pipelines (if you wrote this from scratch you're likely to both learn and lot and make a mess.)
- clear configuration abstractions 

This is a demo pipeline that reads from a personal Github account and writes to sqlite.

The system dependencies for this project are specified in .tool-versions:

``` shell
cat .tool-versions
```

Install the system dependencies with:

``` shell
chmod install.sh && bash install.sh
```
