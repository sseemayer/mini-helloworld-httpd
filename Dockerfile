FROM scratch

ADD hi /hi
EXPOSE 8080

CMD ["/hi"]
