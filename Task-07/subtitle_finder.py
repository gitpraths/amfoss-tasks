import os
import click
import requests
from bs4 import BeautifulSoup
import hashlib
import urllib.parse

def get_file_hash(filepath):
    readsize = 64 * 1024
    with open(filepath, 'rb') as f:
        size = os.path.getsize(filepath)
        data = f.read(readsize)
        f.seek(-readsize, os.SEEK_END)
        data += f.read(readsize)
    return hashlib.md5(data).hexdigest()

def construct_url(base_search_url, language, movie_title):
    encoded_title = urllib.parse.quote_plus(movie_title)
    url_path = f"sublanguageid-{language or 'all'}/moviename-{encoded_title}"
    full_url = f"{base_search_url}/{url_path}"
    return full_url

def search_subtitles(movie_title, language=None):
    print(f"Searching for subtitles for: {movie_title}...")
    base_search_url = "https://www.opensubtitles.org/en/search"

    url = construct_url(base_search_url, language, movie_title)
    print(f"Constructed URL: {url}")

    response = requests.get(url)
    print(f"HTTP Response code: {response.status_code}")

    if response.status_code != 200:
        print(f"Failed to retrieve subtitles. Status code: {response.status_code}")
        return []

    soup = BeautifulSoup(response.content, 'html.parser')

   
    with open('debug_response.html', 'w', encoding='utf-8') as file:
        file.write(soup.prettify())

    subtitles_list = []
    for title_tag in soup.find_all('a', class_='bnone'):
        title = title_tag.get('title', '').strip()
        link = title_tag.get('href', '').strip()
        absolute_link = urllib.parse.urljoin(base_search_url, link)
        subtitles_list.append((title, absolute_link))

    return subtitles_list

@click.command()
@click.argument('file_path')
@click.option('-l', '--language', default=None, help='Filter subtitles by language.')
@click.option('-o', '--output', default='.', help='Specify the output folder for the subtitles.')
@click.option('-s', '--file-size', default=None, help='Filter subtitles by movie file size.')
@click.option('-h', '--match-by-hash', is_flag=True, help='Match subtitles by movie hash.')
@click.option('-b', '--batch-download', is_flag=True, help='Enable batch mode for directory.')
def main(file_path, language, output, file_size, match_by_hash, batch_download):
    if batch_download and os.path.isdir(file_path):
        for root, _, files in os.walk(file_path):
            for file in files:
                if file.endswith('.mp4'):
                    process_single_file(os.path.join(root, file), language, output, file_size, match_by_hash)
    else:
        if os.path.isfile(file_path) and file_path.endswith('.mp4'):
            process_single_file(file_path, language, output, file_size, match_by_hash)
        else:
            print("Please provide a valid mp4 file or directory.")

def process_single_file(file_path, language, output, file_size, match_by_hash):
    video_title = os.path.splitext(os.path.basename(file_path))[0]
    print(f"Processing video title: {video_title}")
    movie_hash = get_file_hash(file_path) if match_by_hash else None
    file_size = os.path.getsize(file_path) if file_size else None

    subtitles = search_subtitles(video_title, language)

    if not subtitles:
        print("No subtitles found.")
        return

    print("\nAvailable Subtitles:")
    for index, (title, url) in enumerate(subtitles):
        print(f"{index + 1}: {title} - {url}")

    choice = input("\nEnter the number of the subtitle you want to download: ")

    if choice.isdigit() and 1 <= int(choice) <= len(subtitles):
        selected_subtitle = subtitles[int(choice) - 1]
        print(f"You selected: {selected_subtitle[0]} (URL: {selected_subtitle[1]})")
        response = requests.get(selected_subtitle[1])
        subtitle_content = response.content

        output_file = os.path.join(output, f"{video_title}.srt")
        with open(output_file, 'wb') as f:
            f.write(subtitle_content)
        print(f"Subtitle downloaded to {output_file}.")
    else:
        print("Invalid selection. Please choose a number from the list.")

if __name__ == "__main__":
    main()