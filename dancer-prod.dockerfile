FROM perl:5.42

RUN cpanm App::cpanminus

# RUN ls /app

# RUN apt update && apt install cpanminus -y
#COPY 

WORKDIR /deps

COPY ./back-end/cpanfile .

# RUN apt update && apt install libdbi-perl libdbd-pg-perl -y
# libpq-dev 

# Keep test enabled to ensure that production deployments will have no hidden issues
RUN cpanm --installdeps . --notest

WORKDIR /app
COPY ./back-end .

# Run as non-root
RUN useradd -m appuser
USER appuser

EXPOSE 5000

# 5 is a documented reasonable worker count - change as necessary due to load
CMD plackup -s Starman --workers 5 --port 5000 bin/app.psgi
# CMD ["plackup", "-R", "/app/bin,/app/lib,/app/public,/app/views", "--host", "0.0.0.0", "/app/bin/app.psgi"]