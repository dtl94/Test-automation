import json
import pytest
from playwright.sync_api import sync_playwright

@pytest.fixture(scope="session")
def config():
    with open("config.json") as f:
        return json.load(f)

@pytest.fixture(scope="session")
def browser(config):
   with sync_playwright() as p:
        browser = getattr(p, config["browser"]).launch(
            headless=config.get("headless"),
            slow_mo=config.get("slowMo")
        )
        yield browser
        browser.close()

@pytest.fixture(scope="function")
def page(browser, config):
   page = browser.new_page()
   page.set_default_timeout(config.get("timeout"))
   yield page
   page.close()