import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.remote import switch_to
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

driver = webdriver.Chrome()
driver.get('https://cwt.pegatsdemo.com/prweb/TzPeanIZarbs3EVqMpxrUQ%5B%5B*/!STANDARD?pzPostData=-1352830109')
driver.find_element_by_id('txtUserID').send_keys('u001jcp')
driver.find_element_by_id('txtPassword').send_keys('Demo1')
driver.find_element_by_css_selector('#sub.loginButton').click()
driver.find_element_by_css_selector('a.Header_nav[alt="Launch another portal"]').click()


element = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.XPATH, "//span[text()='Interaction portal']")))
time.sleep(5)
driver.switch_to.active_element
element.click()

handles = driver.window_handles
WebDriverWait(driver, 10).until(
    EC.new_window_is_opened(handles))

driver.switch_to.window(driver.window_handles[-1])

element = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.CSS_SELECTOR, '[title="New"]')))
element.click()

element = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.XPATH, '//span[text()="Phone Call"]')))
element.click()

# WebDriverWait(driver, 10).until(
#     EC.presence_of_element_located((By.CSS_SELECTOR, '.Interaction_tab_header')))

WebDriverWait(driver, 10).until(
    EC.frame_to_be_available_and_switch_to_it((By.NAME, 'PegaGadget1Ifr')))

ele = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.CSS_SELECTOR, '[id="SearchStringLastName"]')))
ele.send_keys('Connor')
# driver.close()