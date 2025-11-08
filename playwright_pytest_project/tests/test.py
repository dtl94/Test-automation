from playwright.sync_api import sync_playwright


with sync_playwright() as p:
    # Launch the browser (headless=False will show the browser window)
    browser = p.chromium.launch(headless=False)
        
    # Create a new browser context and page
    page = browser.new_page()
        
    # Go to Google
    page.goto("https://www.google.com")
        
    # Get and print the page title
    title = page.title()
    print("Page title:", title)
        
    # Close the browser
    browser.close()
