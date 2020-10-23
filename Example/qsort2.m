%Program til at sortere linier med. Implementeret vha. array.
const arrayOfString <- array.of[String]

const quicksort <- 
	object quicksort %quicksort, efter kursusbog.
		operation srtstring[A : arrayOfString, min : integer, max : integer]
			var i, j : integer
			var k, split : string
			if max > min then
				i <- min 
				j <- max
				split <- A[(max+min)/2]
				loop
				exit when i > j
					loop
					exit when A[i] >= split
						i <- i + 1
					end loop
	
					loop
					exit when A[j] <= split
						j <- j - 1
					end loop

					if i <= j then
						k <- A[i] 
						A[i] <- A[j]
						A[j] <- k
						i <- i + 1
						j <- j -1
					end if
				end loop
			
				self.srtstring [A, min, j]
				self.srtstring [A, i, max]
			end if
		end srtstring
		export operation sortstring[A: arrayOfString]
			%stdout.putstring["Her er quicksort"]
			self.srtstring [A, A.lowerbound, A.upperbound]
		end sortstring
	end quicksort

const testobject
	<- object main % Dette object, er kun for at pro/ve. 
		var StrengeTabel : arrayOfString
		var laesstreng : string
		var n : integer
		process
			%stdout.Putstring["Tabellen initialiseres\n"]
			StrengeTabel <- (arrayOfString).empty			

			loop
			exit when stdin.eos
				%stdout.putstring["skriv en streng\n"]
				laesstreng <- stdin.getstring
				%stdout.putstring["Strengen forsoeges lagret i array\n"]
			    %stdout.putstring[(strengetabel.upperbound).asstring || "\n"]
			    %stdout.putstring[(strengetabel.lowerbound).asstring || "\n"]
					StrengeTabel.addUpper[laesstreng] %Haenger senest her.
			end loop

			%stdout.putstring["Quicksort kaldes"]
			quicksort.sortstring[StrengeTabel]


			for (n<- StrengeTabel.Lowerbound:n<= StrengeTabel.Upperbound:n<-n+1)
				%stdout.putstring["vi er i for lo/kken"]
				stdout.putstring[StrengeTabel.getElement[n] ] % || "\n"]
			end for
		end process
	end main
