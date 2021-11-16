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
		databaseConfig := config.DatabaseNew().(*config.DbConfig)
		db, err := gorm.Open(mysql.Open(fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True&loc=Local",
			"root",
			databaseConfig.Msql.Password,
			databaseConfig.Msql.Host,
			databaseConfig.Msql.Port,
			"katalia",
		)), &gorm.Config{})

		if err != nil {
			url := (fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True&loc=Local",
				databaseConfig.Msql.User,
				databaseConfig.Msql.Password,
				databaseConfig.Msql.Host,
				databaseConfig.Msql.Port,
				"cobagan",
			))
			fmt.Println(url)
			log.Fatal(err)
		}
		instance = db
	})
	return instance
}
