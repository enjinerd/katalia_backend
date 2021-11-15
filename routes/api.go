package routes

import (
	"github.com/labstack/echo/v4"
)

type Route struct {
	Method  string
	Path    string
	Handler echo.HandlerFunc
}

func GetSnippet(c echo.Context) error {
	return c.String(200, "Hello, World!")
}

func ApiRoutes(e *echo.Echo) {
	// add slice of routes here
	routes := []Route{
		{
			Method:  "GET",
			Path:    "/",
			Handler: GetSnippet,
		},
	}

	api := e.Group("/api")
	for _, route := range routes {
		api.Add(route.Method, route.Path, route.Handler)
	}
}
