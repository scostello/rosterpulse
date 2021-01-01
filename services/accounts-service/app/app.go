package app

import (
	"context"
	"fmt"
	"github.com/gorilla/mux"
	grpcServer "github.com/scostello/rosterpulse/services/accounts-service/grpc"
	"github.com/scostello/rosterpulse/services/accounts-service/repositories"
	"google.golang.org/grpc"
	"net"
	"net/http"
)

type App struct {
	Router     *mux.Router
	GrpcServer *grpc.Server
}

func NewApp() *App {
	return &App{}
}

func (a *App) Initialize() {
	a.Router = mux.NewRouter()
	a.GrpcServer = grpc.NewServer()
	repo := repositories.NewAccountsRepository()
	repo.ListenToCreateAccountCommands(context.Background())
	grpcServer.RegisterResources(a.GrpcServer, repo)
}

func (a *App) Run() {
	httpPort := 8080
	fmt.Println(fmt.Sprintf("Serving http on port %d", httpPort))
	go http.ListenAndServe(":8080", a.Router)

	listen, err := net.Listen("tcp", ":50051")
	if err != nil {
		_ = fmt.Errorf("something went wrong")
	}

	panic(a.GrpcServer.Serve(listen))
}
