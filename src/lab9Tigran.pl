encoding(utf8).

местоимение(местоимение(я),1,единственное) -->[я].
местоимение(местоимение(ты),2,единственное) -->[ты].
местоимение(местоимение(он),3,единственное) -->[он].
местоимение(местоимение(она),3,единственное) -->[она].
местоимение(местоимение(оно),3,единственное) -->[оно].
местоимение(местоимение(мы),1,множественное) -->[мы].
местоимение(местоимение(вы),2,множественное) -->[вы].
местоимение(местоимение(они),3,множественное) -->[они].
предложение(Подлежащее) --> подлежащее(Подлежащее,_,_).
предложение(Сказуемое) --> сказуемое(Сказуемое,_,_).
сказуемое(А,Лицо,Число)-->глагол(А,Лицо,Число).
подлежащее(А,Лицо,Число)-->местоимение(А,Лицо,Число).

глагол(глагол(пишу),1,единственное) -->[пишу].
глагол(глагол(пишем),1,множественное) -->[пишем].
глагол(глагол(пишешь),2,единственное) -->[пишешь].
глагол(глагол(пишете),2,множественное) -->[пишете].
глагол(глагол(пишет),3,единственное) -->[пишет].
глагол(глагол(пишут),2,множественное) -->[пишут].
дополнение(Существительное)-->существительное(винительный,Существительное).
существительное(винительный,существительное(программу)) -->[программу].
предложение(Сказуемое,Дополнение)-->сказуемое(Сказуемое,_,_),дополнение(Дополнение).
