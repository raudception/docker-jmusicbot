FROM amazoncorretto:20.0.1-al2

WORKDIR /usr/app

RUN yum install -y wget grep curl

RUN wget $(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep 'browser_' | cut -d\" -f4) 

COPY ./config.txt ./

CMD java -Dnogui=true -jar ./JMusicBot-*.jar
