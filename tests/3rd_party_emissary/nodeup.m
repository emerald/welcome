% Setup a node event handler to notify when new nodes are added to the node graph

const main <- object main
    const me <- locate self

    process
        me$nodeEventHandler <- object myHandler
            export operation nodeup[ n : Node, t : Time]
                const active <- me$activeNodes.upperbound + 1
                me$stdout.putstring["Node up! We are now " || active.asString || " nodes\n"]
            end nodeup

            export operation nodedown[ n : Node, t : Time]
                const active <- me$activeNodes.upperbound + 1
                me$stdout.putstring["Node down! We are now " || active.asString || " node(s)\n"]
            end nodedown
        end myHandler
    end process
end main