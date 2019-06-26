class BulkActions():
    
    def get_variables(self, arg=None):
        locators = {
            'bulk_actions_header' : '//div[@string_type="label"][contains(text(),"Bulk actions")]',
            'bulk_actions_view_queue_dropdown' : '//select[@title="ViewQueueFor"]',
            'urgency_value_textbox' : '//div[@data-node-id="UrgencyUpdate"]//div[@class="field-item dataValueWrite"]//input',
            'urgency_update_reason_dropdown' : '//div[@data-node-id="UrgencyUpdate"]//div[@class="field-item dataValueWrite"]//select',
            'submit_new_urgency_button' : '//button[@id="ModalButtonSubmit"]',
            'update_urgency_modal' : '//div[@id="modaldialog_hd"]',
            'update_urgency_error_message' : '//div[text() ="Please select at least one case for update"]',
            }
        return locators
