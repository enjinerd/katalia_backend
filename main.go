package main

import (
	"katalia/routes"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	api := echo.New()
	api.Pre(middleware.AddTrailingSlash())
	routes.ApiRoutes(api)
	api.Logger.Fatal(api.Start(":8080"))
}
