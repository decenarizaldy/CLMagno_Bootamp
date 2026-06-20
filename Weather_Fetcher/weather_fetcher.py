import json
import csv
from urllib.request import Request, urlopen
from urllib.error import HTTPError, URLError


def fetch_weather_data(city):
    api_url = "https://wttr.in/"
    url = f"{api_url}{city}?format=j1"
    request = Request(url, headers={"User-Agent": "Mozilla/5.0"})
    try:
        with urlopen(request) as response:
            if response.status == 200:
                return json.loads(response.read().decode("utf-8"))
            else:
                print(f"Failed to fetch data for {city}. Status code: {response.status}")
    except HTTPError as error:
        print(f"Failed to fetch data for {city}. Status code: {error.code}")
    except URLError as error:
        print(f"Failed to fetch data for {city}. Error: {error.reason}")
    return None
    
def save_to_csv(data, filename):
    with open(filename, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["City", "Temperature (°C)", "Weather Description"])
        for city, weather in data.items():
            temp_c = weather['current_condition'][0]['temp_C']
            description = weather['current_condition'][0]['weatherDesc'][0]['value']
            writer.writerow([city, temp_c, description])

def main():
    cities = ["Manila", "Taguig", "Cavite"]
    weather_data = {}
    
    for city in cities:
        data = fetch_weather_data(city)
        if data:
            weather_data[city] = data
    
    save_to_csv(weather_data, "./Weather_Fetcher/weather_data.csv")

if __name__ == "__main__":
    main()