class Menu:
    def __init__(self, menu_filename):
        self.menu=[]
        with open(menu_filename, "r"):
            # csv stuff

    def random_food(self, budget):
        self.food_choice_num=0 #rand function
        self.food_choice=self.menu[self.food_choice_num]
        self.max_item=budget/self.food_choice['cost']
        self.food_amount=0 #rand function
