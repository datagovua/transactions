FROM openjdk:8-jre

RUN apt-get install curl \
    && curl --create-dirs -o /opt/embulk/embulk -L "https://dl.bintray.com/embulk/maven/embulk-0.9.17.jar" && chmod +x /opt/embulk/embulk

# vim
RUN apt-get update && apt-get install -y vim && rm -r /usr/share/vim/vim80/indent/

ENV PATH="/opt/embulk:${PATH}"

RUN embulk gem install embulk-filter-row embulk-decoder-commons-compress embulk-parser-poi_excel embulk-filter-script_ruby embulk-output-jdbc embulk-output-postgresql embulk-parser-xml embulk-input-http embulk-parser-jsonpath
RUN apt-get update && apt-get install -y postgresql-client && rm /usr/share/vim/vim80/indent.vim

RUN curl -o /bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-latest" && chmod +x /bin/digdag
