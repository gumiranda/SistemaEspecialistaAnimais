/*
interface GRAFICA:
Esta parte do sistema especialista eh a que se encarrega de interagir com a pessoa comum, mostrando imagens,botoes,textos,etc
*/
 :- use_module(library(pce)).
 :- pce_image_directory('./imagens').
 :- use_module(library(pce_style_item)).
 :- dynamic color/2.

 resource(img_principal, image, image('principal.jpg')).
 resource(cabelo, image, image('cabelo.jpg')).
 resource(penas, image, image('penas.jpg')).
 resource(voa, image, image('voa.jpg')).
 resource(mamifero, image, image('mamifero.jpg')).
 resource(carne, image, image('carne.jpg')).
 resource(dentespontudos, image, image('dentespontudos.jpg')).
 resource(garras, image, image('garras.jpg')).
 resource(olhospontudos, image, image('olhospontudos.jpg')).
 resource(carnivoro, image, image('carnivoro.jpg')).
 resource(fulvo, image, image('fulvo.jpg')).
 resource(manchas, image, image('manchas.jpg')).
 resource(listrado, image, image('listrado.jpg')).
 resource(ave, image, image('ave.jpg')).
 resource(nvoa, image, image('nvoa.jpg')).
 resource(nada, image, image('nada.jpg')).
 resource(envergadura, image, image('envergadura.jpg')).

 mostrar_Imagem(Tela, Imagem) :- new(Figura, figure),
                                     new(Bitmap, bitmap(resource(Imagem),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Tela, display,Figura,point(100,80)).
  mostrar_Imagem_respento(Tela, Imagem) :-new(Figura, figure),
                                     new(Bitmap, bitmap(resource(Imagem),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Tela, display,Figura,point(20,100)).
 nova_imagem(Janela, Imagem) :-new(Figura, figure),
                                new(Bitmap, bitmap(resource(Imagem),@on)),
                                send(Bitmap, name, 1),
                                send(Figura, display, Bitmap),
                                send(Figura, status, 1),
                                send(Janela, display,Figura,point(0,0)).
  imagem_pergunta(Janela, Imagem) :-new(Figura, figure),
                                new(Bitmap, bitmap(resource(Imagem),@on)),
                                send(Bitmap, name, 1),
                                send(Figura, display, Bitmap),
                                send(Figura, status, 1),
                                send(Janela, display,Figura,point(500,60)).
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
  botoes:-apagado,
                send(@botao, free),
                send(@resposta,free),
                mostrar_conclusao(Caracteristica),
                send(@texto, selection('As caracteristicas encontradas a partir dos dados eh:')),
                send(@resp1, selection(Caracteristica)),
                new(@botao, button('Iniciar consulta',
                message(@prolog, botoes)
                )),

                new(@resposta,button('Resposta',
                message(@prolog, mostrar_resposta,Caracteristica)
                )),

                send(@main, display,@botao,point(20,450)),
                send(@main, display,@resposta,point(138,450)).



  mostrar_resposta(X):-new(@resp, dialog('Conclusao')),
                          send(@resp, append, label(nome, 'Explicacao: ')),
                          send(@resp, display,@lblExp1,point(70,51)),
                          send(@resp, display,@lblExp2,point(50,80)),
                          animal(X),
                          send(@resp, transiment_for, @main),
                          send(@resp, open_centered).

animal(X):- send(@lblExp1,selection('De acordo com as caracteristicas o  animal eh:')),
                 mostrar_Imagem_animal(@resp,X).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


   perguntar(Perg,Resp):-new(Di,dialog('Consultar Dados:')),
                        new(L2,label(texto,'Responda as seguintes Perguntas')),
                        id_Imagem_perg(Perg,Imagem),
                        imagem_pergunta(Di,Imagem),
                        new(La,label(prob,Perg)),
                        new(B1,button(simm,and(message(Di,return,sim)))),
                        new(B2,button(no,and(message(Di,return,no)))),
                        send(Di, gap, size(25,25)),
                        send(Di,append(L2)),
                        send(Di,append(La)),
                        send(Di,append(B1)),
                        send(Di,append(B2)),
                        send(Di,default_button,'sim'),
                        send(Di,open_centered),get(Di,confirm,Answer),
                        free(Di),
                        Resp=Answer.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  interface_principal:-new(@main,dialog('Sistema especialista identificador de caracteristicas e tipos de animais',
        size(1000,1000))),
        new(@texto, label(nome,'A conclusao a partir dos dados eh:',font('times','roman',18))),
        new(@resp1, label(nome,'',font('times','roman',22))),
        new(@lblExp1, label(nome,'',font('times','roman',14))),
        new(@lblExp2, label(nome,'',font('times','roman',14))),
        new(@sair,button('sair',and(message(@main,destroy),message(@main,free)))),
        new(@botao, button('Iniciar consulta',message(@prolog, botoes))),

        new(@resposta,button('qual eh o animal?')),

        nova_imagem(@main, img_principal),
        send(@main, display,@botao,point(138,450)),
        send(@main, display,@texto,point(20,130)),
        send(@main, display,@sair,point(300,450)),
        send(@main, display,@resp1,point(20,180)),
        send(@main,open_centered).

       apagado:- send(@resp1, selection('')).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  cria_interface_inicio:- new(@interface,dialog('Bem vindo ao Sistema Especialista de Animais',
  size(1000,1000))),

  mostrar_Imagem(@interface,img_principal),

  new(botaoComecar,button('COMEÇAR',and(message(@prolog,interface_principal) ,
  and(message(@interface,destroy),message(@interface,free)) ))),
  new(botaosair,button('SAIR',and(message(@interface,destroy),message(@interface,free)))),
  send(@interface,append(botaoComecar)),
  send(@interface,append(botaosair)),
  send(@interface,open_centered).
