package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	logger "github.com/scostello/rosterpulse/libraries/go-logger/pkg"
	"github.com/scostello/rosterpulse/services/go-gateway-accounts/graph"
	"github.com/scostello/rosterpulse/services/go-gateway-accounts/graph/generated"
)

const defaultPort = "8080"

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = defaultPort
	}

	entry := logger.New(os.Stdout, "rosterpulse.go-gateway-accounts", "0.1.0")

	srv := handler.NewDefaultServer(generated.NewExecutableSchema(generated.Config{Resolvers: &graph.Resolver{}}))
	//srv.Use(&debug.Tracer{})

	http.Handle("/", playground.Handler("GraphQL playground", "/query"))
	http.Handle("/query", srv)

	entry.Info(fmt.Sprintf("connect to http://localhost:%s/ for GraphQL playground", port))
	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		entry.WithError(err).Error("failed to start http server")
	}
}
