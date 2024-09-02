## Approach: 
The project is about finding and downloading subtitles for movies. To achieve this, we needed to input the movie information. This is done by direct movie title inputs and .mp4 file paths. If a file path is provided, the movie title is automatically extracted from the filename to improve user convenience.

The next step involved searching for subtitles online. I used `beautifulsoup4` to scrape opensubtitles and get the list of subtitles.

The webpage found the relevant subtitle links. Web scraping techniques, specifically using BeautifulSoup, were used to navigate the HTML and extract essential data such as subtitle titles and download links.

To make it easy for users to pick the right subtitle, the process includes listing all the available options and letting users choose the one that works best for them. This way, the experience is both smooth and adaptable, giving users a more personalized selection. It returns a srt file of the choosen subtitle to download

Overall, the project is designed to streamline the subtitle search process, reducing manual effort while offering users the ability to make informed choices.
