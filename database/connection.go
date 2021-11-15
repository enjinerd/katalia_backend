package database

import (
	"fmt"
	"katalia/config"
	"log"
	"sync"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var onceDb sync.Once
var instance *gorm.DB

func GetInstance() *gorm.DB {
	onceDb.Do(func() {
		databaseConfig := config.DatabaseNew().(*config.DbConnection)
		db, err := gorm.Open(mysql.Open(fmt.Sprintf("host=%s port=%s user=%s dbname=%s password=%s",
			databaseConfig.Host,
			databaseConfig.Port,
			databaseConfig.User,
			databaseConfig.DbName,
			databaseConfig.Password)), &gorm.Config{})
		if err != nil {
			log.Fatal(err)
		}
		instance = db
	})
	return instance
}
