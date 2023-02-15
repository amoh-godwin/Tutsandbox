class MyList(list):

    def __init__(self, items=[]):
        super().__init__(items)

    def __getitem__(self, index):
        length = super().__len__()
        if length == 0 or index > (length - 1):
            return None
        else:
            super().__getitem__(index)

    def append(self, value):
        type_ = type(value)
        print(type_)
        if type_ != type(0):
            print('This this list only accepts integers')
        else:
            super().append(value)

list2 = MyList([1, 2, 3])
list2.append('4')
list2.append(4)
print(list2)
