OPTS=-Wall -D_FILE_OFFSET_BITS=64 -DFUSE_USE_VERSION=25 -lfuse -I/opt/libgit2/include -L/opt/libgit2/lib -lgit2

git-fs: clean
	gcc ${OPTS} -o git-fs git-fs.c

example: git-fs
	test -d test-mount || mkdir test-mount
	sudo umount ./test-mount || true
	./git-fs . ./test-mount

clean:
	rm -f git-fs
