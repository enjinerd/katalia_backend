package utils

import (
	"github.com/labstack/echo/v4"
)

type (
	// Route struct
	Route struct {
		Method  string
		Path    string
		Handler echo.HandlerFunc
	}
)
