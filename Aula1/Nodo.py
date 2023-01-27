class Nodo :

        def __init__(self,name,id=-1):
            self.name=str(name)
            self.id=id

        def __str__(self):
            return "node : " + self.name

        def get_id(self):
            return self.id

        def set_id(self,id):
            self.id = id

        def get_name(self):
            return self.name

        def set_name(self,name):
            self.name=name
