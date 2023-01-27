import Nodo
class Grafo:

    def __init__(self,direcionado):
        self.m_nodos=[]
        self.direcionado=direcionado
        self.m_grafo = {}

    def __str__(self):
        out = ''
        for k in self.m_grafo.keys():
            out=  out + " node :" + str(k) + str(self.m_grafo[k])
        return out

    def add_connection(self, nodo1, nodo2 , custo):
        n1 =Nodo(nodo1)
        n2 =Nodo(nodo2)
        if n1 not in self.m_nodos:
            n1.id=len(self.m_nodos)
            n1.set_id(n1.id)
            self.m_nodos.append(n1)
            self.m_grafo[nodo1]=set()
        if n2 not in self.m_nodos:
            n2.id=len(self.m_nodos)
            n2.set_id(n2.id)
            self.m_nodos.append(n2)
            self.m_grafo[nodo2]=set()
        self.m_grafo[nodo1].add((nodo2,custo))
        if not self.direcionado:
            self.m_grafo[nodo2].add((nodo1, custo))


    def calcula_custo(self,caminho):
            teste=caminho
            custo =0
            i=0
            while( (i +1)< len(teste)):
                custo = custo + self.get_arc_cost(teste[i],teste[i+1])
                i=i+1
            return custo

    def get_arc_cost(self,nodo1,nodo2):
             n1 = Nodo(nodo1)
             n2 = Nodo(nodo2)
             if n1 in self.m_nodos:
                   if n2 in self.m_nodos:
                       return self.m_grafo[nodo1].getValues(nodo2)

    def procura_DFS(self, start, end, path=[], visited=set()):
        path.append(start)
        visited.add(start)

        if start == end:
            # calcular o custo do caminho funçao cacula custo
            custoT = self.calcula_custo(path)
            return (path, custoT)
        for(adjacente, peso) in self.m_graph[start]:
            if adjacente not in visited:
                resultado = self.procura_DFS(adjacente, end, path, visited)
                if resultado is not None:
                    return resultado
        path.pop() # se nao encontra remover o que está no caminho
        return None