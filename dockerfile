FROM perl:5.42
WORKDIR /app

RUN cpanm App::cpanminus

COPY . /app
# RUN apt update && apt install cpanminus -y
RUN ["cpanm", "--installdeps", "./app"]

# Run as non-root
RUN useradd -m appuser
USER appuser

EXPOSE 5000

# Start the Mojolicious app in production mode
CMD ["plackup", "-R", "./app/bin,./app/lib,./app/public", "--host", "0.0.0.0", "./app/bin/app.psgi"]