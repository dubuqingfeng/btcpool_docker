package main

import (
	"github.com/gin-gonic/gin"
	"strconv"
)

func main() {
	r := gin.Default()
	r.Use(gin.Recovery())
	gin.SetMode(gin.ReleaseMode)
	r.GET("/", UserList)
	r.Run()
}

func UserList(c *gin.Context) {
	userId := make(map[string]int)
	userId["k1"] = 2
	userId["k2"] = 3
	userId["aaa"] = 4
	userId["bbb"] = 5
	userId["xxx"] = 6
	userId["test"] = 7
	userId["dubuqingfeng"] = 8

	lastId, _ := strconv.Atoi(c.Query("last_id"))
	result := make(map[string]int)
	for name, id := range userId {
		if id >= lastId {
			result[name] = id
		}
	}

	c.JSON(200, gin.H{
		"err_no": 0,
		"data":   result,
	})
}
