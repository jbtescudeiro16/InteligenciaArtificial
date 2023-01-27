

precosFruta = {'maçãs':2.00, 'laranjas': 1.50, 'pêras': 1.75}

def comprarFruta(fruta, numKgs):
 if fruta not in precosFruta:
    print("Lamento mas não temos %s" % (fruta))
 else:
    custo = precosFruta[fruta] * numKgs
    print("Serão %f euros, por favor" % (custo))


comprarFruta('laranjas',200)
comprarFruta('uvas',200)