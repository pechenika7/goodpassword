program goodpassword;
var password:string;
    flag:boolean;
    err:integer;
    TS:set of char;



procedure PrintError; // Процедура вывода ошибок
begin
  case err of
  100: writeln ('Слишком короткий пароль');
  200: writeln ('Встречен недопустимый');
  end;
end;

    
    
function check(s:string; var error:integer):boolean;
var res:boolean;
begin
  err:=0;
  res:=true;
  if (length(s)<6) then 
  begin
    res:=false;
    error:=100;
  end;
  for var i:=1 to length(s) do
  begin
    if (not(s[i] in TS)) then 
    begin
      res:=false;
      error:=200;
    end;
  end;
  check:=res;
end;



begin
  TS:=['a','b','c'];
  err:=0;
  repeat
    if (err<>0)then PrintError;
    writeln ('введите пароль');
    readln (password);
  until (check(password,err));
  writeln ('Программа завкончила свою работу, пользуйтесь вашим надёжным паролем');
end.