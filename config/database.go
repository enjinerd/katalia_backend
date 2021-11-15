package config

import "os"

type Database interface{}

type DbConnection struct {
	Host     string
	Port     string
	User     string
	Password string
	DbName   string
}

type DbConfig struct {
	Msql DbConnection
}

func DatabaseNew() Database {
	return &DbConfig{
		Msql: DbConnection{
			Host:     os.Getenv("DB_HOST"),
			Port:     os.Getenv("DB_PORT"),
			User:     os.Getenv("DB_USER"),
			Password: os.Getenv("DB_PASSWORD"),
			DbName:   os.Getenv("DB_NAME"),
		},
	}
}
