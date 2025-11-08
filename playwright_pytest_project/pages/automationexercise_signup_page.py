from playwright.sync_api import Page, expect

class SignupPage:
    
    def __init__(self, page:Page):
        self.page = page
        self.password_input = page.get_by_role("textbox", name="Password *")
        self.firstname_input = page.get_by_role("textbox", name="First name *")
        self.lastname_input = page.get_by_role("textbox", name="Last name *")
        self.address_input = page.get_by_role("textbox", name="Address * ")
        self.country_input = page.get_by_label("Country *")
        self.state_input = page.get_by_role("textbox", name="State *")
        self.city_input = page.get_by_role("textbox", name="City * Zipcode *")
        self.zipcode_input = page.locator("#zipcode")
        self.mobile_input = page.get_by_role("textbox", name="Mobile Number *")
        self.create_input = page.get_by_role("button", name="Create Account")

    def signup_form(self, title: str, password: str, firstname: str, lastname: str, address: str, country: str, state: str, city: str, zipcode: str, mobile: str):
        self.page.wait_for_selector("form", timeout=10000)
        self.page.check(f"input[name='title'][value='{title}']")
        self.password_input.click()
        self.password_input.fill(password)
        self.firstname_input.click()
        self.firstname_input.fill(firstname)
        self.lastname_input.click()
        self.lastname_input.fill(lastname)
        self.address_input.click()
        self.address_input.fill(address)
        self.country_input.click()
        self.country_input.select_option(country)
        self.state_input.click()
        self.state_input.fill(state)
        self.city_input.click()
        self.city_input.fill(city)
        self.zipcode_input.click()
        self.zipcode_input.fill(zipcode)
        self.mobile_input.click()
        self.mobile_input.fill(mobile)
        self.create_input.click()

    def is_creation_success(self):
        # Wait for success
        success = self.page.locator("#form")
        expect(success).to_be_visible(timeout=10000)
        success_message = self.page.locator('[data-qa="account-created"]')
        expect(success_message).to_be_visible()
        expect(success_message).to_have_text("Account Created!")
