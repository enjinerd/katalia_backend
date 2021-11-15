package models

import (
	"time"

	"github.com/jkomyno/nanoid"
	"gorm.io/gorm"
)

type Base struct {
	ID        string `gorm:"primary_key"`
	CreatedAt time.Time
	UpdatedAt time.Time
	DeletedAt *time.Time `sql:"index"`
}

// BeforeCreate will set a UUID rather than numeric ID.
func (base *Base) BeforeCreate(tx *gorm.DB) error {
	id, err := nanoid.Nanoid(10)
	if err != nil {
		return err
	}
	tx.Statement.SetColumn("ID", id)
	return nil
}
