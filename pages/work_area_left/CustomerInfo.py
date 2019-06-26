class CustomerInfo():

    def get_variables(self, arg=None):
        locators = {
            'customer_info_card' : 'css=[node_name="CPMInteractionHeader"]',
            'customer_icon' : '//i[@title="Customer"]',
            'customer_full_name' : '//span[@class="interaction_header_title"]',
            'customer_client' : 'css=div[class*="item-2"] div[class*="spacing heading_6"]',  # MISSING IN ENVIRONMENT
            'customer_email' : '//a[@title="Click to send an email to this address"]',
            'customer_phone_number' : '//span[@title="Please login to CTI Phone enable callback"]',
            'customer_arranger' : 'css=div[class*="item-2 remove-bottom-spacing"][class*="heading_6"]',  # MISSING IN ENVIRONMENT
            
            #INTERACTION TIMER           
            'interaction_timer' : '//div[@data-node-id="CSInteractionTimer"]',
            'elapsed_time' : '//span[@id="elapsedTime"]',
            'goal_time' : '//span[@id="goalTime"]', 
            'button_add_task' : '//button[@title="Add Task"]',
            'button_wrap_up' : '//button[@title="Wrap Up"]',
            }
        return locators