phonebookSize(0).


/* Запуск программы */
run:-
     retractall(quotation/3),
     consult('db.txt'),
     menu.

/* Формирование меню */
menu:-
      repeat,
          write('-----------------------'),nl,nl,
      write('Quotations of securities'),nl,nl,
      write('1-Show'),nl,
      write('2-Add'),nl,
      write('3-Del'),nl,
      write('4-Save'),nl,
      write('5-Search'),nl,
      write('6-Exit'),nl,
          write('--------------------------------'),nl,
      write('Your choise: (1-6) '),
      read(X),
      X<7,
      process(X),
      X=6,!.

process(1):-view_quotation.
process(2):-add_quotation,!.
process(3):-remove_quotation,!.
process(4):-db_save_quotation,!.
process(5):-find_quotation,!.
process(6):-retractall(quotation/3),!.

/* Чтение файла и просмотр базы данных */
view_quotation:-
                quotation(Name,Volume,Price),
                write('Name: '), write(Name),nl,
                write('Volume: '), write(Volume),nl,
                write('Price: '), write(Price),nl,
                write('-------------------------------'),nl.

/* Добавление */
add_quotation:-
        write('Add new quotation:'),nl,nl,
        repeat,
        write('Name: '),
        read(Name),
        write('Volume: '),
        read(Volume),
        write('Price: '),
        read(Price),
        assertz(quotation(Name,Volume,Price)),
        quest,!.

quest:-
       write('Add more? y/n '),
       read(A),
       answer(A).

answer(_):-fail.
answer(y):-fail.
answer(n).

/* Сохранение динамической БД в файл */
db_save_quotation:-
        tell('db.txt'),
        listing(quotation),
        told,
        write('File db.txt save!').

/* Удаление вида металла*/
remove_quotation:-
           write('Delete quotation'),nl,nl,
           write('Name: '),
           read(Name),
           retract(quotation(Name,_,_)),
           write('Quotation delete!'),nl,nl.

/* Поиск металла по условию */
find_quotation:-
           write('Volume: '),
           read(SearchVolume),
           findall(Volume,quotation(Quotation,Volume,Price),Sp),
           quotation(Quotation,Volume,Price),
           Volume = SearchVolume,
           write('Name: '), write(Quotation),nl,
           write('Volume: '), write(Volume),nl,
           write('Price: '), write(Price),nl,
           write('-------------------------------'),nl,
           fail.

/* Поиск минимального элемента */
min([Head|Tail],Rezult):-
                         min(Tail,Rezult),
                         Rezult < Head,!.
min([Head|_],Head).
