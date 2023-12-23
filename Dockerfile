# Use frovlad/alpine-glibc image (glibc is needed)
FROM frolvlad/alpine-glibc:latest

# Copy the current directory contents into the container at /app
COPY hdsentinel.sh .

# Install any needed packages and do needed file system modifcations
RUN apk add --no-cache wget unzip \
        && wget https://www.hdsentinel.com/hdslin/hdsentinel-020b-x64.zip \
        && unzip hdsentinel-020b-x64.zip \
        && chmod 0755 HDSentinel \
        && mv HDSentinel /bin/hdsentinel \
        && mkdir /etc/hdsentinel \
        && chmod +x hdsentinel.sh \
        && apk del wget unzip \
        && echo "*/10       *       *       *       *       hdsentinel -r /etc/hdsentinel/hdsreport.html -html" >> /var/spool/cron/crontabs/root

# Define environment variable
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LANG C.UTF-8

# Run  when the container launches 
ENTRYPOINT ["./hdsentinel.sh"]