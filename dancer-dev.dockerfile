FROM perl:5.42
VOLUME [ "/app" ]

WORKDIR /app

RUN cpanm App::cpanminus

# RUN ls /app

# COPY . /app
# RUN apt update && apt install cpanminus -y
RUN ls .
RUN ["cpanm", "--installdeps", "."]

# Run as non-root
RUN useradd -m appuser
USER appuser

EXPOSE 5000

CMD ["plackup", "-R", "./bin,./lib,./public", "--host", "0.0.0.0", "./bin/app.psgi"]