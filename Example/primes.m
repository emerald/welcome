const driver <- object driver
  initially
    const limit <- 10000
    const primes <- Vector.of[Integer].create[limit]
    var howmany : Integer <- 0
    var j : Integer
    for i : Integer <- 2 while i < limit by i <- i + 1
      j <- 0
      loop
	exit when j >= howmany or i # primes[j] = 0
	j <- j + 1
      end loop
      if j >= howmany then
	primes[howmany] <- i
	howmany <- howmany + 1
	stdout.putint[i, 0]
	stdout.putchar['\n']
      end if
    end for
  end initially
end driver
