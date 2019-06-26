class XpathUtil():

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def get_work_item_xpath(self, item_name):
        return '//h3[@class="layout-group-item-title" and contains(text(),"' + item_name + '")]'
    
    def get_viewqueue_option_xpath(self, option_name):
        return '//select[@title="View queue for" or @title="ViewQueueFor"]/option[@value="' + option_name + '"]'
    
    def get_viewqueue_bulk_action_xpath(self, option_name):
        return  '//select[@title="ViewQueueFor"]/option[@value="' + option_name + '"]'
    
    def get_span_by_text_xpath(self, text):
        return '//span[text()="' + text + '"]'
       
    def get_span_by_data_id_xpath(self):
        return '//span[@data-test-id="' + data_id + '"]'

    def get_button_by_data_id_xpath(self):
        return '//button[@data-test-id="' + data_id + '"]'

    def get_button_by_text_xpath(self, button_text):
        return  '//button[@type="button" and contains(text(), "' + button_text + '")]'

    def get_button_by_title_xpath(self, button_title):
        return  '//button[@type="button" and @title="' + button_title + '"]'

    def get_button_pzbtnmid_xpath(self, button_text):
        return '//div[@class="pzbtn-mid" and contains(text(),"' + button_text + '")]'

    def get_anchor_by_data_id_xpath(self, data_id):
        return '//a[@data-test-id="' + data_id + '"]'
    
    def get_input_containing_name_xpath(self, name):
        return '//input[contains(@name,"' + name + '") and @type="text"]'
    
    def get_select_containing_name_xpath(self, name):
        return '//select[contains(@name,"' + name + '")]'
    
    def get_menu_item_xpath(self, menu_item):
        return '//span[@class="menu-item-title" and text()="' + menu_item + '"]/ancestor::a'
    
    def get_work_object_step_instruction_xpath(self, text):
        return '//*[contains(text(),"' + text + '")]'
    
    def get_radio_label_or_span_xpath(self, text):
        return '//label[contains(@class,"radioLabel") and text()="' + text + '"]|//span[text()="' + text + '"]'
        
    def get_radio_label_xpath(self, label):
        return '//label[contains(@class, "radioLabel") and text()="' + label + '"]'
    
    def get_checkbox_containing_name_xpath(self, name):
        return '//input[@type="checkbox" and contains(@name,"' + name + '")]'
    
    def get_create_case_menu_item_xpath(self, case_name):
        return '//ul[@role="menu" and contains(@style,"block") and contains(@id,"ppyElements")]//a[@role="menuitem" and contains(@data-click,"createNewWork")]//span[contains(text(),"' + case_name + '")]' 

    def get_case_item_xpath(self, case_id):
        return '//a[@title="Open work object ' + case_id + '"]'
    
    def get_case_id_checkbox_xpath(self, case_id):
        return  '//tr[td[div[span[a[text()="' + case_id + '"]]]]]//input[@data-ctl="Checkbox"]'
    
    def get_email_status_xpath(self, email_status):
        return '//div[contains(@class,"status-"' + email_status.lower() + ')]'

    def get_email_sentiment_xpath(self, email_sentiment):
        return '//div[contains(@class,"inbound-email-pane-header")]//span[contains(text(),"' + email_sentiment.lower() + '")]'
    
    def get_email_category_xpath(self, email_category):
        return '//div[contains(@class,"inbound-email-pane-sub-header")]/div[contains(text(),"' + email_category + '")]'

    def get_customer_match_xpath(self, traveller_name):
        return '//div[@id="PEGA_GRID_CONTENT"]//tr[@pl_index="1"]//span[text()="' + traveller_name + '"]'

    def get_account_number_xpath(self, account_number):
        return '//div[@id="PEGA_GRID_CONTENT"]//span[text()="' + account_number + '"]'
    
    def get_urgency_value_xpath(self, case_id):
        return '//tr[td[div[span[a[text()="' + case_id + '"]]]]]/td[3]/div'
    
    def get_urgency_update_reason_xpath(self, update_reason):
        return '//div[@data-node-id="UrgencyUpdate"]//div[@class="field-item dataValueWrite"]//select/option[@value="' + update_reason + '"]'
    
    def get_case_urgency_via_row_xpath(self, row_number):
        return '//table[@grid_ref_page="pyBulkProcessingPage"]//tr[@pl_index="' + row_number + '"]//td[@headers="a3"]'
    
    def get_case_urgency_checbox_xpath(self, row_number):
        return '//tr[@pl_index="' + row_number + '"]//td//div//input[@data-ctl="Checkbox"]'
    
    def get_pega_tab_xpath(self, tab_name):
        return '//ul[@role="tablist"]//li[@role="tab" and @title="'+ tab_name +'"]'

    def get_result_table_header_xpath(self, column_name):
        return '//th[@data-attribute-name="'+ column_name + '"]'
    
    def get_result_table_header_filter_xpath(self, column_name):
        return self.get_result_table_header_xpath(column_name) + '//a[@id="pui_filter"]'
    
    def get_result_table_data_xpath(self, column_name):
        return '//td[@data-attribute-name="' + column_name + '"]'    

    def get_advance_case_search_xpath(self, field_label):
        return '//label[text()="' + field_label + '"]/following-sibling::div/descendant::input'