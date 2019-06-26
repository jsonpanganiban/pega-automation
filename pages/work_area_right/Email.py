class Email():
    
    def get_variables(self, arg=None):
        locators = {
            'email_header' : '//div[contains(@class, "inbound-email-pane-header")]//div[contains(text(), "Email")]',
            'email_subject' : '//span[@class="case_title"]',
            'email_from' : '//div[contains(@class,"content-item content-field item-3")]//span[@class="supporting_text"]',
            'email_to': '//div[contains(@class,"content-item content-field item-2")]//span[@class="supporting_text"]',
            'email_sender_name' : '//span[contains(@class,"assignment_title")]',
            'reply_button' : '//div[text()="Reply..."]',
            'email_editor' : '//div[@id="cke_PEGACKEDITOR1"]',
            'send_email_button' : '//button[@title="Send"]',
            'cancel_email_button' : '//a[@title="Cancel"]',
            'from_email' : '(//div[@pyclassname="Work-Channel-Triage-Email"]//span[@class="supporting_text"])[1]',
            'to_email' : '(//div[@pyclassname="Work-Channel-Triage-Email"]//span[@class="supporting_text"])[2]',
            'email_message_body' : '//div[@class="rteReadOnlyWithoutTB"]',
            }
        return locators
