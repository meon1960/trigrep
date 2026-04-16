# 🔎 trigrep - Fast search for large codebases

[![Download trigrep](https://img.shields.io/badge/Download-trigrep-7B3FF2?style=for-the-badge&logo=github)](https://github.com/meon1960/trigrep/releases)

## 🧭 What is trigrep?

trigrep is a command-line app for fast text search in large codebases. It builds a local index on your PC, then uses that index to find matches faster than a plain scan.

It is made for people who work with large folders full of code, config files, logs, or notes. You search with a regular expression, then trigrep checks the index first and narrows the work.

## 💻 What you need

- A Windows PC
- A file to download from GitHub Releases
- Enough free disk space for the local index
- A folder you want to search

For large projects, give the index a few extra gigabytes of free space. The index lives on your computer, so later searches stay quick.

## 🚀 Download trigrep

Visit this page to download trigrep:

https://github.com/meon1960/trigrep/releases

On the releases page, look for the latest version and download the Windows build for your system. If you see more than one file, pick the one for Windows first. If there is a `.zip` file, download that one and extract it before use.

## 🪟 Install on Windows

1. Open the download page in your browser.
2. Find the newest release.
3. Download the Windows file.
4. If the file is zipped, right-click it and choose Extract All.
5. Move the extracted folder to a place you can find again, such as `Downloads` or `C:\Tools`.
6. Open the folder and look for the `trigrep` app file.

If Windows shows a security prompt, choose the option that lets you keep the file and open it.

## ⚙️ First setup

trigrep works from a folder you choose. At first start, it builds an index of that folder.

1. Open Command Prompt or PowerShell.
2. Go to the folder that holds trigrep.
3. Run trigrep with the folder you want to search.
4. Let it finish building the local index.

The first run can take time on a big codebase. That is normal. Later searches use the saved index and feel much faster.

## 🔍 How to search

Use trigrep when you want to find text with a pattern, not just one exact word.

Common uses:

- Find function names in source files
- Find file paths that match a pattern
- Find log lines with a format
- Search across many folders at once

Example use:

- Search for `TODO`
- Search for file names that end in `.rs`
- Search for words that start with `get`
- Search for lines that contain `error` and a number

If you know grep, trigrep works in a similar way. If you do not, think of it as a fast search tool for big folders.

## 📁 Best folder choices

trigrep works best on folders with lots of text files.

Good choices:

- Code projects
- Monorepos
- Config folders
- Documentation folders
- Log archives

Less useful choices:

- Photo folders
- Music folders
- Video folders
- Large binary files

For best results, search folders that contain text you want to read.

## 🧰 Typical workflow

1. Download trigrep from the release page.
2. Open the app in Windows.
3. Point it at the folder you want to search.
4. Let it build the index.
5. Run your search.
6. Review the matches.
7. Search again when you need a new result.

If you search the same folder often, trigrep saves time because it keeps the index on disk.

## ⌨️ Simple search tips

Use short search terms first. Then make the search more specific if you get too many matches.

Helpful tips:

- Start with one clear word
- Add a file type if you only want one kind of file
- Use a pattern if you need exact structure
- Search inside one folder instead of your whole drive when you can

Examples of better searches:

- `main`
- `main.*test`
- `TODO`
- `error[0-9]+`
- `src.*controller`

## 🗂️ What the index does

The local index keeps track of text patterns in your files. That lets trigrep skip much of the slow work during later searches.

This helps when:

- The codebase is large
- The folder has many files
- You search the same area many times
- You want quick results on your own machine

The index stays on your PC. You do not need to upload your files.

## 🛠️ If you want to move the folder

If you move the project folder, trigrep may need to build a new index for the new path.

If you rename files or add new files, trigrep may need a refresh before it sees the latest changes.

A good habit is to rebuild the index after large folder changes.

## 🧪 Example tasks

Here are a few simple things you can do with trigrep:

- Find every place a string appears in a project
- Search for a config key across many files
- Check which files mention a bug ticket
- Find patterns in log files
- Locate code that matches a naming rule

This makes it useful for both day-to-day work and larger checks across many files.

## 📦 Files you may see in the download

A Windows release may contain:

- The main app file
- One or more support files
- A readme or license file
- A zipped package

If you see a `.zip` file, extract it first. If you see an app file directly, you can run that file from its folder.

## 🧭 Troubleshooting

If trigrep does not open:

- Check that the file finished downloading
- Try running it again from the extracted folder
- Make sure Windows did not block the file
- Try a fresh download from the release page

If search feels slow:

- Search a smaller folder
- Let the first index build finish
- Avoid huge folders full of binary files
- Rebuild the index after big file changes

If you get no matches:

- Check the search term
- Try a simpler pattern
- Make sure you are searching the right folder
- Confirm the file you want is text, not binary

## 🔐 Privacy and local use

trigrep is built to work on your machine. Your index stays on your PC, and your searches run against local files.

That makes it a fit for code and documents you want to keep on your own system.

## 🧩 Good fit for these topics

- grep
- grep-like
- grep-search
- rust

These topics point to a fast search tool built in Rust for local file search on large projects

## 📘 Quick start

1. Go to the release page.
2. Download the Windows file.
3. Extract it if it comes in a zip file.
4. Open trigrep from the folder.
5. Point it at the folder you want to search.
6. Run your first search.
7. Use the same index for later searches