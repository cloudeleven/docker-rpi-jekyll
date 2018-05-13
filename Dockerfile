FROM arm32v7/debian

RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    build-essential \
    ruby-dev \
    rubygems \
    openjdk-8-jre-headless \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

RUN gem install --no-document jekyll bundler s3_website

ENV JEKYLLPATH /var/jekyll

VOLUME $JEKYLLPATH

EXPOSE 80

WORKDIR $JEKYLLPATH

CMD ["tail", "-f", "/dev/null"]

