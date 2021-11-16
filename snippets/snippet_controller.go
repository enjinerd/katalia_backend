package snippets

import (
	"katalia/database"
	"katalia/snippets/models"
	"katalia/utils"
	"net/http"

	"github.com/labstack/echo/v4"
)

type (
	SnippetsController struct {
	}
)

func (controller SnippetsController) Routes() []utils.Route {
	return []utils.Route{
		{
			Method:  echo.GET,
			Path:    "/snippets",
			Handler: controller.GetSnippets,
		},
	}
}

func (controller SnippetsController) GetSnippets(ctx echo.Context) error {
	db := database.GetInstance()
	var snippets []models.Snippet
	db.Find(&snippets)
	return ctx.JSON(http.StatusOK, snippets)
}
