% The intention of this program is to test whether an 3rd party emissary move
% with an unwelcome object can merge node graphs.

% This test requires three nodes in two different node graphs on the same local
% network, and should be run with the following programs:
    % graph 1:
        % node 1:               nodeup.x
        % node 2:               nodeup.x unwelcome_thrower.x
    % graph 2
        % discoverable node 1:  nodeup.x catcher.x

const ambassador <- object ambassador
    export op invokeMe
        (locate self)$stdout.putstring["I was invoked\n"]
    end invokeMe
end ambassador

const thrower <- object thrower
    const me <- locate self
    const all <- me$activeNodes

    process
        move ambassador to all[1]$theNode
        (locate ambassador)$stdout.putstring["Ambassador is here\n"]

        me$discoveredNodeEventHandler <- object myHandler
            export operation nodeup[ n : Node, t : Time]
                me$stdout.putstring["Discovered node up!\n"]

                stdout.putstring["Moving object away\n"]
                fix ambassador at n

                const didMove <- (locate ambassador) == n
                me$stdout.putstring["Object moved: " || didMove.asString || "\n"]
            end nodeup
            export operation nodedown[ n : Node, t : Time]
                me$stdout.putstring["Discovered node down!\n"]
            end nodedown
        end myHandler
    end process
end thrower