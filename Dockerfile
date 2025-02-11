FROM python:3.9-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
# Set the environment variable to tell Flask where the app is 
ENV FLASK_APP=app.py 
# Run the Flask application 
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
