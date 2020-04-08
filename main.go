package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

var queries = prometheus.NewCounter(prometheus.CounterOpts{
	Name: "queries",
	Help: "queries for /",
})

func init() {
	prometheus.MustRegister(queries)
}

func main() {
	port := "8080"
	hostname, err := os.Hostname()
	if err != nil {
		log.Fatal("unable to determine hostname")
	}

	log.Printf("listening on tcp port %s\n", port)
	http.Handle("/metrics", promhttp.Handler())
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "my hostname: %s\n", hostname)
		queries.Inc()
	})
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
