package main

import (
	"log"

	"github.com/go-humble/router"
	"honnef.co/go/js/dom"
)

var (
	document = dom.GetWindow().Document()
)

func main() {
	log.Println("Hello")
	r := router.New()
	r.ForceHashURL = true
	r.HandleFunc("/", func(_ *router.Context) {
		log.Println("root")
		document.QuerySelector("#app").SetInnerHTML("root")
	})
	r.HandleFunc("/foo", func(_ *router.Context) {
		log.Println("foo")
		document.QuerySelector("#app").SetInnerHTML("foo")
	})
	r.Start()
}
