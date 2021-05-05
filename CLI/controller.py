import requests

def login(username, password):
    response = requests.get(f"http://localhost:3000/login/{username}/{password}")
    try:
        return response.json()
    except:
        return None
        
    