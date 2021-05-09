const PollDiscList <- object PollDiscList
    const me <- locate self
    var list : NodeList

    process
        me$discoveredNodeEventHandler <- object h
            export operation nodeup[ n : Node, t : Time]
                me$stdout.putstring["discovered node up!\n"]
            end nodeup
            export operation nodedown[ n : Node, t : Time]
                me$stdout.putstring["discovered node down!\n"]
            end nodedown
        end h

        loop
            list <- me$discoveredNodes
            me$stdout.putstring["Discovered nodes: "]
            if list.upperbound < 0 then
                me$stdout.putstring["none\n"]
            else
                me$stdout.putstring[(list.upperbound + 1).asString || "\n"]
                for d in list
                    me$stdout.putstring["\t" || d$LNN.asString || "\n"]
                end for
            end if
            (locate self).delay[Time.create[3, 0]]
        end loop
    end process
end PollDiscList