const foo <- immutable class foo
  const x : Integer <- 47
  
end foo

const target <- object target
  var last : Any
  export operation doaccept [v : Any] -> [b : Boolean]
    b <- v == last
    last <- v
  end doaccept
end target

const tinv <- object tinv
  process
    const all <- (locate self)$activeNodes
    var str : String <- "this is a string" || "\n"
    move target to all[1]$theNode
    stdout.putstring[target.doaccept[str].asString || "\n"]
    stdout.putstring[target.doaccept[str].asString || "\n"]
    var f : Any <- foo.create
    stdout.putstring[target.doaccept[f].asString || "\n"]
    stdout.putstring[target.doaccept[f].asString || "\n"]
    f <- foo.create
    stdout.putstring[target.doaccept[f].asString || "\n"]
    stdout.putstring[target.doaccept[f].asString || "\n"]
  end process
end tinv
