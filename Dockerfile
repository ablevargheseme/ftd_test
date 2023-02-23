FROM ubuntu:20.04

# Copy the shell script to the container
# COPY install_app.sh /tmp/
# Update package index and install curl
RUN apt-get update && apt-get install -y curl && apt-get clean
# Run the shell script to install the application
# RUN chmod +x /tmp/install_app.sh && \
#     /tmp/install_app.sh && \
#     rm /tmp/install_app.sh
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/fastn-stack/fastn/main/install.sh)"
WORKDIR /usr/src/frontend
COPY FASTN.ftd FASTN.ftd
COPY index.ftd index.ftd
# Expose any required ports
# EXPOSE 8000