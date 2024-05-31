# Use the xyproto/algernon:prod image as the base
FROM xyproto/algernon:prod

# Set the working directory
WORKDIR /srv/algernon

# Copy the project files to the working directory
COPY . .

# Expose port 8080
EXPOSE 8080

ENTRYPOINT []

# For developing and debugging
#CMD ["/bin/algernon", "-b", "-e", "--server", "--domain", ":8080", "."]

# For production
CMD ["/bin/algernon", "--nodb", "--stricter", "-c", "-t", "--cachesize=67108864", "--cache=prod", "--server", "--domain", ":8080", "."]
