package main

import (
	imath "internal/math"
)

func main() {
	f := float64(0.5)
	x := imath.Float64bits(f)
	e := uint(10)
	println(f, x, e)
	//x &^= 1<<(64-12-e) - 1
	//println(f, x, e)
}

// Output:
// 0.5 4602678819172646912 10
