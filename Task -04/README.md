## About the Task
This repository contains code for Telegram Bot made using Python.
The mistake I made while working on this task was not reading the instructions properly. I made Telegram Bot made using Java. I read the instructions for the list of commands needed and realised that the bot was suppoed to be made using Python. <br>
It was a stupid mistake but because I had already done it once in Java (till a certain point), recreating it in Python was fairly easy. 
It was an interesting task for sure.

## What did I learn:
I was making a bot for the first time so that was sure a lot to learn:
- **Using External API**: learning how to interact with Google's Books API to fetch book information based on genres or book titles
- **Generating CSV Files in Memory**: creating and populating a CSV file using Python's csv module and `io.StringIO` to store the data in memory, which can then be sent to users
- **Using `python-docx`**: creating a Word document (.docx) in memory, populate it with text (like a reading list), and send it as a document to users.

## Commands to use the bot
`/start` - Start the bot. The reply will be a welcome message with all the commands you can use to run the bot. <br/>
`/book` - Get book details by genre. The reply will be a CSV file, listing the books of that said genre <br/>
`/preview` - Get a preview link for a book. The link of the said book will be sent to you <br/>
`/list` - Manage your reading list. Not working yet <br/> 
`/help` - Get help information. It will give you the info about the commands <br/>

