class AdvancedCaseSearch(object):
    
    def get_variables(self, *args):
    
        locators = {
        # Landing Page
        'advanced_case_search_label': '//div[contains(@class,"heading_1_dataLabelWrite")]',
        'advanced_case_search_body': '//div[@node_name="AdvancedSearchCases"]',
        # Search Fields
        'created_on_from': '//span[contains(@id,"FromDateTimeSpan")]/input',
        'created_on_to': '//span[contains(@id,"CreationSpan")]/input',
        'closed_on_from': '//span[contains(@id,"ToDateTimeSpan")]/input',
        'closed_on_to': '//span[contains(@id,"ClosedSpan")]/input',
        'last_updated_on_from': '//span[contains(@id,"RangeFromSpan")]/input',
        'last_updated_on_to': '//span[contains(@id,"ToSpan")]/input',
        'search_button': '//button[contains(text(),"Search")]',
        'search_results_table': '//input[@id="D_SearchCasePpxResults1colWidthGBR"]/parent::td',
        'column_clear_filter' : '//a[@id="clearFilter"]',
        'search_text' : '//div[@pyclassname="Pega-ColumnFilterCriteria"]//input[contains(@name, "SearchText")]',
        'grid_table' : '//div[@data-node-id="HomeTabMain"]//table[@id="gridLayoutTable"]',
        'case_status_dropdown' : '//label[text()="Case Status"]/following-sibling::div/select',
        }
        return locators