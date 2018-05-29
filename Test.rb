
class Prepare_Board

	def nine_nine
		i = 0
		j = 0
		$i_turn = 0
		$casillas = Hash.new(0)
		num = 0

		$block = { :empty => "   ", :to_r => "║   ", :mid => "═══",
	          :mid_to_r => "╬═══" }

	  while i<5
	  	if $i_turn==0
	  		j = 0
	  		while j<3
	  			num += 1
	  			$casillas[num] = " #{num} "
	  			j += 1
	   		end
   			print $casillas[num-2], "║", $casillas[num-1], "║", $casillas[num], "\n"
	   		$i_turn = 1
	  	else
	  		print $block[:mid], $block[:mid_to_r], $block[:mid_to_r], "\n"
	  		$i_turn=0
	  	end
		i += 1
		end
	end

	def play(casilla_seleccionada)
		k = 0 
		$serie_casilla = 0 
		print $casillas[casilla_seleccionada], "\n"
		$casillas[casilla_seleccionada] = " X "
		print $casillas[2], "\n"
		print $casillas[casilla_seleccionada], "\n"
		while k<5
	  	if $i_turn==1
	  		$serie_casilla += 3
   			print $casillas[$serie_casilla-2], "║", $casillas[$serie_casilla-1], "║", $casillas[$serie_casilla], "\n"
	   		$i_turn = 0
	  	else
	  		print $block[:mid], $block[:mid_to_r], $block[:mid_to_r], "\n"
	  		$i_turn=1
	  	end
		k += 1
		end
	end

end

main = Prepare_Board.new

main.nine_nine
main.play(gets)