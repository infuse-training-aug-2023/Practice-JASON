FROM ruby

WORKDIR /app

COPY . .

RUN bundle i

ENV EXEC=true

CMD ["ruby", "main.rb", "21", "12345"]