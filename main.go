package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

type (
	// User represents the user model.
	User struct {
		ID   string `json:"id"`
		Name string `json:"name"`
	}
)

func main() {
	e := echo.New()

	roni := &User{
		ID:   "1",
		Name: "roni ardiyanto",
	}

	// Middleware
	e.GET("/", func(c echo.Context) error {
		return c.JSON(http.StatusOK, roni)
	})

	// Login route
	e.POST("/login", loginController)

	e.Logger.Fatal(e.Start(":1323"))
}

func loginController(c echo.Context) error {
	username := c.FormValue("username")
	password := c.FormValue("password")
	if username == "roni" && password == "roni" {
		return c.JSON(http.StatusOK, "Login Successful")
	}
	return c.JSON(http.StatusUnauthorized, "Login Failed")
}
