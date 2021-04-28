% The intention of this program is to test whether the events related to node
% discovery are triggered at the right time.

% This test requires at least two nodes in the local network, where one is
% discoverable.

const main <- object main
    const me <- locate self

    process
        me$discoveredNodeEventHandler <-
            object myHandler
                export operation nodeUp[n : Node, t : Time]
                    stdout.putstring["A node has been discovered\n"]
                end nodeUp

                export operation nodeDown[n : Node, t : Time]
                    stdout.putstring["A discovered node is no longer around\n"]
                end nodeDown
            end myHandler
    end process
end main