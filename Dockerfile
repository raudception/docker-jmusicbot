FROM alpine

WORKDIR /usr/app

RUN apk add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN apk add wget grep curl

RUN wget $(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep 'browser_' | cut -d\" -f4) 

COPY ./config.txt ./

CMD java -Dnogui=true -jar ./JMusicBot-*.jar
