const inner <- object inner
  export operation stuff 
    primitive "NCCALL" "MISK" "UEXIT" [] <- [0]
  end stuff
end inner

const target <- object target
  export operation stuff 
    inner.stuff
  end stuff
end target

const Driver <- object Driver
  process
    const home <- locate self
    var there :     Node
    var all : NodeList

    home$stdout.PutString["Starting on " || home$name || "\n"]
    all <- home.getActiveNodes
    home$stdout.PutString[(all.upperbound + 1).asString || " nodes active.\n"]
    there <- all[1]$theNode
    move target to all[1]$theNode
    move inner to all[2]$theNode
    target.stuff
  unavailable
    stdout.putstring["Driver caught unavailable\n"]
  end unavailable
  failure
    stdout.putstring["Driver caught failure\n"]
  end failure
  end process
end Driver 
