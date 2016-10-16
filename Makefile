hi: hi.c
	musl-gcc -Os --static -s -fno-stack-protector -ffunction-sections -fdata-sections -Wl,--gc-sections hi.c -o hi
	strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-ta hi
	sstrip hi
	upx hi

container: hi
	docker build -t mini-httpd .

run: container
	docker run --rm -p 8080:8080 mini-httpd

clean:
	rm hi
