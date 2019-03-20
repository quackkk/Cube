program test_priority;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  calc_priority,
  Service_SerGo,
  analyze;

var
  mass: tm;
  n, i, k: shortint;

begin
  repeat
    write('Enter N: ');
    readln(n);
    out_cubes('cubes.txt',10,n,true,true);
    mass :=generation(n);
    print_tm(mass);//cubes
    write('Enter pos cube[0..N-1]: ');     // p
    readln(k);                             //  r
    print_tm(priority_mas_1(k,mass));      //   i
    writeln;                               //    o  
    print_tm(priority_mas_2(k,mass));      //     r
    writeln;                               //      i
    print_tm(priority_mas_3(k,mass));      //       t
    writeln;                               //        y
    assertequal_ser(k,priority_mas_1(k,mass),priority_mas_2(k,mass),priority_mas_3);
  until false;
end.
 
