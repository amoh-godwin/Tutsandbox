class MyDict(dict):

    def __init__(self, items={}):
        super().__init__(items)

    def __setitem__(self, _key, _value) -> None:
        print(f"Inserting {_key}")
        return super().__setitem__(_key, _value)
    
    def __getitem__(self, _key):
        length = super().__len__()
        if length < 0 or _key not in super().items():
            print(f"Key: {_key} doesn't exits")
            return None
        return super().__getitem__(_key)

    def __delitem__(self, _key) -> None:
        if _key == 'admin':
            print("You can't delete admin entry")
            return
        return super().__delitem__(_key)


dict1 = MyDict({'admin': 'active'})
print(dict1['johndoe'])
dict1['janemaxwell'] = 'inactive'
print(dict1)
del dict1['admin']
