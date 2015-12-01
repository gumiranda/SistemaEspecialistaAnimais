/* MOTOR DE INFERENCIA: Essa eh a parte do sistema especialista que se encarrega de inferir qual eh a conclusao
a partir das perguntas feitas
*/
:- dynamic conhecido/1.

 mostrar_conclusao(X):-tira_conclusao(X),clean_scratchpad.
 mostrar_conclusao(conclusao_desconhecida):-clean_scratchpad .

 tira_conclusao(conclusao):-
                           obtem_caracteristicas_e_Particularidades(conclusao, ListaDeParticularidades),
                           prova_existencia_de(conclusao, ListaDeParticularidades).


obtem_caracteristicas_e_Particularidades(conclusao, ListaDeParticularidades):-
                           conhecimento(conclusao, ListaDeParticularidades).


prova_existencia_de(conclusao, []).
prova_existencia_de(conclusao, [Head | Tail]):- prova_verdade_de(conclusao, Head),
                                             prova_existencia_de(conclusao, Tail).


prova_verdade_de(conclusao, Particularidade):- conhecido(Particularidade).
prova_verdade_de(conclusao, Particularidade):- not(conhecido(is_false(Particularidade))),
pergunta_sobre(conclusao, Particularidade, Reply), Reply = 'sim'.


pergunta_sobre(conclusao, Particularidade, Reply):- perguntar(Particularidade,Respostas),
                         process(conclusao, Particularidade, Respostas, Reply).


process(conclusao, Particularidade, sim, sim):- asserta(conhecido(Particularidade)).
process(conclusao, Particularidade, nao, nao):- asserta(conhecido(is_false(Particularidade))).


clean_scratchpad:- retract(conhecido(x)), fail.
clean_scratchpad.


conhecido(_):- fail.

not(X):- X,!,fail.
not(_).
