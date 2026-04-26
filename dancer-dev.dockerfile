FROM perl:5.42
VOLUME [ "/app" ]

RUN cpanm App::cpanminus

# RUN ls /app

# COPY . /app
# RUN apt update && apt install cpanminus -y
#COPY 

WORKDIR /deps

COPY ./app/cpanfile ./cpanfile

RUN ls .
RUN ["cpanm", "--installdeps", "."]

WORKDIR /app

# Run as non-root
RUN useradd -m appuser
USER appuser

EXPOSE 5000

CMD ["plackup", "-R", "/app/bin,/app/lib,/app/public,/app/views", "--host", "0.0.0.0", "/app/bin/app.psgi"]