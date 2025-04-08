from flask import Flask

app = Flask(__name__)

@app.get("/")
def hello():
    return "Hello from Shadowfax DevOps Case Study!"
@app.post("/official-welcome")
def welcome():
    return "Hello this Nidhi Devops intern!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
