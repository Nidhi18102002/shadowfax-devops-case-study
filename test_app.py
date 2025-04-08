from app import app

def test_hello_route():
    tester = app.test_client()
    response = tester.get('/')
    assert response.status_code == 200
    assert response.data == b"Hello from Shadowfax DevOps Case Study!"

def test_welcome_route():
    tester = app.test_client()
    response = tester.post('/official-welcome')
    assert response.status_code == 200
    assert response.data == b"Hello this Nidhi Devops intern!"
