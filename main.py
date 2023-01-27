# Este é um comentário
frutas = ['maçãs', 'laranjas', 'pèras', 'bananas']
for fruta in frutas:
  print(fruta + ' para venda')
  precosFruta = {'maçãs': 2.00, 'laranjas': 1.50, 'pêras': 1.75}
for fruta, preco in precosFruta.items():
    if preco < 2.00:
         print('As %s custam %f o kg' % (fruta, preco))
    else:
        print("As " + fruta + ' são demasiado caras!')
