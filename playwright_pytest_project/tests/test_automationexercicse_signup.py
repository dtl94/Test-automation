import re
from playwright.sync_api import Page, expect
from pages.automationexercise_login_page import LoginPage
from pages.automationexercise_signup_page import SignupPage


def test_signup(page: Page, config):
    
    login_url = config["login_url"]
    form_data = config["form_data"]

    login_page = LoginPage(page)
    signup_page = SignupPage(page)
    
    page.goto(login_url)
    login_page.signup(form_data["username"], form_data["email"])
    signup_page.signup_form(form_data["title"], form_data["password"], form_data["firstname"], form_data["lastname"], form_data["address"], form_data["country"], form_data["state"], form_data["city"], form_data["zipcode"], form_data["mobile"])
    expect(page).to_have_url(config["account_created_url"], timeout=60000)
    signup_page.is_creation_success()
    