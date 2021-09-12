package main

import (
    "fmt"
)


func intToBitString(val int) string {
    out := make([]rune, 4)
    for i := 0; i < 4; i++ {
        mask := 1<<i
        r := '0'
        if (mask&val) == mask {
            r = '1'
        }
        out[3-i] = r
    }
    return string(out)
}
func main() {
    for i := 0; i < 16; i++ {
        aEdge := intToBitString((i<<1 + 1)%16)
        bEdge := intToBitString((i<<1)%16)
        node := intToBitString(i)
        fmt.Println(fmt.Sprintf("\\draw[->] (%s) to node[left]{a} (%s);", node, aEdge))
        fmt.Println(fmt.Sprintf("\\draw[->] (%s) to node[left]{b} (%s);", node, bEdge))
    }
}
