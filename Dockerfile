FROM ruby:3.0.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /X-Disk
COPY Gemfile /X-Disk/Gemfile
COPY Gemfile.lock /X-Disk/Gemfile.lock
RUN bundle install
COPY . /X-Disk

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
