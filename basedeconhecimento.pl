/* BASE DE conhecimentos: verifica caracteristicas especificas dos animais
*/

conhecimento('o animal eh mamifero',
['o animal tem cabelo' ; 'o animal tem leite']).

conhecimento('animal eh ave',
['o animal tem penas';'animal voa','animal bota ovos']).

conhecimento('animal eh carnivoro',['o animal eh mamifero',
'animal come carne' ; 'animal tem dentes pontudos','animal possui garras','animal possui olhos pontudos']).

conhecimento('animal eh guepardo',
['animal eh carnivoro', 'animal fulvo',
 'animal com manchas']).

conhecimento('animal eh tigre',
['animal eh carnivoro', 'animal fulvo',
 'animal com listras pretas']).

 conhecimento('animal eh pinguim',
 ['animal eh ave', 'animal nao voa',
  'animal nada']).

  conhecimento('animal eh albatros',
  ['animal tem grande envergadura', 'animal eh ave']).


id_Imagem_perg('o animal tem leite','leite').
id_Imagem_perg('o animal tem cabelo','cabelo').
id_Imagem_perg('o animal tem penas','penas').
id_Imagem_perg('animal voa','voa').
id_Imagem_perg('o animal eh mamifero','mamifero').
id_Imagem_perg('animal come carne','carne').
id_Imagem_perg('animal tem dentes pontudos','dentespontudos').
id_Imagem_perg('animal possui garras','garras').
id_Imagem_perg('animal possui olhos pontudos','olhospontudos').
id_Imagem_perg('animal eh carnivoro','carnivoro').
id_Imagem_perg('animal fulvo','fulvo').
id_Imagem_perg('animal com manchas','manchas').
id_Imagem_perg('animal com listras pretas','listras pretas').
id_Imagem_perg('animal eh ave','ave').
id_Imagem_perg('animal nao voa','nvoa').
id_Imagem_perg('animal nada','nada').
id_Imagem_perg('animal tem grande envergadura','evergadura').
