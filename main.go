package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	port := "8080"
	hostname, err := os.Hostname()
	if err != nil {
		log.Fatal("unable to determine hostname")
	}

	log.Printf("listening on tcp port %s\n", port)
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello. My hostname's %s\n", hostname)
	})
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
