package main

import "io/ioutil"
import "time"

func main() {
	dt := time.Now()
    b := []byte(dt.String())

    err := ioutil.WriteFile("md5_file.txt", b, 0644)
    if err != nil {
        panic(err)
    }
}