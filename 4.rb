## Задача №4:
#
# В соседнем районе рождественские эльфы готовят подарки для жителей города.
# Для каждого подарка (файл data/4.txt) нужно найти сколько оберточной бумаги потребуется.
# Формула рассчета: 2*ш*д + 2*д*в + 2*в*ш + площадь наименьшей стороны
# Например, на подарок размером 2х3х4 требуется 2*6 + 2*12 + 2*8 = 52 + 6 кв. см.
#
# Сколько всего оберточной бумаги нужно купить эльфам?
#
## Требования к решению:
# - Входные данные находятся в файле data/4.txt
# - В значениях данные длины, ширины и высоты не упорядочены и могут идти в любом порядке, однако
# длина всегда наименьшее число из трех, высота - среднее, ширина - самое большое.
# - Результат должен быть выведен в консоль командой puts
#
#
## Решение:
f1 = File.open('data/4.txt', 'r')
summa=0
def is_number? string
  true if Float(string) rescue false
end

while (line = f1.gets)
  #puts (line)
  massiv = Array[]
  el = ''
  for i in 0..line.length
    #puts(line.length)
    if is_number?(line[i])==true
      el = el + line[i].to_s
    elsif is_number?(line[i])==false
      b = el.to_i
      #puts(b)
      if b!=0
        massiv.push(b)
        el = ''
      end
    end

  end
  maxim=massiv.max
  minim=massiv.min
  for i in 0..massiv.length
    if massiv[i].to_i<maxim and massiv[i].to_i>minim
      sred=massiv[i]
    end
  end
  #Формула рассчета: 2*ш*д + 2*д*в + 2*в*ш + площадь наименьшей стороны
  formula=(2*maxim*minim)+(2*minim*sred)+(2*sred*maxim)+(minim*sred)
  summa = summa + formula
end
puts(summa)

