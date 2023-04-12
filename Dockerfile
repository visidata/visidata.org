FROM debian:bookworm

WORKDIR /app/visidata.org

COPY . .

RUN apt update && \
	apt install -y python3-pip python3-venv npm pandoc && \
	make install

EXPOSE 8080

CMD ["make", "dev"]