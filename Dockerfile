FROM ruby:3.0.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /xdisk
COPY Gemfile /xdisk/Gemfile
COPY Gemfile.lock /xdisk/Gemfile.lock
RUN bundle install
COPY . /xdisk

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
