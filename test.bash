#!/bin/bash -xv
#SPDX-FileCopyrightText: 2023 Ko Yamaguchi yamaguchiao1031@gmail.com
#SPDX-License-Identifier: BSD-3-Clause

ng () {
	      echo NG at Line $1
	      res=1
}　

res=0

### I/O TEST ###
out=$( seq 5 | ./plus)
[ "${out}" = 14 ] || ng ${LINENO}

[ "$res" = 0 ] && echo OK
exit $res

out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng ${LINENO}
      　 
### STRANGE INPUT ###
out=$(echo あ | ./plus)
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}
	          　 
out=$(echo | ./plus) #空文字
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}
			    　 
[ "$res" = 0 ] && echo OK
　exit $res
