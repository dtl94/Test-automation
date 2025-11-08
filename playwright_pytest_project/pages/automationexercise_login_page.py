from playwright.sync_api import Page

class LoginPage:
    
    def __init__(self, page:Page):
        self.page = page
        # Retreive login elements
        self.email_login_input = page.locator("form").filter(has_text="Login").get_by_placeholder("Email Address")
        self.password_input = page.get_by_role("textbox", name="Password")
        self.login_button = page.get_by_role("button", name="Login")
        # Retreive signup elements
        self.name_input = page.get_by_role("textbox", name="Name")
        self.email_signup_input = page.locator("form").filter(has_text="Signup").get_by_placeholder("Email Address")
        self.signup_button = page.get_by_role("button", name="Signup")
        
    def enter_username(self, username: str):
        self.name_input.fill(username)
        
    def enter_password(self, password: str):
        self.password_input.fill(password)

    def enter_email_login(self, email_login: str):
        self.email_login_input.fill(email_login)

    def enter_email_signup(self, email_signup: str):
        self.email_signup_input.fill(email_signup)
        
    def click_login(self):
        self.login_button.click()

    def click_signup(self):
        self.signup_button.click()
        
    def login(self, email_login: str, password: str):
        self.enter_email_login(email_login)
        self.enter_password(password)
        self.click_login()

    def signup(self, username: str, email_signup: str):
        self.enter_username(username)
        self.enter_email_signup(email_signup)
        self.click_signup()