# FirstCircle

This repository contains two separate tasks: **BackendTask** (a Ruby script for fetching music trivia questions) and **FrontendTask** (a Rails application). Below are the setup instructions for each.

## Repository URL
[GitHub Repository](https://github.com/Erollercoaster/FirstCircle)

---

## BackendTask - Music Trivia Utility
### Overview
This script fetches music trivia questions from the OpenTDB API and saves them in **JSON**, **CSV**, or prints them to the **console**.

### Prerequisites
- Ruby installed (Recommended: version 3.x)

### How to Run
1. Navigate to the `BackendTask` directory:
   ```sh
   cd BackendTask
   ```
2. Run the script:
   ```sh
   ruby API.rb
   ```
3. Enter the number of API calls you want to make.
4. Choose the output format: `json`, `csv`, or `console`.

### Output
- `music_trivia.json` (if JSON format is chosen)
- `music_trivia.csv` (if CSV format is chosen)
- Prints trivia data to the console (if console format is chosen)

### Important Notes
- API requests are rate-limited with a **5-second delay** between calls.
- Ensure an active internet connection to fetch trivia data.

---

## FrontendTask - Rails Application
### Overview
A Ruby on Rails application that fetches music trivia questions from the OpenTDB API and saves them in **JSON**, **CSV**, or prints them to the **console**..

### Prerequisites
- Ruby (Recommended: version 3.x)
- Rails (Recommended: version 7.x)
- Node.js & Yarn

### How to Run
1. Navigate to the `FrontendTask/frontend-app` directory:
   ```sh
   cd FrontendTask/frontend-app
   ```
2. Install dependencies:
   ```sh
   bundle install
   yarn install
   ```
3. Run the application:
   ```sh
   bin/dev
   ```
   - **Why `bin/dev`?** The app uses **Tailwind CSS**, and `bin/dev` ensures assets are correctly compiled.

### Important Notes
- **No database is used** in this project.
- If you see missing dependencies, run:
  ```sh
  rails assets:precompile
  ```

