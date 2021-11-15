package models

import "katalia/utils/models"

type Snippet struct {
	models.Base
	Title    string
	Descb    string
	Username string
	Snippet  string
}
