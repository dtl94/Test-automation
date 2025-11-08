import re
from playwright.sync_api import Page
from pages.automationexercise_login_page import LoginPage


def test_login(page: Page, config):

    login_url = config["login_url"]
    form_data = config["form_data"]

    login_page = LoginPage(page)
    
    page.goto(login_url)
    login_page.enter_email_login(form_data["email"])
    login_page.enter_password(form_data["password"]) 
    login_page.click_login()
