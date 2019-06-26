class InteractionPortal():
    
    def get_variables(self, arg=None):
        locators = {
            'cxp_framework_logo' : '//div[contains(@class,"application_name_heading dataValueRead")]',
            'new_button' : 'css=[title="New"]',
            'new_call_interaction' : '//a[@title="New call interaction"]',
            'button_close_tab' : '//span[@title="Close Tab"]',
            'interaction_portal_header' : 'css=[data-node-id="CPMInteractionPortalHeader"]',
            'home_tab_main' : '//div[@data-node-id="HomeTabMain"]',
            # Sidebar
            'menu_items_panel' : '//div[contains(@class, "menu-slider menu-slider")]',
            'menu_items' : '//ul[contains(@data-menu-id, "CPMPortalCSHomeTabNavigation")]/li//span[@class="menu-item-title"]',
            # Work Items
            'user_work_list_section' : '//div[@node_name="CPMUserWorkList"]',
            'view_queue_dropdown' : '//select[@title="View queue for" or @title="ViewQueueFor"]',
            'my_workbasket_table' : '//div[@rdparams="WorkBasketID,WorkGroup,SearchText"]',
            'work_item' : '//a[@title="Open work object ',
            'search_case_bar' : '//input[@title="Search for a Case"]',
            'search_icon' : '//img[contains(@name,"CPMSearchMyWork")]',
            # Logout
            'avatar_name' : '//i[contains(@class,"icons avatar name")]',
            'workarea_title' : '//span[@class="workarea_header_titles"]',
            'logout' : '//span[@class="menu-item-title" and text()="Logout"]',
            'menu_slider' : '//div[contains(@class, "menu-slider")]',
            }
        return locators
