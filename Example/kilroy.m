const Kilroy <- object Kilroy
  var counter : Integer <- 1
  process
    const home <- locate self
    const all <- home.getActiveNodes

    home.getstdout.PutString["Starting on " || home.getname || "\n"]
    home.getstdout.PutString[(all.upperbound + 1).asString || " nodes active.\n"]
    const startTime <- home.getTimeOfDay
    for e in all
      const there <- e.getTheNode
      move Kilroy to there
      there.getstdout.PutString["Kilroy was here " || counter.asString || "\n"]
      counter <- counter + 1
    end for
    move Kilroy to home
    const diff <- home.getTimeOfDay - startTime
    home.getstdout.PutString["Back home " || counter.asString || ".  Total time = " || diff.asString || "\n"]
  end process
end Kilroy
