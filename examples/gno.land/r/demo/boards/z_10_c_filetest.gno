// PKGPATH: gno.land/r/boards_test
package boards_test

// SEND: 200000000ugnot

import (
	"strconv"

	"gno.land/r/demo/boards"
	"gno.land/r/demo/users"
)

var (
	bid boards.BoardID
	pid boards.PostID
	rid boards.PostID
)

func init() {
	users.Register("", "gnouser", "my profile")

	bid = boards.CreateBoard("test_board")
	pid = boards.CreateThread(bid, "First Post in (title)", "Body of the first post. (body)")
	rid = boards.CreateReply(bid, pid, pid, "First reply of the First post\n")
}

func main() {
	println(boards.Render("test_board/" + strconv.Itoa(int(pid))))
	boards.DeletePost(bid, pid, rid, "")
	println("----------------------------------------------------")
	println(boards.Render("test_board/" + strconv.Itoa(int(pid))))
}

// Output:
// # First Post in (title)
//
// Body of the first post. (body)
// \- [@gnouser](/r/users:gnouser), [2009-02-13 11:31pm (UTC)](/r/boards:test_board/1) \[[reply](/r/boards?help&__func=CreateReply&bid=1&threadid=1&postid=1&body.type=textarea)] \[[x](/r/boards?help&__func=DeletePost&bid=1&threadid=1&postid=1)]
//
// > First reply of the First post
// >
// > \- [@gnouser](/r/users:gnouser), [2009-02-13 11:31pm (UTC)](/r/boards:test_board/1/2) \[[reply](/r/boards?help&__func=CreateReply&bid=1&threadid=1&postid=2&body.type=textarea)] \[[x](/r/boards?help&__func=DeletePost&bid=1&threadid=1&postid=2)]
//
// ----------------------------------------------------
// # First Post in (title)
//
// Body of the first post. (body)
// \- [@gnouser](/r/users:gnouser), [2009-02-13 11:31pm (UTC)](/r/boards:test_board/1) \[[reply](/r/boards?help&__func=CreateReply&bid=1&threadid=1&postid=1&body.type=textarea)] \[[x](/r/boards?help&__func=DeletePost&bid=1&threadid=1&postid=1)]
