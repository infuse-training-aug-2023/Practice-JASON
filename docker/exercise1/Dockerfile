FROM python

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

ENV EXEC=true

CMD ["python", "main.py", "100", "100"]