import requests

def login(username, password):
    response = requests.get(f"http://localhost:3000/login/{username}/{password}")
    try:
        return response.json()
    except:
        return None
        
def register(username, password):
    parameters = {
        "username": username,
        "password": password
    }
    response = requests.post("http://localhost:3000/users", params=parameters)
    try:
        return response.json()
    except:
        return None

def seachSong(inputSong):
    response = requests.get(f"http://localhost:3000/search/{inputSong}")
    response2 = requests.get(f"http://localhost:3000/searchgenre/{inputSong}")
    try:
        return response.json()['rows'] + response2.json()['rows']
    except:
        return None