FROM scratch
ADD output/hello /
EXPOSE 8080
ENTRYPOINT ["/hello"]
