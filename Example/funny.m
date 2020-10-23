const funny <- object funny
  var instvar : Any <- "I am a string"
  var instvars : String <- "I am also a string"

  % These ones assume that the thing you want is stored in 4 bytes, and
  % do the type cast to types that you might expect
  operation IndirInt [x : Integer] -> [r : Integer]
    primitive "INDIR" [r] <- [x]
  end IndirInt
  operation IndirReal [x : Integer] -> [r : Real]
    primitive "INDIR" [r] <- [x]
  end IndirReal
  operation IndirChar [x : Integer] -> [r : Character]
    primitive "INDIR" [r] <- [x]
  end IndirChar
  operation IndirBool [x : Integer] -> [r : Boolean]
    primitive "INDIR" [r] <- [x]
  end IndirBool

  % This one assumes that the thing that you want is stored in 4 bytes, but 
  % that you don't know what it is.
  operation IndirAny [x : Integer] -> [r : Any]
    primitive var "POOP" "INDIR" "PUSHCT" [r] <- [x]
  end IndirAny
  
  % This one assumes that the thing that you want is stored in 8 bytes,
  % starting at the given address
  operation IndirV [x : Integer] -> [r : Any]
    primitive var "INDIRV" [r] <- [x]
  end IndirV

  operation AnyToInt [s : Any] -> [r : Integer]
    primitive [r] <- [s]
  end AnyToInt

  operation AnyToString [s : Any] -> [r : String]
    primitive [r] <- [s]
  end AnyToString

  operation IntToString [s : Integer] -> [r : String]
    primitive [r] <- [s]
  end IntToString

  operation display [v : Any]
    stdout.putstring[nameof v]
    stdout.putchar[' ']
    if typeof v *> Integer then
      stdout.putint[self.AnyToInt[v], 0]
    elseif typeof v *> String then
      stdout.putstring[self.AnyToString[v]]
    end if
    stdout.putchar['\n']
  end display

  process
    const s <- "abc"
    var x : Integer <- self.AnyToInt[s]
    var y : Integer
    var z : Any

    stdout.putint[x, 0]
    stdout.putchar['\n']
    y <- self.IndirInt[x]
    stdout.putint[y, 0]
    stdout.putchar['\n']
    y <- self.IndirInt[x + 4]
    stdout.putint[y, 0]
    stdout.putchar['\n']
    y <- self.IndirInt[x + 8]
    stdout.putint[y, 0]
    stdout.putchar['\n']
    z <- self.IndirV[self.AnyToInt[self] + 4]
    self.display[z]
    z <- self.IndirAny[self.AnyToInt[self] + 12]
    self.display[z]
    z <- self.IndirAny[self.AnyToInt[self] + 16]
    self.display[z]
  end process
end funny
