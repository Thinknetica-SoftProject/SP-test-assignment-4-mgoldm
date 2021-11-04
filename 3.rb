## Задача №3:
#
# Джон добрался до этажа с бомбой, но у него на пути стоит дверь с кодовым замком и рядом бумажка с инструкциями (файл data/3.txt)
#
# Чтобы узнать код от замка, ему нужно для каждой строки найти разницу между наибольшим и наименьшим числами и потом сложить полученные значения
#
## Требования к решению:
# - Входные данные находятся в файле data/3.txt (разделитель значений - символ табуляции)
# - Результат должен быть выведен в консоль командой puts
#
## Решение:
sum=0
f1=File.open('data/3.txt', 'r')

def is_number? string
  true if Float(string) rescue false
end

while (line = f1.gets)
  massiv=Array[]
  el=''
  for i in 0..line.length
    if is_number?(line[i])==true
      el=el+line[i].to_s
    elsif is_number?(line[i])==false
      b=el.to_i
      if b!=0
        massiv.push(b)
        el=''
      end
    end
  end
  rasn=massiv.max.to_i - massiv.min.to_i
  sum=sum+rasn
end
print(sum)
