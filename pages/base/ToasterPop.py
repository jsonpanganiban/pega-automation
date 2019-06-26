class ToasterPop():

    def get_variables(self):
        locators = {
            # Incoming call
            'incoming_call_popup' : '//div[@data-node-id="IncomingCallPop"]',
            'incoming_call_label' : '//div[@data-node-id="CPMToasterTop"]//div[@id="CT"][last()]/following-sibling::div',
            'incoming_call_pop_firstname' : '(//div[@node_name="IncomingCallPopContent"]//span[@class="heading_2"])[1]',
            'incoming_call_pop_lastname' : '(//div[@node_name="IncomingCallPopContent"]//span[@class="heading_2"])[2]',
            'accept_call_button' : '//button[@title="Accept the call"]',
            }
        return locators