
FROM debian:bullseye

RUN apt update
RUN apt install -y python3-pip npm pandoc

WORKDIR /app/visidata.org

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY package.json .
COPY package-lock.json .
RUN npm install

COPY . .
RUN npm run build:docs
RUN npm run dev:css

CMD ["npm", "run", "dev"]
