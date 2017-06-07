=begin
  You will be creating a program that is similar to Connect 4, but not the full game. (Feel free to proceed to create the full game if you'd like, though!)

Start by creating a board. The board should consist of an array of arrays (a.k.a. 2 dimensional array)
=end


board = []
7.times do
  line =[]
  6.times do
  line<< "-"
  end
board<< line
end
user_input = gets().chomp
until user_input == "board"
#else
  puts "type \"board\" without quote to start the game"
  user_input = gets().chomp
end
board.each do |line|
  puts line.join
end
i=0
j=1
until board == []
puts "choose a column number"
c = gets().chomp.to_i 
#duplicate_board = board.dup
i=0
while i>= 0 
if board[6-i][c]!= "x" 
board[6-i][c]= "x"
j=1
break
else
  board[6-j-i][c]= "x"
  j+=1
break
end

end
board.each do |line|
  puts line.join
end
end