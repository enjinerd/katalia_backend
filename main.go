package main

import (
	"katalia/database"
	"katalia/routes"
	"katalia/utils"
	"log"

	"github.com/go-playground/validator"
	"github.com/joho/godotenv"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	// Load .env file
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	api := echo.New()
	api.Pre(middleware.AddTrailingSlash())
	api.Validator = &utils.CustomValidator{Validator: validator.New()}
	api.Use(middleware.Logger())
	api.Use(middleware.Recover())
	api.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins: []string{"*"},
		AllowMethods: []string{echo.GET, echo.HEAD, echo.PUT, echo.PATCH, echo.POST, echo.DELETE},
	}))

	// Initialize database
	db := database.GetInstance()
	m := database.GetMigrations(db)
	err = m.Migrate()
	if err == nil {
		log.Println("Database migration success")
	} else {
		log.Println("Database migration failed")
	}

	routes.ApiRoutes(api)
	server := echo.New()
	server.Any("/*", func(c echo.Context) (err error) {
		req := c.Request()
		res := c.Response()
		if req.URL.Path == "/api" {
			api.ServeHTTP(res, req)
		}
		return
	})
	api.Logger.Fatal(api.Start(":8080"))
}
