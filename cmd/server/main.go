package main

import "net/http"

func main() {

	http.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
		//toda a tua logica pra garantir que o serviço está saudável
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("OK"))
	})

	http.ListenAndServe(":8080", nil)
}
