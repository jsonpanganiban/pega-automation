class TravellerInfo():

    def get_variables(self):
        locators = {
            # Incoming call
            'incoming_call_popup' : '//div[@data-node-id="IncomingCallPop"]',
            'incoming_call_label' : '//div[@data-node-id="CPMToasterTop"]//div[@id="CT"][1]',
            'incoming_call_pop_firstname' : '(//div[@node_name="IncomingCallPopContent"]//span[@class="heading_2"])[1]',
            'incoming_call_pop_lastname' : '(//div[@node_name="IncomingCallPopContent"]//span[@class="heading_2"])[2]',
            'accept_call_button' : '//button[@title="Accept the call"]',
            # Phone call interaction
            'phone_interaction_icon' : '//i[@class="pcs-phone pi-tab-icon"]',
            # Traveler Dashboard
            'profile_notes_label' : '//div[@data-node-id="ProfileNotes"]',
            'personal_preferences_section' : 'css=div[param_name=EXPANDEDSubSectionPreferencesB]',
            'personal_preferences' : '//h2[contains(text(), "Personal Preferences")]',
            'personal_preferences_tabs' : '//div[contains(@data-lg-id,"LGLayoutGroupPreferences")]',
            'air_tab' : '//h3[text()="Air"]',
            'car_tab' : '//h3[text()="Car"]',
            'hotel_tab' : '//h3[text()="Hotel"]',
            'general_tab' : '//h3[text()="General"]',
            'main_panel_header' : 'css=div#DialogContent',
            # Search traveler
            'lastname_search' : '//input[@title="Search string last name"]',
            }
        return locators