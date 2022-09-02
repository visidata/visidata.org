
FROM debian:bullseye

# Warning if subomdules are not initiated
COPY .gitmodules visidata/.gitignore* /tmp/
RUN [ -f /tmp/.gitignore ] || (echo "You must pull you git submodules before you can continue"; exit 1)

RUN apt update
RUN apt install -y python3-pip npm pandoc

WORKDIR /app/visidata.org

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY package.json .
RUN npm install

COPY . .
RUN npm run build:docs
RUN npm run dev:css

CMD ["npm", "run", "dev"]
