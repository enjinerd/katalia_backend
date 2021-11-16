package routes

import (
	"fmt"
	"katalia/snippets"
	"katalia/utils"

	"github.com/labstack/echo/v4"
)

func ApiRoutes(e *echo.Echo) {
	controllers := []utils.Controller{
		snippets.SnippetsController{},
	}
	var routes []utils.Route
	for _, controller := range controllers {
		routes = append(routes, controller.Routes()...)
	}
	fmt.Println(routes)
	api := e.Group("/api")

	for _, route := range routes {
		switch route.Method {
		case echo.GET:
			{
				api.GET(route.Path, route.Handler)
				break
			}
		}
	}
}
