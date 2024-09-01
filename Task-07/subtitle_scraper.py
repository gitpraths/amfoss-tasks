import requests
from bs4 import BeautifulSoup
import os
import urllib.parse

def search_subtitles(movie_title):
    print(f"Searching for subtitles for: {movie_title}...")
    
    
    encoded_title = urllib.parse.quote_plus(movie_title)
    url = f"https://www.opensubtitles.org/en/search2/sublanguageid-all/moviename-{encoded_title}"

    print(f"Constructed URL: {url}")  # Print the constructed URL for debugging

    response = requests.get(url)

    if response.status_code != 200:
        print(f"Failed to retrieve subtitles. Status code: {response.status_code}")
        return []

    soup = BeautifulSoup(response.content, 'html.parser')

    subtitles_list = []
    for title_tag in soup.find_all('a', class_='bnone'):
        title_attribute = title_tag.get('title', '').strip()
        if movie_title in title_attribute:
            subtitle_url = title_tag['href']
            subtitles_list.append((title_attribute, subtitle_url))

    return subtitles_list

def main():
    video_file = input("Enter the path to the mp4 file (or movie title): ").strip()

    
    if os.path.isfile(video_file) and video_file.endswith('.mp4'):
       
        video_title = os.path.splitext(os.path.basename(video_file))[0]
    else:
      
        video_title = video_file
    
  
    subtitles = search_subtitles(video_title)

 
    if not subtitles:
        print("No subtitles found.")
        return

 
    print("\nAvailable Subtitles:")
    for index, (title, url) in enumerate(subtitles):
        print(f"{index + 1}: {title} - {url}")

    choice = input("\nEnter the number of the subtitle you want to view/download: ")

    if choice.isdigit() and 1 <= int(choice) <= len(subtitles):
        selected_subtitle = subtitles[int(choice) - 1]
        print(f"You selected: {selected_subtitle[0]} (URL: {selected_subtitle[1]})")
       
    else:
        print("Invalid selection. Please choose a number from the list.")

if __name__ == "__main__":
    main()