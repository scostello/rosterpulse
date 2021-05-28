package app

import (
	"context"
	"fmt"
	"github.com/gorilla/mux"
	logger "github.com/scostello/rosterpulse/libraries/logger-go/pkg"
	grpcServer "github.com/scostello/rosterpulse/services/go-service-accounts/grpc"
	"github.com/scostello/rosterpulse/services/go-service-accounts/repositories"
	"google.golang.org/grpc"
	"net"
	"net/http"
	"os"
)

type App struct {
	Router     *mux.Router
	GrpcServer *grpc.Server
	logger logger.FluentLogger
}

func NewApp() *App {
	return &App{}
}

func (a *App) Initialize() {
	a.logger = logger.New(os.Stdout, "rosterpulse.go-service-accounts", "0.1.0")
	a.Router = mux.NewRouter()
	a.GrpcServer = grpc.NewServer()
	repo := repositories.NewAccountsRepository(a.logger)
	repo.ListenToCreateAccountCommands(context.Background())
	grpcServer.RegisterResources(a.logger, a.GrpcServer, repo)
}

func (a *App) Run() {
	httpPort := 8080
	a.logger.Info(fmt.Sprintf("Serving http on port %d", httpPort))
	go http.ListenAndServe(":8080", a.Router)

	listen, err := net.Listen("tcp", ":50051")
	if err != nil {
		a.logger.WithError(err).Error("something went wrong")
	}

	panic(a.GrpcServer.Serve(listen))
}
