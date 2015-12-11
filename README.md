
Prometheus and statsd metrics integration example
--------------------------------------------------

Simple example of how to integrate statsd metrics on prometheus.

## How does it work

We have 3 pieces here, [Prometheus](http://prometheus.io/), [statsd](https://github.com/etsy/statsd) and the key of the integration
[statsd exporter](https://github.com/prometheus/statsd_exporter) with this.

Out scripts inserts random metrics on statsd (http://127.0.0.1:8125), this metrics are 2 gauges:

* `collectd.ec01.nginx.nginx_connections-active`
* `collectd.ec02.nginx.nginx_connections-active`

When **statsd** receives the metrics, it clones the metrics to the repeaters, in this
case **statsd exporter**,this maps the statsd style metrics to prometheus style
metrics to:

* `active_connections_gauge{app="nginx",exported_job="ec01"}`
* `active_connections_gauge{app="nginx",exported_job="ec02"}`

And serves the metrics to prometheus on http://127.0.0.1:9102/metrics prometheus
will scrape this metrics and serve them on http://127.0.0.1:9090


In a grapth:

    +----------+                     +-------------------+                        +--------------+
    |  StatsD  |---(UDP repeater)--->|  statsd_exporter  |<---(scrape /metrics)---|  Prometheus  |
    +----------+                     +-------------------+                        +--------------+

## Requirements

* docker >= 1.9.0
* docker-compose >= 1.5.0

## Run

Just execute the run script:

    $ ./run.sh
