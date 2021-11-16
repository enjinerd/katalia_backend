package models

import "katalia/utils/models"

// Snippet struct wiht json tags
type Snippet struct {
	models.Base
	Title    string `json:"title"`
	Descb    string `json:"description"`
	Snippet  string `json:"snippet"`
	Username string `json:"username"`
}
