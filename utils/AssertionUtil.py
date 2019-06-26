from robot.libraries.BuiltIn import BuiltIn

class AssertionUtil(object):

    def __init__(self):
        pass        

    def is_order_ascending(self, list):
        for i in range(len([v for v in list if v.strip()]) - 1):
            if list[i] > list[i + 1]:
                return False
        return True
    
    def is_list_values_identical(self, value, list):
        return all(v == value for v in list)

# if __name__ == "__main__":
