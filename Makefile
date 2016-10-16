hi: hi.c
	musl-gcc -O3 --static hi.c -o hi

container: hi
	docker build -t mini-httpd .

run: container
	docker run --rm -p 8080:8080 mini-httpd

clean:
	rm hi
