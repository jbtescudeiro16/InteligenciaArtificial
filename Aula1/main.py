import Grafo
def main ():
    g=Grafo()
    g.add_connection("s","e",2)
    g.add_connection("s", "a", 2)
    g.add_connection("a", "b", 2)
    g.add_connection("e", "f", 5)
    g.add_connection("b", "c", 2)
    g.add_connection("f", "g", 2)
    g.add_connection("c", "d", 3)
    g.add_connection("g", "t", 2)
    g.add_connection("d", "t", 3)

    print(g.procura_DFS("s","t",path[],visited))


if __name__ ==name "__main__":
    main()