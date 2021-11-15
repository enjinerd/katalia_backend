package database

import (
	"katalia/snippets/models"

	"github.com/go-gormigrate/gormigrate/v2"
	"gorm.io/gorm"
)

func GetMigrations(db *gorm.DB) *gormigrate.Gormigrate {
	return gormigrate.New(db, gormigrate.DefaultOptions, []*gormigrate.Migration{
		{
			ID: "katalia_2021",
			Migrate: func(tx *gorm.DB) error {
				if err := tx.AutoMigrate(&models.Snippet{}); err != nil {
					return err
				}
				return nil
			},
			Rollback: func(tx *gorm.DB) error {
				if err := tx.Migrator().DropTable(&models.Snippet{}).Error; err != nil {
					return nil
				}
				return nil
			},
		},
	})
}
