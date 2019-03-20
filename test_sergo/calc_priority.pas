unit calc_priority;

interface

uses
  analyze;

function priority_mas_1(const p: byte; const cubes: tm): tm;

function priority_mas_2(const p: byte; const cubes: tm): tm;

function priority_mas_3(const p: byte; const cubes: tm): tm;

implementation

function priority_mas_3(const p: byte; const cubes: tm): tm;
  //cubes - array of cubes //p (ind_loc)- pos. of current cube
var
  len, i, j, m: integer;
begin
  len := length(cubes);
  setlength(result, len);
  for i := 0 to len - 1 do
  begin
    result[i, 1] := 0;
    result[i, 2] := 0;
  end;
  if (cubes[p, 1] = 0) or (cubes[p, 2] > 0) then
    exit;
    ///
  m := len + 1;
  for i := p - 1 downto 0 do
  begin//left
    if cubes[i, 1] = 0 then
      result[i, 1] := m - 1
    else if cubes[i, 2] = 0 then
      result[i, 2] := m - 1
    else
      break;
    dec(m);
  end;
  m := len + 1;
  for i := p + 1 to len - 1 do  //right
  begin
    if cubes[i, 1] = 0 then
      result[i, 1] := m - 1
    else if cubes[i, 2] = 0 then
      result[i, 2] := m - 1
    else
      break;
    dec(m);
  end;
  ///#3 method calc prior
end;

function priority_mas_2(const p: byte; const cubes: tm): tm;
  //cubes - array of cubes //p (ind_loc)- pos. of current cube
var
  len, i, j, m: integer;
begin
  len := length(cubes);
  setlength(result, len);
  for i := 0 to len - 1 do
  begin
    result[i, 1] := 0;
    result[i, 2] := 0;
  end;
  if (cubes[p, 1] = 0) or (cubes[p, 2] > 0) then
    exit;
    ///
  for i := p - 1 downto 0 do
    if cubes[i, 1] = 0 then
      result[i, 1] := len - abs(i + 1 - p) + 1
    else
    begin
      //for 2 line  left
      for j := i downto 0 do
        if cubes[j, 1] > 0 then
          if cubes[j, 2] = 0 then
            result[j, 2] := len - abs(j + 1 - p)
          else
            break
        else
          result[j, 1] := len - abs(j + 1 - p) - 1;
      break;
    end;
  for i := p + 1 to len - 1 do
    if cubes[i, 1] = 0 then
      result[i, 1] := len - abs(i + 1 - p) + 1
    else
    begin
      //for 2 line right
      for j := i to len - 1 do
        if cubes[j, 1] > 0 then
          if cubes[j, 2] = 0 then
            result[j, 2] := len - abs(j + 1 - p)
          else
            break
        else
          result[j, 1] := len - abs(j + 1 - p) - 1;
      break;
    end;       ///#2 method calc prior
end;

function priority_mas_1(const p: byte; const cubes: tm): tm;
  //cubes - array of cubes //p (ind_loc)- pos. of current cube
var
  len, i, j, m: integer;
begin
  len := length(cubes);
  setlength(result, len);
  for i := 0 to len - 1 do
  begin
    result[i, 1] := 0;
    result[i, 2] := 0;
  end;
  if (cubes[p, 1] = 0) or (cubes[p, 2] > 0) then
    exit;
    ///
  for i := p - 1 downto 0 do  //left
    if cubes[i, 1] = 0 then
      result[i, 1] := len - (p - i - 1)
    else if cubes[i, 2] = 0 then
      result[i, 2] := len - (p - i - 1) + 1
    else
      break;
  for i := p + 1 to len - 1 do  //right
    if cubes[i, 1] = 0 then
      result[i, 1] := len - (i + 1 - p)
    else if cubes[i, 2] = 0 then
      result[i, 2] := len - (i + 1 - p) + 1
    else
      break;  ///#1 method calc prior
end;

end.
 
