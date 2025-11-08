# Robot Framework + Selenium project example
This guild-line to help you with setting up the project:
 * Environment setup for Robot Framework and Selenium
 * Text editor for editing test cases
 * Runing an example test case

**Note**: You can use your favourite text editor. I use VSCode (VS Code IDE (Preferred) or PyCharm Community Edition).

## I. Pre-requirement
### 1. Python
Install Python at [here](https://www.python.org/downloads/), and make sure it's added to `PATH` environment variable. 

### 2. Install Robot Framework
```
pip install robotframework
```

### 3. Install Selenium Library
```
pip install --upgrade robotframework-seleniumlibrary
```

### Or install from requirements file
```
pip install -r requirements.txt
```

### 4. Download Web-drivers

You can download Chrome and Firefox drivers from the following links:
 * [Chrome](https://sites.google.com/a/chromium.org/chromedriver/downloads)
 * [Firefox (Gecko)](https://github.com/mozilla/geckodriver/releases)

Or download all web-drivers from [here](https://seleniumhq.github.io/selenium/docs/api/py/index.html#drivers).


Or install all web-drivers using webdrivermanager.
```
webdrivermanager chrome
webdrivermanager firefox
```


### 5. Add Web-drivers to `PATH` environment variable.
 1. After downloading the web-drivers, put them in `drivers` folder
 2. Follow [this guide](https://www.java.com/en/download/help/path.xml) to add web-drivers to `PATH` environment variable



## II. Run an example test case
Run all tests:
```
robot -d reports Tests/
```
Run a single file:
```
robot -d reports Tests/example_test.robot
```


## III. Using Selenium's Offical Standalone Browser Containers
Running your Robot Framework and Selenium tests in a Docker container will give more control and guarantees there is no ChromeDriver version mismatches. (e.g., connect Robot tests to Selenium Grid using official Selenium images).

### You can run it from your project root:
```
docker-compose up --build
```
This will: 
*Start a Selenium Hub and Chrome/Firefox nodes
*Run your Robot tests inside the robot-tests container 
*Store all reports under ./Reports locally
### Or you can run on both browsers in parallel using Pabot:
on Linux:
```
./run_tests.sh
or 
./run_tests.sh chrome firefox

```

on Windows:
```
bash ./run_tests.sh
```

# Make the script executable
chmod +x run_tests.sh

# For a Clean start after applying changes on the project files
```
docker-compose down --volumes --remove-orphans
docker-compose build --no-cache
docker-compose up
```