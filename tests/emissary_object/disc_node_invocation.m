% The intention of this program is to test whether a discovered Node object
% reference becomes invocable after a successfull merge.

% This test requires two nodes in different node graphs in the same local
% network, and should be run with the following programs:
    % node 1:               nodeup.x disc_node_invocation.x
    % discoverable node 2:  nodeup.x catcher.x

const ambassador <- welcomable object ambassador
    export op invokeMe
        (locate self)$stdout.putstring["I was invoked\n"]
    end invokeMe
end ambassador

const thrower <- object thrower
    const me <- locate self

    process
        me$discoveredNodeEventHandler <- object myHandler
            export operation nodeup[ n : Node, t : Time]
                me$stdout.putstring["Discovered node up!\n"]

                begin
                    stdout.putstring["Invoking the node object before merge: "]
                    const now <- n$timeOfDay
                    stdout.putstring["success. Something is wrong\n"]

                    failure
                        stdout.putstring["failed as expected\n"]
                    end failure
                end

                fix ambassador at n

                begin
                    stdout.putstring["Invoking the node object after merge: "]
                    const now <- n$timeOfDay
                    stdout.putstring["success.\n"]

                    failure
                        stdout.putstring["failed. Something is wrong.\n"]
                    end failure
                end
            end nodeup

            export operation nodedown[ n : Node, t : Time]
                me$stdout.putstring["Discovered node down!\n"]
            end nodedown
        end myHandler
    end process
end thrower