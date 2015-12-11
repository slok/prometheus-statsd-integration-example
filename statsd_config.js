(function() {
    return {
        // Configuration
        repeater:[
            {host: "promstatsd_statsd_exporter_1",
            port: 9125}
        ],
        backends: [ "./backends/repeater" ]
    };
})()
