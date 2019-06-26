import time
from PageObjectLibrary import PageObject
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from selenium.common.exceptions import WebDriverException, NoSuchElementException, StaleElementReferenceException

class PegaUtil(PageObject):

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    
    _locators = {
        'active_frame_xpath' : '//div[contains(@id, "PegaWebGadget") and @style="display: block;"]/iframe|//div[contains(@id,"module") and contains(@style,"block")]/div[contains(@id,"PegaWebGadget")]/iframe[contains(@id,"PegaGadget")]|//div[contains(@data-pega-gadgetname,"PegaGadget")]/iframe[contains(@id,"PegaGadget")]',
        'tabless_active_frame_xpath' : '(//iframe[contains(@id,"PegaGadget")])[last()]',
        'throbber_xpath' :'//ul[@class="throbber"]',
        'doc_state_xpath' : '//div[@class="document-statetracker"]',
        'tab_containing_pega_gadget_frame_xpath' : '//div[@id="workarea"]//li[@role="tab"][@tabgroupname!=""]',
        }

    @property
    def wait(self):
        return WebDriverWait(self.driver, 60)
   
    def switch_to_window(self, window_name):
        handles = self.driver.window_handles
        self.wait.until(EC.new_window_is_opened(handles))
        self.selib.select_window(window_name)
    
    def switch_to_pega_frame(self, frame_name):
        self.switch_to_default_content()
        self.wait.until(EC.frame_to_be_available_and_switch_to_it((By.NAME, frame_name)))
        
    def wait_until_page_is_loaded(self):
        self.wait.until(page_is_loaded())
#         self.wait.until(jquery_is_not_active())        

    def wait_until_throbbing_is_completed(self):
        self.wait.until(EC.invisibility_of_element_located((By.XPATH, '//ul[@class="throbber"]')))

    def switch_to_default_content(self):
        self.driver.switch_to.default_content()

    def switch_to_active_frame(self):
        try:
            frame_id = self.get_active_frame_id()
            self.driver.switch_to_frame(frame_id)
        except Exception as e:
            self.builtin.fail("Error in switch: " + str(e))
        
    def get_active_frame_id(self):
        self.switch_to_default_content()
        self.wait_until_doc_state_is_ready()
        tab_elem = self.driver.execute_script("return document.evaluate(\"//div[@id='workarea']//li[@role='tab'][@tabgroupname!='']\",document.body, null, XPathResult.ANY_TYPE, null).iterateNext()")
        is_tab_present = bool(tab_elem is not None)
        if self.driver.find_element_by_xpath(self.locator.doc_state_xpath).is_displayed():
            self.wait_until_doc_state_is_ready()
        else:
            self.wait_until_page_is_loaded()
            self.wait.until(EC.presence_of_element_located((By.XPATH, self.locator.active_frame_xpath)))
        self.switch_to_default_content()
        if is_tab_present:
            self._wait_for_frames_to_be_loaded()
        frame_id = self.driver.find_element_by_xpath(self.locator.active_frame_xpath).get_attribute('id')
        self.logger.info('Active frame is ' + frame_id)
        return frame_id
        
    def _wait_for_frames_to_be_loaded(self):
        self.wait.until(frame_is_loaded())
        
    def wait_until_doc_state_is_ready(self):
        self.wait_until_page_is_loaded()
#         self.wait.until(EC.invisibility_of_element_located((By.CSS_SELECTOR, '[data-state-busy-status="busy"]')))
        elems = self.driver.find_elements_by_xpath('//div[@class="document-statetracker"]')
        if len(elems) > 0:
            self.wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, '[data-state-busy-status="none"]')))

    def close_all_tabs(self):
        self.switch_to_default_content()
        tabs = self.driver.find_elements_by_xpath('//span[@title="Close Tab"]')
        for tab in reversed(tabs):
            self._retry_on_exception(StaleElementReferenceException, lambda: tab.click())

    def close_tab(self, tab_title):
        self.switch_to_default_content()
        tab = self.driver.find_element_by_xpath('//ul[@role="tablist"]//li[@role="tab" and @title="' + tab_title + '"]//span[@id="close"]')
        self._retry_on_exception(StaleElementReferenceException, lambda: tab.click(), 2)
#         try:
#             self.switch_to_active_frame()
#             close_dialog = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, '//span[text()="Confirm close"]')))
#             if close_dialog.is_visible():
#                 self.driver.find_element_by_xpath('//button[@type="button" and text()="OK"]').click()
#         except Exception:
#             pass
#         finally:
#             self.switch_to_default_content()
        self.wait.until(EC.invisibility_of_element_located(tab))
        self.driver.find_element_by_xpath('//ul[@role="tablist"]//li[@role="tab" and @title="Home"]').click()
        
    def _retry_on_exception(self, exception, test_function, retries=5):
        for _ in range(retries):
            try:
                return test_function()
            except Exception:
                pass
            
    def wait_until_busy_indicator_is_completed(self):
        self.wait.until(EC.invisibility_of_element_located((By.XPATH, '//div[contains(@class,"pega_ui_busyIndicator") and @style="visibility: visible;"]')))

class page_is_loaded(PageObject):
    def __call__(self, driver):
        try:
            return self.driver.execute_script('return document.readyState;') == 'complete'
        except WebDriverException:
            return False

class jquery_is_not_active(PageObject):
    def __call__(self, driver):
        try:
            return self.driver.execute_script('return jQuery.active;') == 0
        except WebDriverException:
            return False

class frame_is_loaded(PageObject):
    def __call__(self, driver):
        try:
            tabs = self.driver.find_elements_by_css_selector('ul[role="tablist"] li[role="tab"]')
            current_frames = self.driver.find_elements_by_xpath('//iframe[contains(@id,"PegaGadget")]')
            diff = len(tabs) - len(current_frames)
            return diff != -1
        except WebDriverException:
            return False