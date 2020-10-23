const movetons <- object movetons
  var hops : Integer <- 0
  const movee <- self
  const here <- locate self
  const alive <- here.getActiveNodes
  var x : Integer <- 0

  export op doacycle
    for i: Integer <- alive.upperbound while i >= 0 by i <- i - 1
      const thenode <- alive[i]$theNode
      move movee to thenode
      const out <- (locate self)$STDOUT
      const message <- Character.literal[x + 'a'.ord]
      x <- x + 1
      if x >= 26 then x <- 0 end if
      out.putChar[message]
      out.flush[]
    end for
  end doacycle

  process
    const howmany <- 1000
    const one <- Time.create[1, 0]
    var startTime, diff, mintime: Time
    mintime <- Time.create[1000000, 0]

    loop
      startTime <- here.getTimeOfDay
      for i : Integer <- 0 while i < howmany by i <- i + 1
	self.doacycle
      end for
      diff <- here.getTimeOfDay
      diff <- diff - startTime
      if diff < minTime then minTIme <- diff end if
      stdout.PutString[howmany.asString || " cycles of "||(alive.upperbound+1).asString||" took " || diff.asString || " min time " || minTime.asString || "\n"]
      here.delay[one]
    end loop
  end process
end movetons
